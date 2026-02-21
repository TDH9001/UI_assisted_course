import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:developer' as dev;
//FIXME: IM ABCK BABY

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
            if (constraints.maxWidth > 600) {
              count = (constraints.maxWidth / 250.0).toInt();
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

class GridBoxWidget extends StatelessWidget {
  final int count;
  GridBoxWidget({super.key, required this.count});
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.sizeOf(context);

    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: count,
      ),
      itemBuilder: (BuildContext context, int index) {
        return AspectRatio(
          aspectRatio: 1 / 8,
          child: Container(
            margin: EdgeInsets.all(7),
            height: data.height / 4,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 180, 180, 180),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
      itemCount: 10,
    );
  }
}

class ListViewSection extends StatelessWidget {
  final Size data;
  const ListViewSection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(8),
          color: Colors.black,
          width: double.infinity,
          height: data.height / 8,
        );
      },
    );
  }
}
