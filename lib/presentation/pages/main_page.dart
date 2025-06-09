import 'package:flutter/material.dart';
import 'package:recipa/presentation/pages/home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Center(
        child: TextButton(onPressed:()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage())),child: Text("To Home page")),
      )
    );
  }
}
