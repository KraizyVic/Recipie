import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'account_page.dart';
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
  List<Widget> pages = [
    HomePage(),
    GroceriesPage(),
    CookBook(),
    AccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent
      ),
      child: LayoutBuilder(
        builder: (context, constraints){
          if(constraints.maxWidth > 600){
            return Scaffold(
              body: Row(
                children: [
                  NavigationRail(
                    selectedIndex: currentPageIndex,
                    onDestinationSelected: (index){
                      setState(() {
                        currentPageIndex = index;
                      });
                    },
                    indicatorColor: Theme.of(context).colorScheme.primary,
                    selectedLabelTextStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                    labelType: NavigationRailLabelType.none,

                    destinations: [
                      NavigationRailDestination(icon: Icon(Icons.home),label: Text("Home")),
                      NavigationRailDestination(icon: Icon(Icons.abc),label: Text("A-Z")),
                      NavigationRailDestination(icon: Icon(Icons.shopping_bag),label: Text("Saved")),
                      NavigationRailDestination(icon: Icon(Icons.settings),label: Text("Settings")),
                    ]
                  ),
                  Expanded(child: pages[currentPageIndex])
                ]
              )
            );
          }else{
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
        },
      ),
    );
  }
}
