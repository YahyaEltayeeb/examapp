import 'package:examapp/core/di/di.dart';
import 'package:examapp/core/l10n/translation/app_localizations.dart';
import 'package:examapp/core/theme/AppStyles.dart';
import 'package:examapp/core/validation/validator.dart';
import 'package:examapp/view/widget/custom_text_field.dart';
import 'package:examapp/view_model/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/CustomWidget/CustomButtom.dart';
import '../../../core/theme/CustomWidget/CustomTextField.dart';
import '../../../core/theme/app_colors.dart';
import '../../../view_model/edit_profile_cubit/edit_profile_state.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

EditProfileCubit editProfileCubit = getIt.get<EditProfileCubit>();


class _ProfileScreenState extends State<ProfileScreen> {
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
    editProfileCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => editProfileCubit,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF5F5F5),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocBuilder<EditProfileCubit, EditProfileState>(
          builder: (BuildContext context, state) {
            // if (state.isLoadingProfile) {
            //   return const Center(child: CircularProgressIndicator());
            // }
            if (state.errorProfile.isNotEmpty) {
              return Center(child: Text("Error: ${state.errorProfile}"));
            }

            return Scaffold(
              appBar: AppBar(
                title: Text(AppLocalizations.of(context)!.profile),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formkey,
                  child: SingleChildScrollView(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 65,
                                backgroundImage: NetworkImage(
                                  "https://i.pravatar.cc/150?img=3",
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          //userNameTextField
                          CustomTextField(
                            controller: userNameController,
                            validator: (value) => value!.isEmpty
                                ? AppLocalizations.of(context)!.userNameRequired
                                : null,
                            hintText: AppLocalizations.of(
                              context,
                            )!.enterUserName,
                            helperText: '',
                            labelText: AppLocalizations.of(context)!.userName,
                          ),
                          const SizedBox(height: 20),

                          Row(
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
                              const SizedBox(width: 5),
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
                                  labelText: AppLocalizations.of(
                                    context,
                                  )!.lastName,
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
                                    ? AppLocalizations.of(
                                        context,
                                      )!.emailRequired
                                    : AppLocalizations.of(
                                        context,
                                      )!.emailInvalid;
                              }
                              return null;
                            },
                            controller: emailController,

                            helperText: '',
                            labelText: AppLocalizations.of(context)!.email,
                            hintText: AppLocalizations.of(context)!.enterEmail,
                          ),
                          Row(
                            children: [
                              // PassoerdTextField
                              Expanded(
                                child: CustomTextFormField(
                                  borderColor: AppColors.grey,
                                  label: Text(
                                    AppLocalizations.of(context)!.enterPassword,
                                    style: AppStyles.regular14Text.copyWith(
                                      color: AppColors.black,
                                    ),
                                  ),
                                  controller: passwordController,
                                  validator: (value) => value!.isEmpty
                                      ? AppLocalizations.of(
                                          context,
                                        )!.passwordRequired
                                      : null,
                                ),
                              ),
                              const SizedBox(width: 5),

                              //rePassowrdTextField
                            ],
                          ),
                          //phoneTextField
                          ValueListenableBuilder<TextEditingValue>(
                            valueListenable: phoneNumberController,

                            builder: (context, value, child) {
                              return CustomTextField(
                                validator: (value) => value!.isEmpty
                                    ? AppLocalizations.of(
                                        context,
                                      )!.phoneRequired
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

                                counterText: "${value.text.length}/11"
                                    .toString(),
                              );
                            },
                          ),
                          SizedBox(height: 50),
                          CustomButton(
                            text: AppLocalizations.of(context)!.update,

                            onButtonClicked: () {
                              if (formkey.currentState!.validate()) {
                                context.read<EditProfileCubit>().editProfile(
                                  username: userNameController.text.trim(),
                                  firstName: firstNameController.text.trim(),
                                  lastName: lastNameController.text.trim(),
                                  email: emailController.text.trim(),
                                  phone: phoneNumberController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                              }
                            },

                            buttonColor: AppColors.blue,
                            textStyle: AppStyles.medium18White,
                          ),

                          // FilledButton(
                          //   onPressed: () {
                          //     if (formkey.currentState!.validate()) {
                          //       context.read<SignUpCubit>().signUp(
                          //         UserRequest(
                          //           username: userNameController.text,
                          //           firstName: firstNameController.text,
                          //           lastName: lastNameController.text,
                          //           email: emailController.text,
                          //           password: passwordController.text,
                          //           phone: phoneNumberController.text,
                          //           rePassword: '',
                          //         ),
                          //       );
                          //     }
                          //   },
                          //   child: Text(
                          //     AppLocalizations.of(context)!.update,
                          //     style: AppStyles.medium18White,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
