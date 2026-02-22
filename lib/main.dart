import 'package:flutter/material.dart';
import 'package:movie_app/Tablet_grid_view_builder.dart';
import 'package:movie_app/custom_drawer.dart';
import 'package:movie_app/Mobile_grid_view_builder.dart';
import 'dart:developer' as dev;

import 'package:movie_app/list_view_section.dart';

//TODO: craetea neavigator service
void main() {
  runApp(Course_assisted_ui_testing());
}

class Course_assisted_ui_testing extends StatefulWidget {
  const Course_assisted_ui_testing({super.key});

  @override
  State<Course_assisted_ui_testing> createState() =>
      _Course_assisted_ui_testingState();
}

class _Course_assisted_ui_testingState
    extends State<Course_assisted_ui_testing> {
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
            if (constraints.maxWidth > 600) {
              //Mobile Ui
              return MobileUiScrollUi(count: 9, data: data);
            } else if (constraints.maxWidth < 900 &&
                constraints.maxWidth > 600) {
              //Tablet Ui
              return TabletScroolUi(data: data);
            } else {
              return Container();
            }
          },
        ),
      ),
      routes: {
        //'/': (context) => const MyHomePage(),
      },
      // initialRoute:'/',
    );
  }
}

class TabletScroolUi extends StatelessWidget {
  const TabletScroolUi({super.key, required this.data});

  final Size data;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: TabletGridBoxWidget(count: 10)),
        ListViewSection(data: data),
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
      slivers: [MobileGridBoxWidget(), ListViewSection(data: data)],
    );
  }
}
