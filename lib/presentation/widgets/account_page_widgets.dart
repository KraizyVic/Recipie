import 'package:flutter/material.dart';

Widget profileTile(BuildContext context){
  return SizedBox(
    width: double.maxFinite,
    height: 300,
    child: Column(
      children: [
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Profile",style: TextStyle(color: Colors.white),),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.logout,color: Colors.red,),tooltip: "logout",)
          ],
        ),
        Expanded(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.tertiary.withAlpha(100)
                        )
                      ),
                      Center(child: Icon(Icons.person,size: 50,color: Colors.white.withAlpha(200)),)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text("John Doe",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 5),
              Text("janedoe123@gmail.doe",)
            ],
          ),
        ),

      ]
    ),
  );
}

Widget profileNotLoggedInTile(){
  return Container();
}