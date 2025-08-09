import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoaddingWidget extends StatelessWidget {
  const LoaddingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          enabled: true,
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,

          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              width: double.infinity,
              height: 50,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
