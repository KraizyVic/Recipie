import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:recipie/core/constants.dart';
import '../../core/dependency_injector.dart';
import '../../core/update/download_service.dart';
import '../../core/update/method_chanel.dart';
import '../../core/update/update_service.dart';
import '../../core/update/version_helper.dart';
import '../../domain/entities/home_page_entity.dart';
import '../../domain/use_cases/home_page_use_cases.dart';
import '../widgets/Update_widgets.dart';
import 'settings_page.dart';
import 'cook_book.dart';
import 'groceries_page.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;
  late Future<HomePageEntity> _homePageItemsFuture;

  final PageController _pageController = PageController();
  int page = 0;

  @override
  void initState() {
    super.initState();
    // check for updates after UI builds (non-blocking)
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkForUpdate());
    _homePageItemsFuture = sl<FetchHomeItemsUseCase>().call();
  }

  Future<PackageInfo> getPackageInfo() async{
    return await PackageInfo.fromPlatform();
  }

  /// 🧠 Async update check running after first frame
  Future<void> _checkForUpdate() async {
    try {
      final updateService = UpdateService(
        repoOwner: repoOwner,
        repoName: repoName,
      );

      final update = await updateService.checkForUpdate().timeout(const Duration(seconds: 20), onTimeout: () => null);

      if (update != null && await VersionHelper.isUpdateAvailable(update['version'] ?? '0.0.0')) {
        // Show update modal
        if (mounted) {
          showModalBottomSheet(
            context: context,
            builder: (_) => UpdateModal(
              version: update['version'] ?? '',
              changelog: update['changelog'] ?? '',
              onUpdate: () {
                Navigator.of(context).pop(); // close bottom sheet
                if (update['apkUrl'] != null) {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdatePage(url: update['apkUrl'])));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No APK attached to release.')
                    ),
                  );
                }
              },
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('⚠️ Update check failed: $e');
    }
  }

  Future<void> _refreshData() async {
    // For manual refresh
    setState(() {
      _homePageItemsFuture = sl<FetchHomeItemsUseCase>().call();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent
      ),
      child: FutureBuilder(
        future: _homePageItemsFuture,
        builder: (context,snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 10,),
                    Text("Loading please wait...")
                  ],
                ),
              )
            );
          }
          if(snapshot.hasError){
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    Icon(Icons.error_outline,color: Colors.red,size: 50,),
                    SizedBox(height: 20,),
                    Text("Error fetching Data please try again later",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Expanded(
                          child: MaterialButton(
                            onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>GroceriesPage())),
                            shape: RoundedRectangleBorder(side: BorderSide(color: Theme.of(context).colorScheme.primary),borderRadius: BorderRadius.circular(10)),
                            child: Text("Groceries"),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: MaterialButton(
                            onPressed: _refreshData,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            color: Theme.of(context).colorScheme.primary,
                            elevation: 0,
                            child: Text("Retry"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            );
          }
          List<Widget> pages = [
            HomePage(homePageEntity: snapshot.data!),
            GroceriesPage(),
            CookBook(),
            AccountPage(),
          ];

          return Scaffold(
            body: pages[currentPageIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentPageIndex,
              type: BottomNavigationBarType.fixed,
              onTap: (index){
                setState(() {
                  currentPageIndex = index;
                });
              },
              selectedItemColor: Theme.of(context).colorScheme.primary,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: false,
              elevation: 0,
              items: [
                BottomNavigationBarItem(icon: Icon(currentPageIndex != 0 ? Icons.home_outlined : Icons.home ),label: "Home"),
                BottomNavigationBarItem(icon: Icon(currentPageIndex != 1 ? Icons.shopping_bag_outlined : Icons.shopping_bag),label: "Groceries"),
                BottomNavigationBarItem(icon: Icon(currentPageIndex != 2 ? Icons.bookmark_border : Icons.bookmark),label: "Saved"),
                BottomNavigationBarItem(icon: Icon(currentPageIndex != 3 ? Icons.settings_outlined : Icons.settings),label: "Settings"),
              ],
            ),
          );
        }
      ),
    );
  }
}
