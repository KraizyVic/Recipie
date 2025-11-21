import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:recipie/presentation/pages/settings_pages/general_settings_page.dart';
import 'package:recipie/presentation/pages/settings_pages/history_page.dart';
import 'package:recipie/presentation/pages/settings_pages/look_n_feel_page.dart';
import 'package:recipie/presentation/pages/settings_pages/privacy_policy_page.dart';
import 'package:recipie/presentation/pages/settings_pages/terms_and_conditions_page.dart';

import '../../core/update/download_service.dart';
import '../../core/update/method_chanel.dart';
import '../../core/update/update_service.dart';
import '../../core/update/version_helper.dart';
import '../widgets/Update_widgets.dart';
class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  double _progress = 0.0;
  bool _isDownloading = false;
  bool _cancelRequested = false;
  final PageController _pageController = PageController();
  int page = 0;
  late Future<PackageInfo> _packageInfo ;

  @override
  void initState() {
    super.initState();
    _packageInfo = getPackageInfo();
  }

  Future<PackageInfo> getPackageInfo() async{
    return await PackageInfo.fromPlatform();
  }

  /// 🧠 Async update check running after first frame
  Future<void> _checkForUpdate() async {
    try {
      final updateService = UpdateService(
        repoOwner: 'KraizyVic',
        repoName: 'Uanimurs',
      );
      showDialog(context: context, builder: (_){
        return const Center(child: CircularProgressIndicator(),);
      });
      final update = await updateService.checkForUpdate().timeout(const Duration(seconds: 20), onTimeout: () => null);
      if (mounted) Navigator.of(context).pop();
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
                        content: Text('No APK attached to release.')),
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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.symmetric(horizontal: 20),
              title: Row(
                children: [
                  const Icon(Icons.settings),
                  const SizedBox(width: 10,),
                  const Text("Settings",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                ],
              ),
              background: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      image: DecorationImage(image: AssetImage("lib/core/assets/food_doodles.png"),fit: BoxFit.cover),
                    ),
                  ),
                  /*Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        end: .center,
                        colors: [
                          Theme.of(context).colorScheme.surface,
                          Theme.of(context).colorScheme.surface.withAlpha(0),
                        ],
                      )
                    ),
                  ),*/
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: .bottomCenter,
                        end: .topCenter,
                        colors: [
                          Theme.of(context).colorScheme.surface,
                          Theme.of(context).colorScheme.surface.withAlpha(0),
                        ],
                      )
                    ),
                  )
                ],
              )
            )
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.widgets ,color: Theme.of(context).colorScheme.primary,),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    title: const Text("General"),
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const GeneralSettingsPage())),
                  ),
                  ListTile(
                    leading: Icon(Icons.color_lens,color: Theme.of(context).colorScheme.primary,),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    title: const Text("Look N Feel"),
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const LookNFeelPage())),
                  ),
                  ListTile(
                    leading: Icon(Icons.history, color: Theme.of(context).colorScheme.primary,),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    title:  Text("History"),
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const HistoryPage())),
                  ),
                  ListTile(
                    leading: Icon(Icons.info, color: Theme.of(context).colorScheme.primary,),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    title: const Text("About"),
                    onTap: (){},
                  ),
                  ListTile(
                    leading: Icon(Icons.privacy_tip, color: Theme.of(context).colorScheme.primary,),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    title: const Text("Privacy policy"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const PrivacyPolicyPage()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.description , color: Theme.of(context).colorScheme.primary,),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    title: const Text("Terms and conditions"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const TermsAndConditionsPage()));
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.download, color: Theme.of(context).colorScheme.primary,),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    title: const Text("Check for update"),
                    onTap: _checkForUpdate,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
