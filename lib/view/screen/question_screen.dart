import 'package:examapp/core/di/di.dart';
import 'package:examapp/core/l10n/translation/app_localizations.dart';
import 'package:examapp/core/route/app_routes.dart';
import 'package:examapp/core/theme/app_colors.dart';
import 'package:examapp/core/values/arguments_value.dart';
import 'package:examapp/domain/Model/responce/exam_result_model.dart';
import 'package:examapp/view/widget/custom_Button.dart';
import 'package:examapp/view/widget/loadding_widget.dart';
import 'package:examapp/view/widget/timer_widget.dart';
import 'package:examapp/view_model/question_cubit/question_bloc.dart';
import 'package:examapp/view_model/question_cubit/question_event.dart';
import 'package:examapp/view_model/question_cubit/question_state.dart';
import 'package:examapp/view_model/save_result_bloc/save_result_bloc.dart';
import 'package:examapp/view_model/save_result_bloc/save_result_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool isSelected = false;
  String? selectedAnswerKey;
  int _score = 0;
  int countQuestion = 0;
  bool isScoredForCurrentQuestion = false;

  final Set<int> _scoredQuestions = {};

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    String examId = args[ArgumentsValue.examId] as String;
    String examDurationStr = args[ArgumentsValue.examDuration] as String;

    int examDuration = int.parse(examDurationStr) * 60;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.exam),
        automaticallyImplyLeading: true,
        actions: [
          TimerWidget(
            examtTime: examDuration,
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.score,
                arguments: {
                  ArgumentsValue.score: _score.toString(),
                  ArgumentsValue.numberOfQuestion: countQuestion.toString(),
                  ArgumentsValue.examId: examId,
                  ArgumentsValue.examDuration: examDurationStr,
                },
              );
            },
          ),
        ],
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<GetQuestionBloc>(
            create: (_) =>
                getIt<GetQuestionBloc>()..add(GetQuestionEvevnt(examId)),
          ),
          BlocProvider<SaveExamBloc>(create: (_) => getIt<SaveExamBloc>()),
        ],
        child: BlocBuilder<GetQuestionBloc, GetQuestionState>(
          builder: (context, state) {
            if (state.isLoadding == true) {
              return LoaddingWidget();
            } else if (state.errorMessage.isNotEmpty) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              );
            }

            return Column(
              children: [
                Expanded(
                  flex: 3,
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    itemCount: state.question.length,

                    onPageChanged: (value) {
                      setState(() {
                        _currentPage = value;
                        selectedAnswerKey = null;
                      });
                    },
                    itemBuilder: (context, questionIndex) {
                      countQuestion = state.question.length;
                      final selectedAnswersMap = {
                        for (int i = 0; i < state.question.length; i++)
                          i.toString(): selectedAnswerKey,
                      };
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10,
                          children: [
                            Center(
                              child: Text(
                                '${AppLocalizations.of(context)!.question} ${_currentPage + 1} ${AppLocalizations.of(context)!.off} ${state.question.length}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            LinearProgressIndicator(
                              value: (_currentPage + 1) / state.question.length,
                              backgroundColor: AppColors.black[10],
                              color: AppColors.blue,
                            ),
                            Text(
                              state.question[questionIndex].question,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),

                            Expanded(
                              child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 20),
                                itemCount: state
                                    .question[questionIndex]
                                    .answers
                                    .length,
                                itemBuilder: (context, answerIndex) {
                                  final isSelected =
                                      selectedAnswerKey ==
                                      state
                                          .question[questionIndex]
                                          .answers[answerIndex]
                                          .key;

                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedAnswerKey = state
                                            .question[questionIndex]
                                            .answers[answerIndex]
                                            .key;
                                      });
                                    },
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: isSelected
                                            ? AppColors.blue[10]
                                            : AppColors.lightBlue,
                                      ),

                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          spacing: 20,
                                          children: [
                                            Icon(
                                              isSelected
                                                  ? Icons.radio_button_on
                                                  : Icons.radio_button_off,
                                              color: AppColors.blue,
                                            ),
                                            Expanded(
                                              child: Text(
                                                state
                                                    .question[questionIndex]
                                                    .answers[answerIndex]
                                                    .answer,
                                                softWrap: true,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                      color: AppColors.black,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CustomButton(
                                            borderColor: AppColors.blue,
                                            text: AppLocalizations.of(
                                              context,
                                            )!.back,
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyLarge,
                                            backgroundColor: Colors.white,
                                            onTap: () {
                                              _pageController.previousPage(
                                                duration: Duration(
                                                  milliseconds: 3,
                                                ),
                                                curve: Curves.bounceInOut,
                                              );
                                            },
                                            foregroundColor: AppColors.blue,
                                          ),
                                        ),
                                        SizedBox(width: 5),

                                        Expanded(
                                          child: CustomButton(
                                            foregroundColor: AppColors.white,
                                            borderColor: AppColors.blue,
                                            text:
                                                _currentPage ==
                                                    state.question.length - 1
                                                ? AppLocalizations.of(
                                                    context,
                                                  )!.finish
                                                : AppLocalizations.of(
                                                    context,
                                                  )!.next,
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyLarge,
                                            backgroundColor: AppColors.blue,
                                            onTap: () {
                                              final correctAnswerKeyyy = state
                                                  .question[_currentPage]
                                                  .correct;
                                              if (selectedAnswerKey != null) {
                                                if (!_scoredQuestions.contains(
                                                      _currentPage,
                                                    ) &&
                                                    selectedAnswerKey ==
                                                        correctAnswerKeyyy) {
                                                  _score++;
                                                  _scoredQuestions.add(
                                                    _currentPage,
                                                  );
                                                }

                                                if (_currentPage ==
                                                    state.question.length - 1) {
                                                  ExamResultEntity
                                                  copyExamREsuult = ExamResultEntity(
                                                    examId: examId,
                                                    examName: state
                                                        .question[questionIndex]
                                                        .exam
                                                        .title,
                                                    duration: state
                                                        .question[questionIndex]
                                                        .exam
                                                        .duration,
                                                    userAnswers:
                                                        selectedAnswersMap,
                                                  );

                                                  // ignore: avoid_single_cascade_in_expression_statements
                                                  context.read<SaveExamBloc>()
                                                    ..add(
                                                      SaveExamResultEvent(
                                                        copyExamREsuult,
                                                      ),
                                                    );
                                                  Navigator.pushNamed(
                                                    context,
                                                    AppRoutes.score,
                                                    arguments: {
                                                      ArgumentsValue.score:
                                                          _score.toString(),

                                                      // ignore: equal_keys_in_map
                                                      ArgumentsValue
                                                              .numberOfQuestion:
                                                          state.question.length
                                                              .toString(),
                                                      ArgumentsValue.examId:
                                                          examId,
                                                      ArgumentsValue
                                                              .examDuration:
                                                          examDurationStr,
                                                    },
                                                  );
                                                }
                                                _pageController.nextPage(
                                                  duration: Duration(
                                                    milliseconds: 3,
                                                  ),
                                                  curve: Curves.bounceInOut,
                                                );
                                              } else {
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(
                                                    duration: Duration(
                                                      seconds: 1,
                                                    ),
                                                    backgroundColor:
                                                        AppColors.red,
                                                    content: Text(
                                                      AppLocalizations.of(
                                                        context,
                                                      )!.pleaceChoiseAnswer,
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
