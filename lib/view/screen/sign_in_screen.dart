import 'package:examapp/core/di/di.dart';
import 'package:examapp/core/l10n/translation/app_localizations.dart';
import 'package:examapp/core/route/app_routes.dart';
import 'package:examapp/view_model/sign_in_cubit/LoginStates.dart';
import 'package:examapp/view_model/sign_in_cubit/Logincubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/theme/AppStyles.dart';
import '../../core/theme/CustomWidget/CustomTextField.dart';
import '../../core/theme/app_colors.dart';
import '../../domain/Model/LoginRequest/LoginRequest.dart';
import '../widget/RemememberMeWidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
             ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppLocalizations.of(context)!.login_successfully),
                backgroundColor: AppColors.green
              ));
            Navigator.pushNamed(context, AppRoutes.homeInitial);
          } else if (state is LoginError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor:AppColors.red,
              ),
              snackBarAnimationStyle: AnimationStyle(curve: Curves.decelerate),
            );
          }
        },

        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                AppLocalizations.of(context)!.login,
                style: AppStyles.medium20White.copyWith(color: AppColors.black),
              ),
              titleSpacing: 0,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 24),
                      CustomTextFormField(
                        borderColor: AppColors.grey,
                        label: Text(
                          AppLocalizations.of(context)!.enterEmail,
                          style: AppStyles.regular14Text.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                        controller: emailController,
                        validator: (value) => value!.isEmpty
                            ? AppLocalizations.of(context)!.emailRequired
                            : null,
                      ),
                      SizedBox(height: 24),
                      CustomTextFormField(
                        borderColor: AppColors.grey,
                        label: Text(
                          AppLocalizations.of(context)!.enterPassword,
                          style: AppStyles.regular14Text.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                        controller: passwordController,
                        validator: (value) => value!.isEmpty
                            ? AppLocalizations.of(context)!.passwordRequired
                            : null,
                      ),
                      SizedBox(height: 16),
                      RememberMeWidget(),
                      SizedBox(height: 48),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: state is LoginLoading
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    final request = LoginRequest(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    );
                                    BlocProvider.of<LoginCubit>(
                                      context,
                                    ).login(request);
                                  }
                                },
                          child: Text(
                            AppLocalizations.of(context)!.login,
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
