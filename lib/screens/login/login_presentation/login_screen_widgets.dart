import 'package:closestairport/global/constants/all_constants.dart';
import 'package:closestairport/global/presentation/router/app_router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class RegisterYourSelf extends StatelessWidget {
  const RegisterYourSelf({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: AppText.newAtClosest,
        style: AppFont.regularTextWithColor(),
        children: <TextSpan>[
          TextSpan(
              text: AppText.registerUrSelf,
              style: AppFont.regularTextWithColor(
                  color: AppColor.primary),
              recognizer: TapGestureRecognizer()..onTap= (){
                Navigator.of(context).pushNamed(AppRoute.register);
              }),
        ],
      ),
    );
  }
}

class ForgotPassText extends StatelessWidget {
  const ForgotPassText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: ()=>Navigator.pushNamed(context, AppRoute.forgotPassword),
          child: Text(
            AppText.forgotPassword,
            style: AppFont.regularTextWithColor(color: AppColor.secondaryTextColor),
          ),
        ),
      ],
    );
  }
}

class KeepMeSignedInWidget extends StatelessWidget {
  const KeepMeSignedInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

      ],
    );
  }
}

