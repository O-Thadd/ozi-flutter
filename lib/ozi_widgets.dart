import 'package:flutter/material.dart';
import 'package:ozi_flutter/theme.dart';

class Avi extends StatelessWidget {
  const Avi(
      {super.key, required this.size, required this.fg, required this.bg});

  final int fg;
  final int bg;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: getAviBgColor(bg: bg),
      ),
      width: size,
      padding: EdgeInsets.all(size / 10),
      child: Image.asset(
        'assets/images/avis/avi$fg.png',
      ),
    );
  }
}

Color getAviBgColor({required int bg}) {
  return switch (bg) {
    1 => oziAviRedBGLight,
    2 => oziAviBlueBGLight,
    3 => oziAviGreenBGLight,
    _ => Colors.grey
  };
}
