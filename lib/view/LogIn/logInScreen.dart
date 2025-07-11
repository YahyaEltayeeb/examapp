import 'package:flutter/material.dart';

import '../core/theme/AppStyles.dart';
import '../core/theme/CustomWidget/CustomTextField.dart';
import '../core/theme/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
            }
            ,),
        title:  Text("Login",
            style:AppStyles.regular12Text
        ),
        titleSpacing: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 24,),
              CustomTextFormField(borderColor: AppColors.grey,),
              SizedBox(height: 24,),
              CustomTextFormField(borderColor: AppColors.grey,),
            ],
          ),
        ),
      ),
    );
  }
}
