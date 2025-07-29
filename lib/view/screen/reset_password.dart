import 'package:examapp/core/di/di.dart';
import 'package:examapp/core/l10n/translation/app_localizations.dart';
import 'package:examapp/core/route/app_routes.dart';
import 'package:examapp/core/validation/validator.dart';
import 'package:examapp/domain/model/request/reset_password_request.dart';
import 'package:examapp/view_model/reset_password_cubit/reset_password_cubit.dart';
import 'package:examapp/view_model/reset_password_cubit/reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    final key = GlobalKey<FormState>();
    return BlocProvider(
      create: (_) => getIt<ResetPasswordCubit>(),
      child: Scaffold(
        appBar: AppBar(title: Text( AppLocalizations.of(context)!.password),),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: key,
            child: BlocListener<ResetPasswordCubit, ResetPasswordState>(
              listener: (context, state) {
                if (state is ResetPasswordLoadding) {
                  Center(child: CircularProgressIndicator());
                } else if (state is ResetPasswordError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.messageError)));
                } else if (state is ResetPasswordSuccess) {
                  Navigator.pushNamed(context, AppRoutes.logIn);
                }
              },
              child: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                builder: (context, state) {
                  return Column(
                    spacing: 15,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.resetPassword,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        AppLocalizations.of(context)!.passwordValidation,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText:  AppLocalizations.of(context)!.email,
                          hintText: AppLocalizations.of(context)!.enterEmail,
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
                          labelText:AppLocalizations.of(context)!.newPassword,
                          hintText: AppLocalizations.of(context)!.enterPassword,
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            if (key.currentState!.validate()) {
                              context.read<ResetPasswordCubit>().resetPassword(
                                ResetPasswordRequest(
                                  emailController.text,
                                  newPasswordController.text,
                                ),
                              );
                            }
                          },
                          child: Text(
                           AppLocalizations.of(context)!.continueButton,
                            style: Theme.of(context).textTheme.labelLarge,
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
      ),
    );
  }
}
