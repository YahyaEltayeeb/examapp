import 'package:examapp/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [ElevatedButton(
  onPressed: () async {
    final prefs = getIt<SharedPreferences>();
    await prefs.remove('exam_results');
    print('تم مسح نتيجة الامتحان');
  },
  child: Text('مسح النتيجة'),
),
],),);
  }
}