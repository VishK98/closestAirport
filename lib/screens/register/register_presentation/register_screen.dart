import 'package:closestairport/global/constants/all_constants.dart';
import 'package:closestairport/global/presentation/widgets/custom_space.dart';
import 'package:closestairport/global/presentation/widgets/custom_textfield.dart';
import 'package:closestairport/screens/drawer/drawer_screen.dart';
import 'package:closestairport/screens/login/login_logic/email_cubit.dart';
import 'package:closestairport/screens/login/login_logic/password_cubit.dart';
import 'package:closestairport/screens/register/register_logic/contact_cubit.dart';
import 'package:closestairport/screens/register/register_logic/lastname_cubit.dart';
import 'package:closestairport/screens/register/register_presentation/register_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../global/constants/app_color.dart';
import '../../../global/constants/app_icons.dart';
import '../../../global/presentation/router/app_router.dart';
import '../../../global/presentation/widgets/custom_button.dart';
import 'package:closestairport/global/presentation/widgets/custom_appbar.dart';

import '../../home/homepage_presentation/home_page.dart';
import '../register_logic/firstname_cubit.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
   final _customAppBar = CustomAppBar();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
   final GlobalKey<ScaffoldState> globalScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: globalScaffoldKey,
      appBar: customAppBar(onTap: () {
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
                VerticalSpace(135.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 21.h),
                  // height: size.height * 0.6,
                  width: size.width * 0.88,
                  decoration: const BoxDecoration(
                      color: AppColor.appWhite,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppText.registerUrSelf,
                        style: AppFont.largeBoldTextWithColor(),
                      ),
                      VerticalSpace(21.h),
                      const AlreadyHaveAnAccount(),
                      VerticalSpace(20.h),
                      BlocBuilder<FirstNameCubit, FirstNameState>(
                          builder: (context, state) {
                        return CustomTextField(
                          textInputAction: TextInputAction.next,
                            label: AppText.firstname,
                            hintText: AppText.firstname,
                            textFieldController: _firstNameController,
                            valueDidChange: (value) {
                              context
                                  .read<FirstNameCubit>()
                                  .checkFirstName(value);
                            },
                            onFocusChange: (isFocus) {
                              if (isFocus) {
                                context
                                    .read<FirstNameCubit>()
                                    .setFocusOnFirstName();
                              } else {
                                context
                                    .read<FirstNameCubit>()
                                    .setFocusOffFirstName();
                              }
                            });
                      }),
                      VerticalSpace(20.h),
                      BlocBuilder<LastNameCubit, LastNameState>(
                          builder: (context, state) {
                        return CustomTextField(
                            textInputAction: TextInputAction.next,
                            label: AppText.lastname,
                            hintText: AppText.lastname,
                            textFieldController: _lastNameController,
                            valueDidChange: (value) {
                              context.read<LastNameCubit>().checkLastName(value);
                            },
                            onFocusChange: (isFocus) {
                              if (isFocus) {
                                context
                                    .read<LastNameCubit>()
                                    .setFocusOnLastName();
                              } else {
                                context
                                    .read<LastNameCubit>()
                                    .setFocusOffLastName();
                              }
                            });
                      }),
                      VerticalSpace(20.h),
                      BlocBuilder<EmailCubit, EmailState>(
                        builder: (context, state) {
                          return CustomTextField(
                            textInputAction: TextInputAction.next,
                            label: AppText.email,
                            hintText: AppText.enteremail,
                            textFieldController: _emailController,
                            errorText:
                                (!state.isValid) ? AppText.emailError : null,
                            highLight: (state.isValid && state.isFocused)
                                ? AppColor.primary
                                : (!state.isFocused && state.isValid)
                                    ? AppColor.strokes
                                    : AppColor.appRed,
                            valueDidChange: (value) {
                              context.read<EmailCubit>().checkEmail(value);
                            },
                            onFocusChange: (isFocus) {
                              if (isFocus) {
                                context.read<EmailCubit>().setFocusOnEmail();
                              } else {
                                context.read<EmailCubit>().setFocusOffEmail();
                              }
                            },
                          );
                        },
                      ),
                      VerticalSpace(20.h),
                      BlocBuilder<PasswordCubit, PasswordState>(
                        builder: (context, state) {
                          return CustomTextField(
                              textInputAction: TextInputAction.next,
                              label: AppText.password2,
                              hintText: AppText.enterpassword,
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
                      VerticalSpace(20.h),
                      BlocBuilder<ContactCubit, ContactState>(
                          builder: (context, state) {
                        return CustomTextField(
                            textInputAction: TextInputAction.done,
                            label: AppText.contact,
                            hintText: AppText.contact,
                            textFieldController: _contactController,
                            valueDidChange: (value) {
                              context.read<ContactCubit>().checkContact(value);
                            },
                            onFocusChange: (isFocus) {
                              if (isFocus) {
                                context.read<ContactCubit>().setFocusOnContact();
                              } else {
                                context.read<ContactCubit>().setFocusOffContact();
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
                            label: AppText.registerbutton,
                            onTap: () {
                              Navigator.pushNamed(context, AppRoute.home);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                VerticalSpace(40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





