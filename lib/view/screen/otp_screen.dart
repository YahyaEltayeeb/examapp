import 'package:examapp/core/l10n/translation/app_localizations.dart';
import 'package:examapp/core/route/app_routes.dart';
import 'package:examapp/domain/Model/request/verify_code_request.dart';
import 'package:examapp/view_model/verify_code_cubit/verify_code_cubit.dart';
import 'package:examapp/view_model/verify_code_cubit/verify_code_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onOtpChanged(String value, int index) {
    if (value.length == 1 && index < _focusNodes.length - 1) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.length == 1 && index == _focusNodes.length - 1) {
      FocusScope.of(context).unfocus();
      _submitOtp();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  void _submitOtp() {
    String otp = _controllers.map((c) => c.text).join();
    context.read<VerifyCodeCubit>().verifyOtp(VerifyCodeRequest(otp));
  }

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(title:  Text( AppLocalizations.of(context)!.password)),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _key,
              child: BlocListener<VerifyCodeCubit, VerifyCodeState>(
                listener: (context, state) {
                  if (state is VerifyCodeLoadding) {
                    Center(child: CircularProgressIndicator());
                  } else if (state is VerifyCodeError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.messageError),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else if (state is VerifyCodeSuccess) {
                    Navigator.pushNamed(context, AppRoutes.signIn);
                  }
                },
                child: BlocBuilder<VerifyCodeCubit, VerifyCodeState>(
                  builder: (context, state) {
                    return Column(
                      spacing: 10,
                      children: [
                        const SizedBox(height: 40),
                        Text(
                           AppLocalizations.of(context)!.emailVerification,

                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          AppLocalizations.of(context)!.enterCode,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(6, (index) {
                            return Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: SizedBox(
                                  width: 60,
                                  child: TextFormField(
                                    validator: (value) {
                                      return value!.isEmpty
                                          ?  AppLocalizations.of(context)!.invalidCode
                                          : null;
                                    },
                                    controller: _controllers[index],

                                    focusNode: _focusNodes[index],
                                    maxLength: 1,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 24),
                                    decoration: InputDecoration(
                                      counterText: '',
                                    ),

                                    onChanged: (value) =>
                                        _onOtpChanged(value, index),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
