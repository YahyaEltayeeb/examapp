import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.foregroundColor,
    required this.text,
    required this.backgroundColor,
    required this.onTap,
    TextStyle? style, required this.borderColor,

  });
  final String text;
  final Color foregroundColor;
  final Color backgroundColor;
  final void Function()? onTap;
  final Color borderColor;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(side: BorderSide(color:borderColor),
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
      ),

      child: Text(text),
    );
  }
}
