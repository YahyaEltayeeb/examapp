import 'package:examapp/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  const AnswerWidget(this.isSelected, this.answer, this.onTap, {super.key});
  final bool isSelected;
  final String answer;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        foregroundDecoration: BoxDecoration(
          color: isSelected ? AppColors.grey : AppColors.lightBlue,
        ),
        decoration: BoxDecoration(),
        child: Row(
          children: [
            Icon(isSelected ? Icons.radio_button_on : Icons.radio_button_off),
            Text(answer),
          ],
        ),
      ),
    );
  }
}
