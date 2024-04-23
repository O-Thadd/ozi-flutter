import 'package:flutter/cupertino.dart';

class MenuData {
  const MenuData(this.name, this.action, this.icon);

  final String name;
  final void Function() action;
  final IconData icon;
}