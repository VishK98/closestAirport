import 'package:closestairport/global/presentation/widgets/custom_textfield.dart';
import 'package:closestairport/screens/drawer/drawer_screen.dart';
import 'package:closestairport/screens/password/password_logic/confirm_password_cubit.dart';
import 'package:closestairport/screens/password/password_logic/current_password_cubit.dart';
import 'package:closestairport/screens/password/password_logic/new_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global/constants/app_color.dart';
import '../../../global/constants/app_font.dart';
import '../../../global/constants/app_icons.dart';
import '../../../global/constants/app_strings.dart';
import '../../../global/presentation/router/app_router.dart';
import '../../../global/presentation/widgets/custom_appbar.dart';
import '../../../global/presentation/widgets/custom_button.dart';
import '../../../global/presentation/widgets/custom_space.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final _customAppBar = CustomAppBar();
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<ScaffoldState> globalScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        key: globalScaffoldKey,
        appBar:customAppBar(onTap: () {
          globalScaffoldKey.currentState?.openEndDrawer();
        }),
        endDrawer: const NavigationDrawer(),
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
                VerticalSpace(160.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 15.h),
                  height: 50,
                  width: size.width * 0.88,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: AppColor.primary,
                  ),
                  child: Text(
                    AppText.password2,
                    style: AppFont.largeBoldTextWithWhiteColor(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 15.h),
                  // height: size.height * 0.6,
                  width: size.width * 0.88,
                  decoration: const BoxDecoration(
                      color: AppColor.appWhite,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<CurrentPasswordCubit, CurrentPasswordState>(
                          builder: (context, state) {
                        return CustomTextField(
                            hintText: AppText.currentpassword,
                            label: AppText.currentpassword,
                            textFieldController: _currentPasswordController,
                            valueDidChange: (value) {
                              context
                                  .read<CurrentPasswordCubit>()
                                  .checkCurrentPassword(value);
                            },
                            onFocusChange: (isFocus) {
                              if (isFocus) {
                                context
                                    .read<CurrentPasswordCubit>()
                                    .setFocusOnCurrentPassword();
                              } else {
                                context
                                    .read<CurrentPasswordCubit>()
                                    .setFocusOffCurrentPassword();
                              }
                            });
                      }),
                      VerticalSpace(20.h),
                      BlocBuilder<NewPasswordCubit, NewPasswordState>(
                          builder: (context, state) {
                        return CustomTextField(
                            hintText: AppText.newpassword,
                            label: AppText.newpassword,
                            textFieldController: _newPasswordController,
                            valueDidChange: (value) {
                              context
                                  .read<NewPasswordCubit>()
                                  .checkNewPassword(value);
                            },
                            onFocusChange: (isFocus) {
                              if (isFocus) {
                                context
                                    .read<NewPasswordCubit>()
                                    .setFocusOnNewPassword();
                              } else {
                                context
                                    .read<NewPasswordCubit>()
                                    .setFocusOffNewPassword();
                              }
                            });
                      }),
                      VerticalSpace(20.h),
                      BlocBuilder<ConfirmPasswordCubit, ConfirmPasswordState>(
                          builder: (context, state) {
                        return CustomTextField(
                            hintText: AppText.confirmpassword,
                            label: AppText.confirmpassword,
                            textFieldController: _confirmPasswordController,
                            valueDidChange: (value) {
                              context
                                  .read<ConfirmPasswordCubit>()
                                  .checkConfirmPassword(value);
                            },
                            onFocusChange: (isFocus) {
                              if (isFocus) {
                                context
                                    .read<ConfirmPasswordCubit>()
                                    .setFocusOnConfirmPassword();
                              } else {
                                context
                                    .read<ConfirmPasswordCubit>()
                                    .setFocusOffConfirmPassword();
                              }
                            });
                      }),
                      VerticalSpace(30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            height: 50.h,
                            width: size.width * 0.7,
                            label: AppText.updatebutton,
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
