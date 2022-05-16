import 'package:closestairport/global/constants/app_color.dart';
import 'package:closestairport/global/constants/app_font.dart';
import 'package:closestairport/global/constants/app_icons.dart';
import 'package:closestairport/global/constants/app_strings.dart';
import 'package:closestairport/global/presentation/router/app_router.dart';
import 'package:closestairport/global/presentation/widgets/checkbox_cell.dart';
import 'package:closestairport/global/presentation/widgets/custom_button.dart';
import 'package:closestairport/global/presentation/widgets/custom_space.dart';
import 'package:closestairport/global/presentation/widgets/custom_textfield.dart';
import 'package:closestairport/screens/drawer/drawer_screen.dart';
import 'package:closestairport/screens/home/homepage_presentation/home_page.dart';
import 'package:closestairport/screens/login/login_logic/email_cubit.dart';
import 'package:closestairport/screens/login/login_logic/password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:closestairport/global/presentation/widgets/custom_appbar.dart';
import 'login_screen_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _customAppBar = CustomAppBar();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var _signedIn_checkbox = false;
  final GlobalKey<ScaffoldState> globalScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: globalScaffoldKey,
      resizeToAvoidBottomInset: false,
      endDrawerEnableOpenDragGesture: true,
      endDrawer: const NavigationDrawer(),
      appBar: customAppBar(onTap: () {
        globalScaffoldKey.currentState?.openEndDrawer();
      }),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          width: double.infinity,
          height: double.maxFinite,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppIcons.splash), fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                VerticalSpace(150.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 21.h),
                  // height: size.height * 0.6,
                  width: size.width* 0.88,
                  decoration: const BoxDecoration(
                      color: AppColor.appWhite,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppText.signIn,
                        style: AppFont.largeBoldTextWithColor(),
                      ),
                      VerticalSpace(21.h),
                      const RegisterYourSelf(),
                      VerticalSpace(20.h),
                      BlocBuilder<EmailCubit, EmailState>(
                        builder: (context, state) {
                          return CustomTextField(
                            label: AppText.userNameOrEmail,
                            hintText: AppText.enterYourEmail,
                            textFieldController: _emailController,
                            errorText:
                                (!state.isValid) ? AppText.emailError : null,
                            highLight: (state.isValid && state.isFocused)
                                ? AppColor.primary
                                : (!state.isFocused && state.isValid)
                                    ? AppColor.strokes
                                    : AppColor.appRed,
                            valueDidChange: (value) {
                              context.read<EmailCubit>()
                                  .checkEmail(value);
                            },
                            onFocusChange: (isFocus) {
                              if (isFocus) {
                                context.read<EmailCubit>()
                                    .setFocusOnEmail();
                              } else {
                                context.read<EmailCubit>()
                                    .setFocusOffEmail();
                              }
                            },
                          );
                        },
                      ),
                      VerticalSpace(20.h),
                      BlocBuilder<PasswordCubit, PasswordState>(
                        builder: (context, state) {
                          return CustomTextField(
                              label: AppText.password,
                              hintText: AppText.enterYourPassword,
                              textFieldController: _passwordController,
                              errorText:
                              (!state.isValid) ? AppText.passwordError : null,
                              highLight: (state.isValid && state.isFocused)
                                  ? AppColor.primary
                                  : (!state.isFocused && state.isValid)
                                  ? AppColor.strokes
                                  : AppColor.appRed,
                              isObscure: true,
                              valueDidChange: (value) {
                                context.read<PasswordCubit>().checkPassword(value);
                              },
                              onFocusChange: (isFocus) {
                                if (isFocus) {
                                  context.read<PasswordCubit>().onFocus();
                                } else {
                                  context.read<PasswordCubit>().offFocus();
                                }
                              });
                        },
                      ),
                      VerticalSpace(5.h),
                      const ForgotPassText(),
                      VerticalSpace(10.h),
                      CustomCheckBoxCell(
                        onCellTap: (int tag) {
                          setState(() {
                            _signedIn_checkbox = !_signedIn_checkbox;
                          });
                        },
                        title: AppText.keepMeSignedIn,
                        isSelected: _signedIn_checkbox,
                      ),
                      VerticalSpace(30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            height: 50.h,
                            width: size.width * 0.7,
                            label: AppText.signIn,
                            onTap: () {
                              Navigator.pushNamed(context, AppRoute.home);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
