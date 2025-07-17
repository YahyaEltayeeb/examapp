import 'package:examapp/homescreen/homescreen.dart';
import 'package:examapp/view/LogIn/viewModel/LoginStates.dart';
import 'package:examapp/view/LogIn/viewModel/Logincubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/theme/AppStyles.dart';
import '../../core/theme/CustomWidget/CustomButtom.dart';
import '../../core/theme/CustomWidget/CustomTextField.dart';
import '../../core/theme/app_colors.dart';
import '../../di/di.dart';
import '../../domain/Model/LoginRequest/LoginRequest.dart';
import 'Widgets/RemememberMeWidget.dart';

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
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const Homescreen()),
                );
              }
              else if (state is LoginError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                  snackBarAnimationStyle: AnimationStyle(
                      curve: Curves.decelerate),
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
                    }
                    ,),
                  title: Text("Login",
                      style: AppStyles.medium20White.copyWith(
                          color: AppColors.black)
                  ),
                  titleSpacing: 0,
                ),
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    child: Form(
                      key:_formKey ,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 24,),
                          CustomTextFormField(borderColor: AppColors.grey,
                            label: Text("Enter Your Email",
                              style: AppStyles.regular14Text.copyWith(
                                  color: AppColors
                                      .black),),
                            controller: emailController,
                            validator: (value) =>
                            value!.isEmpty ? 'user name is requierd' : null,
                          ),
                          SizedBox(height: 24,),
                          CustomTextFormField(borderColor: AppColors.grey,
                            label: Text("Enter Your Password",
                              style: AppStyles.regular14Text.copyWith(
                                  color: AppColors
                                      .black),)
                            , controller: passwordController,
                            validator: (value) =>
                            value!.isEmpty ? 'password is requierd' : null,

                          ),
                          SizedBox(height: 16,),
                          RememberMeWidget(),
                          SizedBox(height: 48,),
                          CustomButton(text: 'Login',

                            onButtonClicked: () {
                              if (_formKey.currentState!.validate()) {
                                final request = LoginRequest(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                                BlocProvider.of<LoginCubit>(context).login(request);
                              }
                            },

                            buttonColor: AppColors.blue,
                            textStyle: AppStyles.medium18White,

                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            })
    );
  }

}
