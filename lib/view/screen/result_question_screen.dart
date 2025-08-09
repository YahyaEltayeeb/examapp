import 'package:examapp/core/di/di.dart';
import 'package:examapp/core/theme/app_colors.dart';
import 'package:examapp/core/values/arguments_value.dart';
import 'package:examapp/view_model/question_cubit/question_bloc.dart';
import 'package:examapp/view_model/question_cubit/question_event.dart';
import 'package:examapp/view_model/question_cubit/question_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultQuestionScreen extends StatelessWidget {
  const ResultQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments;

    arg as Map<String, dynamic>;
    String examId = arg[ArgumentsValue.examId] as String;
    final Map<String, dynamic> userAnswer = Map<String, dynamic>.from(
      arg[ArgumentsValue.userAnswer],
    );

    final List userAnswerList = userAnswer.entries
        .map(
          (entry) => {
            ArgumentsValue.questionId: entry.key,
            ArgumentsValue.answer: entry.value,
          },
        )
        .toList();
    return BlocProvider(
      create: (_) => getIt<GetQuestionBloc>()..add(GetQuestionEvevnt(examId)),
      child: Scaffold(
        appBar: AppBar(automaticallyImplyLeading: true),

        body: BlocBuilder<GetQuestionBloc, GetQuestionState>(
          builder: (context, state) {
            if (state.isLoadding == true) {
              return Center(child: CircularProgressIndicator());
            } else if (state.errorMessage.isNotEmpty) {
              return Center(child: Text(state.errorMessage.toString()));
            }
            return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 5),
              itemCount: state.question.length,
              itemBuilder: (context, indexQuestion) {
                return Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.question[indexQuestion].question,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        ListView.separated(
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 10),
                          itemCount:
                              state.question[indexQuestion].answers.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, indexAnswer) {
                            final answer = state
                                .question[indexQuestion]
                                .answers[indexAnswer];
                            final answerKey = answer.key;

                            final correctAnswer =
                                state.question[indexQuestion].correct;
                            final userAnswer =
                                userAnswerList[indexQuestion][ArgumentsValue
                                    .answer];

                            Color borderColor = Colors.grey;
                            Color backgroundColor = Colors.white;
                            Icon? icon;

                            if (answerKey == correctAnswer) {
                              borderColor = AppColors.lightGreen;
                              backgroundColor = AppColors.lightGreen;

                              icon = Icon(
                                Icons.radio_button_checked_outlined,
                                color: AppColors.green,
                              );
                            } else if (answerKey == userAnswer) {
                              borderColor = AppColors.lightRed;
                              backgroundColor = AppColors.lightRed;

                              icon = Icon(
                                Icons.radio_button_checked_outlined,
                                color: AppColors.red,
                              );
                            } else {
                              icon = Icon(
                                Icons.radio_button_off,
                                color: AppColors.blue,
                              );
                              backgroundColor = AppColors.lightBlue;
                              borderColor = Colors.transparent;
                            }

                            return Container(
                              height: 50,
                              decoration: BoxDecoration(
                                border: BoxBorder.all(color: borderColor),
                                borderRadius: BorderRadius.circular(10),
                                color: backgroundColor,
                              ),

                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  spacing: 20,
                                  children: [
                                    icon,
                                    Expanded(
                                      child: Text(
                                        state
                                            .question[indexQuestion]
                                            .answers[indexAnswer]
                                            .answer,
                                        softWrap: true,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(color: AppColors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
