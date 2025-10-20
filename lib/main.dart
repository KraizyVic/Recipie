import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipie/core/dependency_injector.dart';
import 'package:recipie/presentation/pages/main_page.dart';

/// Initializes and runs the application.
void main() {
  // Ensures that the Flutter binding has been initialized.
  WidgetsFlutterBinding.ensureInitialized();
  // Sets the application to run in edge-to-edge mode.
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  // Sets up the service locator for dependency injection.
  setupLocator();
  // Runs the application.
  runApp(const MyApp());
}

/// The root widget of the application.
class MyApp extends StatelessWidget {
  /// Creates a new instance of the application root widget.
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
          seedColor: const Color(0xFF00674B),
          brightness: Brightness.light,
          primary: Colors.blue,
          tertiary: Colors.black,
          onTertiary: Colors.white,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00674B),
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