import 'package:examapp/core/l10n/translation/app_localizations.dart';
import 'package:examapp/core/route/routes.dart';
import 'package:examapp/core/theme/app_theme.dart';
import 'package:examapp/core/di/di.dart';
import 'package:examapp/view/screen/exam/exam_by_sub.dart';
import 'package:examapp/view/screen/profile/profile_screen.dart';


import 'package:flutter/material.dart';

import 'api/api_module/token_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TokenManager.updateToken();
  await configureDependencies();


  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoutes,
      home: ProfileScreen()
    );
  }
}
