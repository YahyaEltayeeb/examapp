// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:examapp/core/theme/app_colors.dart';

class CustomCard extends StatelessWidget {
  void Function()? onTapCard;
  final Widget widget;
  CustomCard({super.key, required this.widget, this.onTapCard,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: GestureDetector(
        onTap: onTapCard,
        child: Card(
          borderOnForeground: true,
          color: AppColors.white,
          child: widget,
        ),
      ),
    );
  }
}
