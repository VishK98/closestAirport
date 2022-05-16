import 'package:closestairport/global/constants/all_constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../global/presentation/router/app_router.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: AppText.alreadyHaveAnAccount,
        style: AppFont.regularTextWithColor(),
        children: <TextSpan> [
          TextSpan(
            text: AppText.signIn,
            style: AppFont.regularTextWithColor(
                color: AppColor.primary),
              recognizer: TapGestureRecognizer()..onTap= (){
                Navigator.of(context).pushNamed(AppRoute.signIn);
              }),
        ]
      )
    );
  }
}
