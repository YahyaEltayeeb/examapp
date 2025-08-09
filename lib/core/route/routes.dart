import 'package:examapp/core/di/di.dart';
import 'package:examapp/core/l10n/translation/app_localizations.dart';
import 'package:examapp/core/route/app_routes.dart';
import 'package:examapp/view/screen/exams_by_id_screen.dart';
import 'package:examapp/view/screen/forget_password_screen.dart';
import 'package:examapp/view/screen/home_initial_screen%20.dart';
import 'package:examapp/view/screen/home_screen.dart';
import 'package:examapp/view/screen/otp_screen.dart';
import 'package:examapp/view/screen/question_screen.dart';
import 'package:examapp/view/screen/result_question_screen.dart';
import 'package:examapp/view/screen/result_screen.dart';
import 'package:examapp/view/screen/score_screen.dart';
import 'package:examapp/view/screen/sign_in_screen.dart';
import 'package:examapp/view/screen/sign_up_screen.dart';
import 'package:examapp/view_model/verify_code_cubit/verify_code_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view/screen/exam/exam_by_sub.dart';


abstract class Routes {
  static Route generateRoutes(RouteSettings setting) {
    final url = Uri.parse(setting.name ?? '/');
    switch (url.path) {
      case AppRoutes.signIn:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
        case AppRoutes.examBySub:
        return MaterialPageRoute(builder: (_) => ExamBySubView());

      case AppRoutes.logIn:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      // case AppRoutes.forgetPassword:
      //   return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());

      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: setting,
        );
      case AppRoutes.examById:
        return MaterialPageRoute(
          builder: (_) => const ExamsByIdScreen(),
          settings: setting,
        );

      case AppRoutes.otp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<VerifyCodeCubit>(),
            child: const OtpScreen(),
          ),
        );
      case AppRoutes.question:
        return MaterialPageRoute(
          builder: (_) => const QuestionScreen(),
          settings: setting,
        );
      case AppRoutes.score:
        return MaterialPageRoute(
          builder: (_) => const ScoreScreen(),
          settings: setting,
        );
      case AppRoutes.result:
        return MaterialPageRoute(builder: (_) => const ResultScreen(),settings: setting);
      case AppRoutes.homeInitial:
        return MaterialPageRoute(builder: (_) => HomeInitialScreen());
      case AppRoutes.resultQuestion:
        return MaterialPageRoute(builder: (_) => const ResultQuestionScreen(),settings: setting);
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text(AppLocalizations.of(context)!.appName)),
          ),
        );
    }
  }
}
