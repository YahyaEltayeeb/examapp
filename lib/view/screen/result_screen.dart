import 'package:examapp/core/di/di.dart';
import 'package:examapp/core/l10n/translation/app_localizations.dart';
import 'package:examapp/core/route/app_routes.dart';
import 'package:examapp/core/theme/app_colors.dart';
import 'package:examapp/core/values/arguments_value.dart';
import 'package:examapp/core/values/assets_constant.dart';
import 'package:examapp/view/widget/custom_card.dart';
import 'package:examapp/view_model/get_result_bloc/get_result_bloc.dart';
import 'package:examapp/view_model/get_result_bloc/get_result_event.dart';
import 'package:examapp/view_model/get_result_bloc/get_result_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<GetExamResultBloc>()..add(GetExamResultEvent()),
      child: Scaffold(
        body: BlocBuilder<GetExamResultBloc, GetExamResultState>(
          builder: (BuildContext context, GetExamResultState state) {
            if (state.isLadding == true) {
              return Center(child: CircularProgressIndicator());
            } else if (state.error.isNotEmpty) {
              return Center(child: Text(state.error.toString()));
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.homeInitial);
                        },
                        icon: Icon(Icons.arrow_back_outlined),
                      ),
                      Text(
                        AppLocalizations.of(context)!.result,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.examResult.length,
                      itemBuilder: (context, index) => CustomCard(
                        onTapCard: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.resultQuestion,
                            arguments: {
                              ArgumentsValue.examId:
                                  state.examResult[index].examId,
                              ArgumentsValue.userAnswer:
                                  state.examResult[index].userAnswers,
                            },
                          );
                        },
                        widget: ListTile(
                          trailing: Text(
                            '${state.examResult[index].duration.toString()} ${AppLocalizations.of(context)!.minutes}',
                            style: Theme.of(context).textTheme.bodySmall!
                                .copyWith(color: AppColors.blue),
                          ),
                          subtitle: Column(
                            spacing: 15,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${20} ${AppLocalizations.of(context)!.question}'
                                    .toString(),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),

                              Text(
                                AppLocalizations.of(context)!.fixedFromToTime,
                                style: Theme.of(context).textTheme.bodySmall!
                                    .copyWith(color: AppColors.black),
                              ),
                            ],
                          ),
                          leading: Image.asset(AssetsConstant.logoExam),
                          title: Text(
                            state.examResult[index].examName,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
