import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  QuestionWidget({super.key, required this.question});
  String question;

  @override
  Widget build(BuildContext context) {
    return Column(children: [LinearProgressIndicator(), Text(question)]);
  }
}
