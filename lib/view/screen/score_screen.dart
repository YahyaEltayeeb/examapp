import 'package:examapp/core/l10n/translation/app_localizations.dart';
import 'package:examapp/core/route/app_routes.dart';
import 'package:examapp/core/theme/app_colors.dart';
import 'package:examapp/core/values/arguments_value.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    var arg =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    String scorestr = arg[ArgumentsValue.score] as String;
    String numberQuestionstr = arg[ArgumentsValue.numberOfQuestion] as String;
    String examId = arg[ArgumentsValue.examId] as String;
    String examDuration = arg[ArgumentsValue.examDuration] as String;
    int score = int.parse(scorestr);
    int numberOfQuestion = int.parse(numberQuestionstr);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.examScore),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          spacing: 25,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                AppLocalizations.of(context)!.yourScore,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularPercentIndicator(
                    center: Text(
                      '${((score / numberOfQuestion) * 100).toStringAsFixed(0)}%',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    animateToInitialPercent: true,
                    percent: score / numberOfQuestion,
                    animation: true,
                    animationDuration: 500,
                    curve: Curves.linear,
                    radius: 70,
                    lineWidth: 5,
                    backgroundColor: AppColors.red,
                    progressColor: AppColors.blue,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    spacing: 15,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        spacing: 60,
                        children: [
                          Text(AppLocalizations.of(context)!.correct),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: BoxBorder.all(color: AppColors.blue),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              score.toString(),
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(color: AppColors.blue),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        spacing: 50,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.incorrect,
                            style: TextStyle(color: AppColors.red),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: BoxBorder.all(color: AppColors.red),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              '${numberOfQuestion - score}'.toString(),
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(color: AppColors.red),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.result);
                },
                child: Text(
                  AppLocalizations.of(context)!.showResult,
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.question,
                    arguments: {
                      ArgumentsValue.examId: examId,
                      ArgumentsValue.examDuration: examDuration,
                    },
                  );
                },
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.white,
                  side: BorderSide(color: AppColors.blue),
                ),
                child: Text(AppLocalizations.of(context)!.startAgain),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
