import 'package:flutter/material.dart';

class TabletGridBoxWidget extends StatelessWidget {
  final int count;
  TabletGridBoxWidget({super.key, required this.count});
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.sizeOf(context);

    return SizedBox(
      height: data.height / 6,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return AspectRatio(
            aspectRatio: 1,
            child: Padding(
              padding: EdgeInsets.all(6),

              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 180, 180, 180),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
