import 'package:flutter/material.dart';
import 'package:movie_app/Tablet_grid_view_builder.dart';
import 'package:movie_app/custom_drawer.dart';
import 'package:movie_app/Mobile_grid_view_builder.dart';
import 'dart:developer' as dev;

import 'package:movie_app/list_view_section.dart';

//TODO: craetea neavigator service
void main() {
  runApp(Course_Assisted_Ui_Testing());
}

class Course_Assisted_Ui_Testing extends StatefulWidget {
  const Course_Assisted_Ui_Testing({super.key});

  @override
  State<Course_Assisted_Ui_Testing> createState() =>
      _Course_Assisted_Ui_TestingState();
}

class _Course_Assisted_Ui_TestingState
    extends State<Course_Assisted_Ui_Testing> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.sizeOf(context);
    dev.log("${data.height.toString()} ${data.width.toString()}");
    return MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        drawer: const CustomDrawer(),
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.menu, color: Colors.white),
            onTap: () => scaffoldKey.currentState!.openDrawer(),
          ),
          title: const Text('app demo', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              //Mobile Ui
              return MobileUiScrollUi(count: 9, data: data);
            } else if (constraints.maxWidth < 900) {
              //Tablet Ui
              return TabletScroolUi();
            } else {
              return DeskTopUi();
            }
          },
        ),
      ),
    );
  }
}

class DeskTopUi extends StatelessWidget {
  const DeskTopUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [CustomDrawer(), Expanded(child: TabletScroolUi())]);
  }
}

class TabletScroolUi extends StatelessWidget {
  const TabletScroolUi({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: TabletGridBoxWidget(count: 10)),
        ListViewSection(),
      ],
    );
  }
}

class MobileUiScrollUi extends StatelessWidget {
  const MobileUiScrollUi({super.key, required this.count, required this.data});

  final int count;
  final Size data;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [MobileGridBoxWidget(), ListViewSection()],
    );
  }
}
