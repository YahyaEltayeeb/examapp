import 'package:examapp/core/di/di.dart';
import 'package:examapp/core/l10n/translation/app_localizations.dart';
import 'package:examapp/core/route/app_routes.dart';
import 'package:examapp/core/theme/app_colors.dart';
import 'package:examapp/core/values/arguments_value.dart';
import 'package:examapp/core/values/assets_constant.dart';
import 'package:examapp/view/widget/custom_card.dart';
import 'package:examapp/view_model/exams_by_id_cubit/exam_by_id_bloc.dart';
import 'package:examapp/view_model/exams_by_id_cubit/exam_by_id_event.dart';
import 'package:examapp/view_model/exams_by_id_cubit/exam_by_id_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamsByIdScreen extends StatelessWidget {
  const ExamsByIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    final arguments = args as Map<String, dynamic>;
    final id = arguments[ArgumentsValue.idArgument] as String;
    final title = arguments[ArgumentsValue.titleArgument] as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.home);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: BlocProvider(
        create: (_) => getIt<ExamByIdBloc>()..add(GetExamsByIdEvent(id)),
        child: Expanded(
          child: BlocBuilder<ExamByIdBloc, GetExamByIdState>(
            builder: (context, state) {
              if (state.isLoadding == true) {
                return Center(child: CircularProgressIndicator());
              } else if (state.errorMessageId.isNotEmpty) {
                return Center(child: Text(state.errorMessageId));
              }

              return ListView.builder(
                itemCount: state.examsById.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CustomCard(
                        onTapCard: () {},

                        widget: ListTile(
                          trailing: Text(
                            '${state.examsById[index].duration.toString()} ${AppLocalizations.of(context)!.minutes}',
                            style: Theme.of(context).textTheme.bodySmall!
                                .copyWith(color: AppColors.blue),
                          ),
                          subtitle: Column(
                            spacing: 15,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${state.examsById[index].numberOfQuestions} ${AppLocalizations.of(context)!.question}'
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
                            state.examsById[index].title,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
