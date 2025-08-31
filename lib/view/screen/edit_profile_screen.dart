import 'package:examapp/core/di/di.dart';
import 'package:examapp/core/l10n/translation/app_localizations.dart';
import 'package:examapp/core/route/app_routes.dart';
import 'package:examapp/core/validation/validator.dart';
import 'package:examapp/domain/Model/request/edit_profile_request.dart';
import 'package:examapp/view_model/edit_profile_bloc.dart/edit_profile_bloc.dart';
import 'package:examapp/view_model/edit_profile_bloc.dart/edit_profile_event.dart';
import 'package:examapp/view_model/edit_profile_bloc.dart/edit_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
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
      create: (_) => getIt<EditProfileBloc>()..add(GetUserDataEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.editProfile),
          automaticallyImplyLeading: false,
        ),
        body: BlocBuilder<EditProfileBloc, EditProfileState>(
          builder: (context, state) {
            userNameController.text = state.userModelEdit?.username ?? '';
            firstNameController.text = state.userModelEdit?.firstName ?? '';
            lastNameController.text = state.userModelEdit?.lastName ?? '';
            emailController.text = state.userModelEdit?.email ?? '';
            passwordController.text = state.userModelEdit?.password ?? '';
            phoneNumberController.text = state.userModelEdit?.phone ?? '';
            if (state.errorMessageEdit.isNotEmpty) {
              return Center(child: Text(state.errorMessageEdit));
            }
            return Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 15,
                    children: [
                      //userName
                      TextFormField(
                        validator: (value) => value!.isEmpty
                            ? AppLocalizations.of(context)!.firstNameRequired
                            : null,
                        controller: userNameController,
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.enterUserName,
                          labelText: AppLocalizations.of(context)!.userName,
                        ),
                      ),
                      Row(
                        spacing: 5,
                        children: [
                          //firstName
                          Expanded(
                            child: TextFormField(
                              controller: firstNameController,
                              decoration: InputDecoration(
                                labelText: AppLocalizations.of(
                                  context,
                                )!.firstName,
                                hintText: AppLocalizations.of(
                                  context,
                                )!.enterFirstName,
                                helperText: '',
                              ),
                            ),
                          ),
                          //lastName
                          Expanded(
                            child: TextFormField(
                              validator: (value) => value!.isEmpty
                                  ? AppLocalizations.of(
                                      context,
                                    )!.lastNameRequired
                                  : null,
                              controller: lastNameController,
                              decoration: InputDecoration(
                                helperText: '',
                                labelText: AppLocalizations.of(
                                  context,
                                )!.lastName,
                                hintText: AppLocalizations.of(
                                  context,
                                )!.enterLastName,
                              ),
                            ),
                          ),
                        ],
                      ),
                      //email
                      TextFormField(
                        controller: emailController,
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
                        decoration: InputDecoration(
                          helperText: '',
                          labelText: AppLocalizations.of(context)!.email,
                          hintText: AppLocalizations.of(context)!.enterEmail,
                        ),
                      ),
                      //password
                      TextFormField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        controller: passwordController,
                        decoration: InputDecoration(
                          suffixIcon: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                               AppRoutes.changePassword
                              );
                            },
                            child: Text(AppLocalizations.of(context)!.change),
                          ),
                          helperText: '',
                          labelText: AppLocalizations.of(context)!.password,
                          hintText: AppLocalizations.of(context)!.enterPassword,
                        ),
                      ),
                      //phone
                      ValueListenableBuilder<TextEditingValue>(
                        valueListenable: phoneNumberController,
                        builder: (context, value, child) {
                          return TextFormField(
                            controller: phoneNumberController,
                            maxLength: 11,
                            validator: (value) => value!.isEmpty
                                ? AppLocalizations.of(context)!.phoneRequired
                                : null,
                            decoration: InputDecoration(
                              helperText: '',
                              labelText: AppLocalizations.of(
                                context,
                              )!.phoneNumber,
                              hintText: AppLocalizations.of(
                                context,
                              )!.enterPhoneNumber,
                              counterText: '${value.text.length}/11'.toString(),
                            ),
                          );
                        },
                      ),
                      BlocBuilder<EditProfileBloc, EditProfileState>(
                        builder: (context, state) {
                          return SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: state.isLoaddingEdit
                                  ? null
                                  : () {
                                      context.read<EditProfileBloc>().add(
                                        EditProfileEvent(
                                          EditProfileRequest(
                                            email: emailController.text,
                                            lastName: lastNameController.text,
                                            firstName: firstNameController.text,
                                            phone: phoneNumberController.text,
                                            username: userNameController.text,
                                          ),
                                        ),
                                      );
                                    },
                              child: Text(
                                AppLocalizations.of(context)!.upDate,
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
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
