import 'package:examapp/core/di/di.dart';
import 'package:examapp/core/l10n/translation/app_localizations.dart';
import 'package:examapp/core/validation/validator.dart';
import 'package:examapp/domain/model/request/user_request.dart';
import 'package:examapp/view/screen/sign_in_screen.dart';
import 'package:examapp/view/widget/custom_text_field.dart';
import 'package:examapp/view_model/sign_up_cubit/sign_up_cubit.dart';
import 'package:examapp/view_model/sign_up_cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final userNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    phoneNumberController.dispose();
    lastNameController.dispose();
    firstNameController.dispose();
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SignUpCubit>(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const LoginScreen()),
            );
          } else if (state is SignUpError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
              snackBarAnimationStyle: AnimationStyle(curve: Curves.decelerate),
            );
          }
        },

        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(title: Text(AppLocalizations.of(context)!.signUp)),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formkey,
                child: SingleChildScrollView(
                  child: Column(
                    spacing: MediaQuery.of(context).size.height * .03,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //userNameTextField
                      CustomTextField(
                        controller: userNameController,
                        validator: (value) => value!.isEmpty
                            ? AppLocalizations.of(context)!.userNameRequired
                            : null,
                        hintText: AppLocalizations.of(context)!.enterUserName,
                        helperText: '',
                        labelText: AppLocalizations.of(context)!.userName,
                      ),

                      Row(
                        spacing: 5,
                        children: [
                          Expanded(
                            //FirstNameTextField
                            child: CustomTextField(
                              validator: (value) => value!.isEmpty
                                  ? AppLocalizations.of(
                                      context,
                                    )!.firstNameRequired
                                  : null,
                              controller: firstNameController,

                              labelText: AppLocalizations.of(
                                context,
                              )!.firstName,
                              hintText: AppLocalizations.of(
                                context,
                              )!.enterFirstName,
                              helperText: '',
                            ),
                          ),

                          // LastNameTextField
                          Expanded(
                            child: CustomTextField(
                              validator: (value) => value!.isEmpty
                                  ? AppLocalizations.of(
                                      context,
                                    )!.lastNameRequired
                                  : null,
                              controller: lastNameController,

                              helperText: '',
                              labelText: AppLocalizations.of(context)!.lastName,
                              hintText: AppLocalizations.of(
                                context,
                              )!.enterLastName,
                            ),
                          ),
                        ],
                      ),

                      //EmailTextField
                      CustomTextField(
                        validator: (value) {
                          if (!ValidatorConstatnt.validationEmail.hasMatch(
                                value!,
                              ) ||
                              value.isEmpty) {
                            return value.isEmpty
                                ? AppLocalizations.of(context)!.emailRequired
                                : AppLocalizations.of(context)!.emailInvalid;
                          }
                          return null;
                        },
                        controller: emailController,

                        helperText: '',
                        labelText: AppLocalizations.of(context)!.email,
                        hintText: AppLocalizations.of(context)!.enterEmail,
                      ),
                      Row(
                        spacing: 5,
                        children: [
                          // PassoerdTextField
                          Expanded(
                            child: CustomTextField(
                              validator: (value) {
                                if (!ValidatorConstatnt.validationPassword
                                        .hasMatch(value!) ||
                                    value.isEmpty) {
                                  return value.isEmpty
                                      ? AppLocalizations.of(
                                          context,
                                        )!.passwordRequired
                                      : AppLocalizations.of(
                                          context,
                                        )!.passwordNotValid;
                                }
                                return null;
                              },
                              controller: passwordController,

                              helperText: '',
                              labelText: AppLocalizations.of(context)!.password,
                              hintText: AppLocalizations.of(
                                context,
                              )!.enterPassword,
                            ),
                          ),

                          //rePassowrdTextField
                          Expanded(
                            child: CustomTextField(
                              validator: (value) {
                                if (value != passwordController.text) {
                                  return AppLocalizations.of(
                                    context,
                                  )!.passwordNotValid;
                                }
                                return null;
                              },
                              controller: rePasswordController,

                              helperText: '',
                              labelText: AppLocalizations.of(
                                context,
                              )!.confirmPassword,
                              hintText: AppLocalizations.of(
                                context,
                              )!.confirmPassword,
                            ),
                          ),
                        ],
                      ),
                      //phoneTextField
                      ValueListenableBuilder<TextEditingValue>(
                        valueListenable: phoneNumberController,

                        builder: (context, value, child) {
                          return CustomTextField(
                            validator: (value) => value!.isEmpty
                                ? AppLocalizations.of(context)!.phoneRequired
                                : null,
                            keyboard: TextInputType.phone,
                            controller: phoneNumberController,
                            maxLength: 11,

                            helperText: '',
                            labelText: AppLocalizations.of(
                              context,
                            )!.phoneNumber,
                            hintText: AppLocalizations.of(
                              context,
                            )!.enterPhoneNumber,

                            counterText: "${value.text.length}/11".toString(),
                          );
                        },
                      ),

                      FilledButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            context.read<SignUpCubit>().signUp(
                              UserRequest(
                                username: userNameController.text,
                                rePassword: rePasswordController.text,
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                phone: phoneNumberController.text,
                              ),
                            );
                          }
                        },
                        child: Text(
                          AppLocalizations.of(context)!.signUp,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.alreadyHaveAccount,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(AppLocalizations.of(context)!.login),
                          ),
                        ],
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
