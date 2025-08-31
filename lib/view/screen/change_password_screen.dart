import 'package:examapp/core/di/di.dart';
import 'package:examapp/core/l10n/translation/app_localizations.dart';
import 'package:examapp/core/route/app_routes.dart';
import 'package:examapp/core/theme/app_colors.dart';
import 'package:examapp/core/validation/validator.dart';
import 'package:examapp/domain/Model/request/change_password_request.dart';
import 'package:examapp/view_model/change_password_bloc.dart/change_password_bloc.dart';
import 'package:examapp/view_model/change_password_bloc.dart/change_password_event.dart';
import 'package:examapp/view_model/change_password_bloc.dart/change_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController currentPasswordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => getIt<ChangePasswordBloc>(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(AppLocalizations.of(context)!.resetPassword),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
              listener: (context, state) {
                if (state.isLoadding == true) {
                  Center(child: CircularProgressIndicator());
                } else if (state.errorMessage.isNotEmpty) {
                  Center(child: Text(state.errorMessage));
                } else if (state.changePassword != null) {
                  Navigator.pushNamed(context, AppRoutes.editProfile);
                }
              },
              builder: (context, state) {
                return Column(
                  spacing: 10,
                  children: [
                    TextFormField(
                      controller: currentPasswordController,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.password,
                        hintText: AppLocalizations.of(context)!.password,
                      ),
                    ),
                    TextFormField(
                      controller: newPasswordController,
                      validator: (value) {
                        if (!ValidatorConstatnt.validationPassword.hasMatch(
                              value!,
                            ) ||
                            value.isEmpty) {
                          return value.isEmpty
                              ? AppLocalizations.of(context)!.passwordRequired
                              : AppLocalizations.of(context)!.passwordNotValid;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.newPassword,
                        hintText: AppLocalizations.of(context)!.newPassword,
                      ),
                    ),
                    TextFormField(
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(
                          context,
                        )!.confirmPassword,
                        hintText: AppLocalizations.of(context)!.confirmPassword,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: state.isLoadding
                            ? null
                            : () {
                                if (formKey.currentState!.validate()) {
                                  context.read<ChangePasswordBloc>().add(
                                    SumitChangePasswordEvent(
                                      ChangePasswordRequest(
                                        oldPassword:
                                            currentPasswordController.text,
                                        password: newPasswordController.text,
                                        rePassword:
                                            confirmPasswordController.text,
                                      ),
                                    ),
                                  );
                                }
                              },
                        child: Text(
                          AppLocalizations.of(context)!.upDate,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
