import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  static const List<Widget> drawerItemList = [
    DrawerItem(icon_from_parent: Icons.home, text: "Home"),
    DrawerItem(icon_from_parent: Icons.settings, text: "Settings"),
    DrawerItem(icon_from_parent: Icons.sync_problem_outlined, text: "About"),
    DrawerItem(icon_from_parent: Icons.exit_to_app, text: "Logout"),
  ];

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      backgroundColor: Color.fromARGB(255, 213, 210, 216),
      child: Column(
        children: [
          DrawerHeader(child: Icon(FontAwesomeIcons.solidHeart, size: 50)),
          Expanded(child: ListTilesListView(drawerItemList: drawerItemList)),
        ],
      ),
    );
  }
}

class ListTilesListView extends StatelessWidget {
  const ListTilesListView({super.key, required this.drawerItemList});

  final List<Widget> drawerItemList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => drawerItemList[index],
      itemCount: drawerItemList.length,
    );
  }
}
