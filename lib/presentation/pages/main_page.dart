import 'package:flutter/material.dart';
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
    SearchPage(),
    FavouritePage(),
    AccountPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
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
                  labelType: NavigationRailLabelType.all,
                  destinations: [
                    NavigationRailDestination(icon: Icon(Icons.home),label: Text("Home")),
                    NavigationRailDestination(icon: Icon(Icons.search),label: Text("Search")),
                    NavigationRailDestination(icon: Icon(Icons.favorite_border),label: Text("Favourite")),
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
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
                BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: "Favourite"),
                BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: "Account"),
              ],
            ),
          );
        }
      },
    );
  }
}
