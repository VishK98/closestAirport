import 'package:closestairport/screens/drawer/drawer_screen.dart';
import 'package:closestairport/screens/profile/profile_presentation/profile_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global/constants/app_color.dart';
import '../../../global/constants/app_font.dart';
import '../../../global/constants/app_icons.dart';
import '../../../global/constants/app_strings.dart';
import '../../../global/constants/app_texts.dart';
import '../../../global/presentation/router/app_router.dart';
import '../../../global/presentation/widgets/custom_appbar.dart';
import '../../../global/presentation/widgets/custom_button.dart';
import '../../../global/presentation/widgets/custom_space.dart';
import '../../../global/presentation/widgets/custom_textfield.dart';
import '../../home/homepage_presentation/home_page.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
final TextEditingController _firstnameController = TextEditingController();
final TextEditingController _lastnameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();

final _customAppBar = CustomAppBar();


class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> globalScaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        key: globalScaffoldKey,
        appBar:customAppBar(onTap: () {
      globalScaffoldKey.currentState?.openEndDrawer();
    }),
      endDrawer: const  NavigationDrawer(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
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
                      AppText.profile,
                      style: AppFont.largeBoldTextWithWhiteColor(),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 15.h),
                    width: size.width * 0.88,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                      ),
                      color: AppColor.appWhite,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                            label: AppText.firstname,
                            hintText: AppText.firstname,
                            textFieldController: _firstnameController,
                            valueDidChange: (value) {},
                            onFocusChange: (isFocus) {}
                        ),
                        VerticalSpace(20.h),
                        CustomTextField(
                            label: AppText.lastname,
                            hintText: AppText.lastname,
                            textFieldController: _lastnameController,
                            valueDidChange: (value) {},
                            onFocusChange: (isFocus) {}
                        ),
                        VerticalSpace(15.h),
                        CustomTextField(
                            label: AppText.email,
                            hintText: AppText.emaillabel,
                            textFieldController: _emailController,
                            valueDidChange: (value) {},
                            onFocusChange: (isFocus) {}
                        ),
                        VerticalSpace(20.h),
                        Text(AppText.selectDefaultAircraft, style: AppFont.regularMediumTextWithColor(),),
                        Container(
                          padding: EdgeInsets.only(left: 12.w, right: 20.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey[400]!),
                          ),
                          child: DropdownButton(
                            isExpanded: true,
                            underline: const SizedBox.shrink(),
                            hint: const Text('Select Aircraft'),
                            items: const [
                              DropdownMenuItem(
                                  child: Text('Indigo'), value: 'Indigo'),
                              DropdownMenuItem(
                                  child: Text('SpiceJet'), value: 'SpiceJet'),
                              DropdownMenuItem(
                                  child: Text('Vistara'), value: 'Vistara'),
                              DropdownMenuItem(
                                  child: Text('Air India'), value: 'Air India'),
                            ],
                            onChanged: (value) {},
                          ),),
                        VerticalSpace(15.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                              height: 65.h,
                              width: size.width * 0.7,
                              label: AppTexts.update_profile,
                              onTap: () {
                                Navigator.pushNamed(context, AppRoute.home);
                              },
                            ),
                          ],
                        ),
                        VerticalSpace(15.h),
                        const ChangePassword(),
                        VerticalSpace(10.h),



                    // BlocBuilder<FirstNameCubit, FirstNameState>(
                    //   builder: (context, state) {
                    //     return CustomTextField(
                    //       label: AppText.firstname,
                    //       hintText: AppText.firstname,
                    //       textFieldController: _firstnameController,
                    //       errorText:
                    //       (!state.isValid) ? AppText.firstnameError : null,
                    //       highLight: (state.isValid && state.isFocused)
                    //           ? AppColor.primary
                    //           : (!state.isFocused && state.isValid)
                    //           ? AppColor.strokes
                    //           : AppColor.appRed,
                    //       valueDidChange: (value) {
                    //         context.read<FirstNameCubit>()
                    //             .checkFirstName(value);
                    //       },
                    //       onFocusChange: (isFocus) {
                    //         if (isFocus) {
                    //           context.read<FirstNameCubit>()
                    //               .setFocusOnFirstName();
                    //         } else {
                    //           context.read<FirstNameCubit>()
                    //              .setFocusOffFirstName();
                    //         }
                    //       },
                    //     );
                    //   },
                    // ),
                  ],
                ),
              )
            ],
          )
        ),
      ),
    ));
  }
}
