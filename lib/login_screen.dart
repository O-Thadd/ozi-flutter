import 'package:flutter/material.dart';
import 'package:ozi_flutter/test_instances.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.inDarkMode, required this.toggleTheme});

  final bool inDarkMode;
  final void Function() toggleTheme;

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                      fillColor: Theme.of(context).colorScheme.surface,
                      filled: true,
                      hintText: 'Username',
                      hintStyle: Theme.of(context).textTheme.bodyMedium),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                      fillColor: Theme.of(context).colorScheme.surface,
                      filled: true,
                      hintText: 'Password',
                      hintStyle: Theme.of(context).textTheme.bodyMedium),
                ),
                const SizedBox(height: 64),
                FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(
                          thisUser: uiTestUser1,
                          chats: testPairChats1,
                          // chats: const [],
                          inDarkMode: widget.inDarkMode,
                          toggleTheme: widget.toggleTheme,
                        ),
                      ),
                    );
                  },
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
