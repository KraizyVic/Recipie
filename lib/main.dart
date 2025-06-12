import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipa/presentation/pages/main_page.dart';

import 'core/locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Recipa',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF00674B),
          brightness: Brightness.light,
          primary: Color(0xFF00674B),
          tertiary: Colors.black,
          onTertiary: Colors.white,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF00674B),
          brightness: Brightness.dark,
          primary: Colors.lightGreenAccent,
          tertiary: Colors.white,
          onTertiary: Colors.black,
        ),
        useMaterial3: true,
      ),
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

