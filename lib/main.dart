import 'package:examapp/core/l10n/translation/app_localizations.dart';
import 'package:examapp/core/route/routes.dart';
import 'package:examapp/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'core/route/app_routes.dart';
import 'di/di.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   configureDependencies();

   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoutes,
      initialRoute: AppRoutes.logIn,

    );
  }
}
