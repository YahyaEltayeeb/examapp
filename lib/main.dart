import 'package:examapp/core/l10n/translation/app_localizations.dart';
import 'package:examapp/core/route/app_routes.dart';
import 'package:examapp/core/route/routes.dart';
import 'package:examapp/core/theme/app_theme.dart';
import 'package:examapp/core/di/di.dart';
import 'package:examapp/data/data_source/token_local_data_source.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  final tokenDataSource = getIt<TokenLocalDataSource>();
  final token = await tokenDataSource.getToken();
  final initialRoute = token == null ? AppRoutes.signUp : AppRoutes.homeInitial;
  runApp(SafeArea(child: MyApp(initialRoute: initialRoute)));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        locale: Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.generateRoutes,
        initialRoute: AppRoutes.signUp,

        // home: QuestionScreen(),
      ),
    );
  }
}
