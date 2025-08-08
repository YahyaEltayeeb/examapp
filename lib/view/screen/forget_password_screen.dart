import 'package:examapp/core/di/di.dart';
import 'package:examapp/core/l10n/translation/app_localizations.dart';
import 'package:examapp/core/route/app_routes.dart';
import 'package:examapp/domain/Model/request/forget_password_request.dart';
import 'package:examapp/view/widget/custom_text_field.dart';
import 'package:examapp/view_model/forget_password_cubit/forget_password_cubit.dart';
import 'package:examapp/view_model/forget_password_cubit/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  TextEditingController forgetPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ForgetPasswordCubit>(),
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.password)),
        body: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ForgetPasswordLoadding) {
              Center(child: CircularProgressIndicator());
            } else if (state is ForgetPasswordError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is ForgetPasswordSuccess) {
              Navigator.pushNamed(context, AppRoutes.otp);
            }
          },
          child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                     AppLocalizations.of(context)!.forgetPassword
                     , style: Theme.of(context).textTheme.titleMedium,
                    ),

                    Text(
                       AppLocalizations.of(context)!.enterEmailForgetPassword,
                      textAlign: TextAlign.center,

                      style: Theme.of(context).textTheme.bodySmall,
                    ),

                    CustomTextField(
                      controller: forgetPasswordController,
                      hintText: AppLocalizations.of(context)!.enterEmail,
                      helperText: '',
                      labelText:  AppLocalizations.of(context)!.email,
                    ),

                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: FilledButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: () {
                          context.read<ForgetPasswordCubit>().forgetPassword(
                            ForgetPasswordRequest(
                              email: forgetPasswordController.text,
                            ),
                          );
                        },
                        child: Text(
                          AppLocalizations.of(context)!.continueButton,
                          style:
                              
                              Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
