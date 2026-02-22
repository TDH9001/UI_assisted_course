import 'package:flutter/material.dart';

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
            margin: EdgeInsets.fromLTRB(12, 8, 12, 7),
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
