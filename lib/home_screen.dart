import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey,
          padding: const EdgeInsets.all(16),
          child: const Row(
            children: [
              ImageIcon(
                AssetImage('assets/images/ozi_icon.png'),
                size: 40,
                color: Color(0xFF1C55FC),
              ),
              Text(
                "Ozi home screen top bar title",
                style: TextStyle(fontFamily: 'ErasB', fontSize: 20),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({super.key, required this.inDarkMode, required, required this.onToggle });

  final bool inDarkMode;
  final Function() onToggle;

  @override
  State<StatefulWidget> createState() {
    return _ThemeSwitchState();
  }
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  // Widget image = const SunImage();
  // Color insideColour = Colors.white12;

  void toggleMode() {
    setState(() {
      // inDarkMode = !inDarkMode;
      // image = inDarkMode ? const MoonImage() : const SunImage();
      // insideColour = Theme.of(context).colorScheme.surface;

      widget.onToggle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleMode,
      child: AnimatedContainer(
        width: 100,
        height: 60,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF1C55FC), width: 4),
            borderRadius: BorderRadius.circular(50),
            color: Theme.of(context).colorScheme.surface,
        ),
        duration: const Duration(milliseconds: 500),
        child: AnimatedAlign(
          alignment: widget.inDarkMode ? Alignment.centerRight : Alignment.centerLeft,
          duration: const Duration(milliseconds: 200),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFF000146),
              borderRadius: BorderRadius.circular(20),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              // transitionBuilder: (Widget child, Animation<double> animation) {
              //     return RotationTransition(turns: animation, child: child,);
              // },
              child: widget.inDarkMode ? const MoonImage() : const SunImage(),
            ),
          ),
        ),
      ),
    );
  }
}

class SunImage extends StatelessWidget {
  const SunImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ImageIcon(
      AssetImage('assets/images/sun.png'),
      color: Colors.white,
      size: 30,
    );
  }
}

class MoonImage extends StatelessWidget {
  const MoonImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ImageIcon(
      AssetImage('assets/images/moon.png'),
      color: Colors.white,
      size: 30,
    );
  }
}
