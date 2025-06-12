import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipa/presentation/pages/a_to_z_page.dart';
import 'package:recipa/presentation/pages/home_page.dart';
import 'package:recipa/presentation/pages/search_page.dart';

import 'account_page.dart';
import 'favourite_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;
  List<Widget> pages = [
    HomePage(),
    AToZPage(),
    SearchPage(),
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
                    elevation: 0,
                    destinations: [
                      NavigationRailDestination(icon: Icon(Icons.home),label: Text("Home")),
                      NavigationRailDestination(icon: Icon(Icons.abc),label: Text("A-Z")),
                      NavigationRailDestination(icon: Icon(Icons.bookmark_outline),label: Text("Saved")),
                      NavigationRailDestination(icon: Icon(Icons.person_2_outlined),label: Text("Account")),
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
                  BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
                  BottomNavigationBarItem(icon: Icon(Icons.abc),label: "A-z"),
                  BottomNavigationBarItem(icon: Icon(Icons.bookmark_outline),label: "Saved"),
                  BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: "Account"),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
