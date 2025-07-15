import 'package:examapp/core/l10n/translation/app_localizations.dart';
import 'package:examapp/core/route/app_routes.dart';
import 'package:examapp/view/screen/logInScreen.dart';
import 'package:examapp/view/screen/signUpScreen.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static Route generateRoutes(RouteSettings setting) {
    final url = Uri.parse(setting.name ?? '/');
    switch (url.path) {
      case AppRoutes.signIn:
      return MaterialPageRoute(builder: (_) =>  SignUpScreen());

    case AppRoutes.logIn:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(body: Center(child: Text(AppLocalizations.of(context)!.appName))),
        );
    }
  }
}
