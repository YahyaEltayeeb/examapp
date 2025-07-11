import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Padding(
          padding: const EdgeInsets.all(24),
          child: TextFormField(decoration: InputDecoration(label: Text('name')),),
        )],
      ),
    );
  }
}
