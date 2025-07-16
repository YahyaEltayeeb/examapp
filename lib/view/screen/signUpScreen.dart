import 'package:examapp/core/di/di.dart';
import 'package:examapp/core/validation/validator.dart';
import 'package:examapp/domain/model/user_request.dart';
import 'package:examapp/view/screen/logInScreen.dart';
import 'package:examapp/view/widget/custom_text_field.dart';
import 'package:examapp/view_model/sign_up_cubit.dart';
import 'package:examapp/view_model/sign_up_state.dart';
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
            appBar: AppBar(title: Text('Sign Up')),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formkey,
                child: SingleChildScrollView(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: MediaQuery.of(context).size.height * .03,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //userNameTextField
                      CustomTextField(
                        controller: userNameController,
                        validator: (value) =>
                            value!.isEmpty ? 'user name is requierd' : null,
                        hintText: 'Enter you user name',
                        helperText: '',
                        labelText: 'user name',
                      ),

                      Row(
                        spacing: 5,
                        children: [
                          Expanded(
                            //FirstNameTextField
                            child: CustomTextField(
                              validator: (value) => value!.isEmpty
                                  ? 'First name is requierd'
                                  : null,
                              controller: firstNameController,

                              labelText: 'First name',
                              hintText: 'Enter first name',
                              helperText: '',
                            ),
                          ),

                          // LastNameTextField
                          Expanded(
                            child: CustomTextField(
                              validator: (value) => value!.isEmpty
                                  ? 'Last name is requerd'
                                  : null,
                              controller: lastNameController,

                              helperText: '',
                              labelText: 'Last name',
                              hintText: 'Enter last name',
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
                                ? 'Email is requierd'
                                : 'This Email is not valid';
                          }
                          return null;
                        },
                        controller: emailController,

                        helperText: '',
                        labelText: 'Email',
                        hintText: 'Enter you email',
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
                                      ? 'password is requierd'
                                      : 'Password not valid';
                                }
                                return null;
                              },
                              controller: passwordController,

                              helperText: '',
                              labelText: 'Password',
                              hintText: 'Enter passowrd',
                            ),
                          ),

                          //rePassowrdTextField
                          Expanded(
                            child: CustomTextField(
                              validator: (value) {
                                if (value != passwordController.text) {
                                  return 'Password not matched';
                                }
                                return null;
                              },
                              controller: rePasswordController,

                              helperText: '',
                              labelText: 'Confirm password',
                              hintText: 'Confirm password',
                            ),
                          ),
                        ],
                      ),
                      //phoneTextField
                      ValueListenableBuilder<TextEditingValue>(
                        valueListenable: phoneNumberController,

                        builder: (context, value, child) {
                          return CustomTextField(
                            validator: (value) =>
                                value!.isEmpty ? 'Phone is requierd' : null,
                            keyboard: TextInputType.phone,
                            controller: phoneNumberController,
                            maxLength: 11,

                            helperText: '',
                            labelText: 'Phone number',
                            hintText: 'Enter phone number',

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
                          'Sign Up',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?'),
                          TextButton(onPressed: () {}, child: Text('Login')),
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
