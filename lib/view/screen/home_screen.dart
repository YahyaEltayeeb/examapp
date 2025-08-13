import 'package:examapp/core/di/di.dart';
import 'package:examapp/core/l10n/translation/app_localizations.dart';
import 'package:examapp/core/route/app_routes.dart';
import 'package:examapp/core/theme/CustomWidget/CustomTextField.dart';
import 'package:examapp/core/theme/app_colors.dart';
import 'package:examapp/core/values/arguments_value.dart';
import 'package:examapp/view/widget/custom_card.dart';
import 'package:examapp/view/widget/loadding_widget.dart';
import 'package:examapp/view_model/home_cubit/home_bloc.dart';
import 'package:examapp/view_model/home_cubit/home_event.dart';
import 'package:examapp/view_model/home_cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(GetSubjectEvent()),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.survey,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: CustomTextFormField(
                  borderColor: AppColors.grey,
                  prefixIcon: Icon(Icons.search, color: AppColors.black[30]),
                  label: Text(AppLocalizations.of(context)!.search),
                  labelStyle: TextStyle(color: AppColors.grey),
                ),
              ),
              Text(
                AppLocalizations.of(context)!.browseBySubject,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Expanded(
                child: BlocBuilder<HomeBloc, GetSubjectState>(
                  builder: (context, state) {
                    if (state.messageErrorSubject != '') {
                      return Center(
                        child: Text(state.messageErrorSubject.toString()),
                      );
                    }
                    if (state.isLoaddingSubject == true) {
                      return LoaddingWidget();
                    }

                    return ListView.builder(
                      itemCount: state.subjects!.length,

                      itemBuilder: (context, index) {
                        return CustomCard(
                          onTapCard: () => Navigator.pushNamed(
                            context,
                            AppRoutes.examById,
                            arguments: {
                              ArgumentsValue.idArgument:
                                  state.subjects![index].id,
                              ArgumentsValue.titleArgument:
                                  state.subjects![index].name,
                            },
                          ),
                          widget: Row(
                            spacing: 15,

                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.network(state.subjects![index].icon),
                              Text(
                                state.subjects![index].name,
                                style: Theme.of(context).textTheme.bodyLarge!
                                    .copyWith(color: AppColors.black),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
