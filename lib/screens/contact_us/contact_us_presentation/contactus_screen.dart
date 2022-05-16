import 'package:closestairport/global/presentation/router/app_router.dart';
import 'package:closestairport/global/presentation/widgets/custom_button.dart';
import 'package:closestairport/global/presentation/widgets/custom_textfield.dart';
import 'package:closestairport/screens/drawer/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global/constants/app_color.dart';
import '../../../global/constants/app_font.dart';
import '../../../global/constants/app_icons.dart';
import '../../../global/constants/app_strings.dart';
import '../../../global/presentation/widgets/custom_appbar.dart';
import '../../../global/presentation/widgets/custom_space.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final GlobalKey<ScaffoldState> globalScaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
                VerticalSpace(150.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 15.h),
                  height: 47,
                  width: size.width * 0.88,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: AppColor.primary,
                  ),
                  child: Text(
                    AppText.contactus,
                    style: AppFont.largeBoldTextWithWhiteColor(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 15.h),
                  width: size.width * 0.88,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: AppColor.appWhite,
                  ),
                  child: Column(
                    children: [
                      CustomTextField(
                          hintText: AppText.entername,
                          label: AppText.name,
                          textFieldController: _nameController,
                          valueDidChange: (value) {},
                          onFocusChange: (isFocus) {}),
                      VerticalSpace(20.h),
                      CustomTextField(
                          hintText: AppText.enterYourEmail,
                          label: AppText.email,
                          textFieldController: _emailController,
                          valueDidChange: (value) {},
                          onFocusChange: (isFocus) {}),
                      VerticalSpace(20.h),
                      CustomTextField(
                          hintText: AppText.number,
                          label: AppText.contactno,
                          textFieldController: _contactController,
                          valueDidChange: (value) {},
                          onFocusChange: (isFocus) {}),
                      VerticalSpace(20.h),
                      CustomTextField(
                          minLines: 4,
                          maxLines: 6,
                          hintText: AppText.entermessage,
                          label: AppText.message,
                          textFieldController: _messageController,
                          valueDidChange: (value) {},
                          onFocusChange: (isFocus) {}),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
