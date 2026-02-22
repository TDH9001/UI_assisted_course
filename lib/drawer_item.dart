import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon_from_parent;
  final String text;
  const DrawerItem({
    super.key,
    required this.icon_from_parent,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon_from_parent, size: 28),
      title: Text(text),
      style: ListTileStyle.drawer,
    );
  }
}
