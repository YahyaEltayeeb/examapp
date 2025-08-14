import 'package:examapp/core/di/di.dart';
import 'package:examapp/core/l10n/translation/app_localizations.dart';
import 'package:examapp/core/route/app_routes.dart';
import 'package:examapp/core/theme/app_colors.dart';
import 'package:examapp/core/values/arguments_value.dart';
import 'package:examapp/core/values/assets_constant.dart';
import 'package:examapp/view/widget/guidelines_widget.dart';
import 'package:examapp/view/widget/loadding_widget.dart';
import 'package:examapp/view_model/exam_by_sub_bloc.dart/exam_by_sub_bloc.dart';
import 'package:examapp/view_model/exam_by_sub_bloc.dart/exam_by_sub_event.dart';
import 'package:examapp/view_model/exam_by_sub_bloc.dart/exam_by_sub_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamBySubScreen extends StatelessWidget {
  const ExamBySubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String examId = arg[ArgumentsValue.examSub] as String;

    return BlocProvider(
      create: (context) =>
          getIt<ExamBySubBloc>()..add(GetExamsBySubEvent(examId)),
      child: Scaffold(
        appBar: AppBar(automaticallyImplyLeading: true),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocBuilder<ExamBySubBloc, GetExamsBySubState>(
            builder: (context, state) {
              if (state.isLoadding == true) {
                return LoaddingWidget();
              }
              if (state.errorMessage.isNotEmpty) {
                return Center(child: Text(state.errorMessage.toString()));
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: state.examSub.length,
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Image.asset(AssetsConstant.logoExam),
                        title: Text(
                          state.examSub[index].title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        trailing: Text(
                          '${state.examSub[index].duration.toString()} ${AppLocalizations.of(context)!.minutes}',
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.high_level,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Text(
                              '|',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          Text(
                            '${state.examSub[index].numberOfQuestions} ${AppLocalizations.of(context)!.question}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(height: .5, color: AppColors.blue[10]),
                      ),
                      Text(
                        AppLocalizations.of(context)!.instructions,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      GuidelinesWidget(
                        text: AppLocalizations.of(
                          context,
                        )!.guideline_check_answers,
                      ),
                      GuidelinesWidget(
                        text: AppLocalizations.of(
                          context,
                        )!.guideline_read_carefully,
                      ),
                      GuidelinesWidget(
                        text: AppLocalizations.of(
                          context,
                        )!.guideline_start_with_known,
                      ),
                      GuidelinesWidget(
                        text: AppLocalizations.of(
                          context,
                        )!.guideline_use_time_wisely,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.question,
                                arguments: {
                                  ArgumentsValue.examId:
                                      state.examSub[index].id,
                                  ArgumentsValue.examDuration: state
                                      .examSub[index]
                                      .duration
                                      .toString(),
                                },
                              );
                            },
                            child: Text(
                              'Start',
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(color: AppColors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
