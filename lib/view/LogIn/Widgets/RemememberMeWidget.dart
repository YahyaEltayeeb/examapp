import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/AppStyles.dart';
import '../../../core/theme/app_colors.dart';

class RememberMeWidget extends StatefulWidget {
  const RememberMeWidget({super.key});

  @override
  State<RememberMeWidget> createState() => _RememberMeWidgetState();
}

class _RememberMeWidgetState extends State<RememberMeWidget> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (bool? newValue) {
            setState(() {
              _isChecked = newValue!;
            });
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          side:  BorderSide(
            color: AppColors.grey,
            width: 2,
          ),
        ),
         SizedBox(width: 2),
         Text(
          'Remember me',
          style: AppStyles.regular14Text
        ),
        Spacer(),
        InkWell(
          onTap: (){},
          child: Text(
              'Forget password ? ',
              style: AppStyles.regular14Text.copyWith(
                decoration:  TextDecoration.underline,
                decorationColor: Colors.black,
                decorationThickness: 1.2,
              )
          ),
        ),

      ],
    );
  }
}