import 'package:flutter/material.dart';
import 'package:ozi_flutter/home_screen.dart';
import 'package:ozi_flutter/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainAppState();
  }
}

class _MainAppState extends State<MainApp> {
  bool inDarkMode = false;

  void toggleTheme(){
    setState(() {
      inDarkMode = !inDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
          useMaterial3: true,
          colorScheme: inDarkMode ? oziDarkColorScheme : oziLightColorScheme
      ),

      home: Scaffold(
        body: SafeArea(
          child: Center(
            // child: HomeScreen(),
            child: ThemeSwitch(inDarkMode: inDarkMode, onToggle: toggleTheme),
          ),
        ),
      ),
    );
  }

}
