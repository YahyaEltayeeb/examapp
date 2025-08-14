// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:examapp/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class GuidelinesWidget extends StatelessWidget {
  final String text;
  const GuidelinesWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.circle, color: AppColors.grey, size: 5),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(color: AppColors.grey),
          ),
        ),
      ],
    );
  }
}
