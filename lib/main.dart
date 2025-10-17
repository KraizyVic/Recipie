import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipie/core/dependency_injector.dart';
import 'package:recipie/presentation/pages/main_page.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipie',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF00674B),
          brightness: Brightness.light,
          primary: Colors.blue,
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
      home: const MainPage(),
    );
  }
}


