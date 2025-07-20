import 'package:examapp/core/di/di.dart';
import 'package:examapp/core/l10n/translation/app_localizations.dart';
import 'package:examapp/core/route/app_routes.dart';
import 'package:examapp/view/screen/forget_password_screen.dart';
import 'package:examapp/view/screen/log_in_screen.dart';
import 'package:examapp/view/screen/otp_screen.dart';
import 'package:examapp/view/screen/sign_up_screen.dart';
import 'package:examapp/view_model/verify_code_cubit/verify_code_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class Routes {
  static Route generateRoutes(RouteSettings setting) {
    final url = Uri.parse(setting.name ?? '/');
    switch (url.path) {
      case AppRoutes.signIn:
        return MaterialPageRoute(builder: (_) => SignUpScreen());

      case AppRoutes.logIn:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case AppRoutes.forgetPassword:
        return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());

      case AppRoutes.otp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<VerifyCodeCubit>(),
            child: const OtpScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text(AppLocalizations.of(context)!.appName)),
          ),
        );
    }
  }
}
