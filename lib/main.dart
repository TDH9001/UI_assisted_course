import 'package:flutter/material.dart';
import 'package:movie_app/grid_view_builder.dart';
import 'dart:developer' as dev;

import 'package:movie_app/list_view_section.dart';

//TODO: craetea neavigator service
void main() {
  runApp(Course_assisted_ui_testing());
}

class Course_assisted_ui_testing extends StatelessWidget {
  const Course_assisted_ui_testing({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var data = MediaQuery.sizeOf(context);
    dev.log("${data.height.toString()} ${data.width.toString()}");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [],
          leading: Icon(Icons.menu, color: Colors.white),
          title: const Text('app demo', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            int count = 2;
            if (constraints.maxWidth < 550 && constraints.maxWidth > 300) {
              count = (constraints.maxWidth / 200).toInt();
            } else if (constraints.maxWidth < 1100 &&
                constraints.maxWidth > 550) {
              count = (constraints.maxWidth / 250).toInt();
            } else if (constraints.maxWidth > 1100) {
              count = (constraints.maxWidth / 350).toInt();
            }
            return CustomScrollView(
              slivers: [
                GridBoxWidget(count: count),
                ListViewSection(data: data),
              ],
            );
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
