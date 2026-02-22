import 'package:flutter/material.dart';

class MobileGridBoxWidget extends StatelessWidget {
  MobileGridBoxWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.sizeOf(context);

    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
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
      itemCount: 4,
    );
  }
}
