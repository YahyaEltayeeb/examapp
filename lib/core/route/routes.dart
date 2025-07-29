import 'package:examapp/core/l10n/translation/app_localizations.dart';
import 'package:examapp/core/route/app_routes.dart';
import 'package:examapp/view/screen/exams_by_id_screen.dart';
import 'package:examapp/view/screen/home_screen.dart';

import 'package:flutter/material.dart';

abstract class Routes {
  static Route generateRoutes(RouteSettings setting) {
    final url = Uri.parse(setting.name ?? '/');
    switch (url.path) {
    

      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen(),settings: setting);
        case AppRoutes.examById:
        return MaterialPageRoute(builder: (_)=>const ExamsByIdScreen(),settings: setting);

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text(AppLocalizations.of(context)!.appName)),
          ),
        );
    }
  }
}
