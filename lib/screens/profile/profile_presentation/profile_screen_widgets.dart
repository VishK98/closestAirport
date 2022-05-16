import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global/constants/app_color.dart';
import '../../../global/constants/app_font.dart';
import '../../../global/constants/app_strings.dart';
import '../../../global/presentation/router/app_router.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(left: 70.w),
      child:  RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
                text: AppText.changeyourpassword,
                style: AppFont.regularTextWithColor(
                    color: AppColor.primary),
                recognizer: TapGestureRecognizer()..onTap= (){
                  Navigator.of(context).pushNamed(AppRoute.register);
                }),
          ],
        ),
      ),
    );

  }
}