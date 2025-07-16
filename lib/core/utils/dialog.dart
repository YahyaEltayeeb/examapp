import 'package:flutter/material.dart';

class UtilsDialog extends StatelessWidget {
  UtilsDialog({super.key, required this.text});
  String text;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      insetAnimationDuration: Duration(seconds: 5),
      child: Text(text),
    );
  }
}
