import 'package:flutter/material.dart';

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
