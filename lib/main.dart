import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipie/core/dependency_injector.dart';
import 'package:recipie/domain/entities/settings_page_entities.dart';
import 'package:recipie/presentation/pages/main_page.dart';
import 'package:recipie/presentation/state_management/settings_page_cubit.dart';

/// Initializes and runs the application.
void main() async{
  // Ensures that the Flutter binding has been initialized.
  WidgetsFlutterBinding.ensureInitialized();
  // Sets the application to run in edge-to-edge mode.
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  // Sets up the service locator for dependency injection.
  await setupLocator();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>LookAndFeelCubit()),
        BlocProvider(create: (context)=>SearchHistoryCubit()),
      ],
      child: BlocBuilder<LookAndFeelCubit,LookAndFeelEntity>(
        builder: (context,state) {
          return MaterialApp(
            title: 'Recipie',
            debugShowCheckedModeBanner: false,
            themeMode: state.themeMode == 0 ? ThemeMode.system : state.themeMode == 1 ? ThemeMode.light : ThemeMode.dark ,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Color(state.seedColor),
                brightness: Brightness.light,
                primary: Color(state.primaryColor),
                tertiary: Colors.black,
                onTertiary: Colors.white,
              ),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Color(state.seedColor),
                brightness: Brightness.dark,
                primary: Color(state.primaryColor),
                surface: state.isAmoledBackground ? Colors.black : null,
                tertiary: Colors.white,
                onTertiary: Colors.black,
              ),
              useMaterial3: true,
            ),
            home: const MainPage(),
          );
        }
      ),
    );
  }
}