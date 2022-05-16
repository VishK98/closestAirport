
import 'package:closestairport/global/presentation/widgets/custom_appbar.dart';
import 'package:closestairport/screens/drawer/drawer_screen.dart';
import 'package:closestairport/screens/drawer/drawer_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global/constants/app_color.dart';
import '../../../global/constants/app_font.dart';
import '../../../global/constants/app_icons.dart';
import '../../../global/constants/app_strings.dart';
import '../../../global/presentation/widgets/custom_appbar.dart';
import '../../../global/presentation/widgets/custom_space.dart';
import '../../home/homepage_presentation/home_page.dart';
import 'aboutWidget.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}
//final _customAppBar = CustomAppBar();


class _AboutScreenState extends State<AboutScreen> {
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
      body: Container(
        width: double.infinity,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppIcons.splash), fit: BoxFit.cover),
        ),
        child: CupertinoScrollbar(
          thickness: 20,
          isAlwaysShown: true,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                VerticalSpace(55.h),
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
                    AppText.about,
                    style: AppFont.largeBoldTextWithWhiteColor(),
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
                    width: size.width * 0.88,
                    height: size.height * 0.80,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                      ),
                      color: AppColor.appWhite,
                    ),
                    child: Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            const Text("Far too many times, either with my own personal airplane, or with the work airplane, I have been tasked with finding the closest suitable airport to an address or int of interest. I had relied on Google Maps, and a host of other tools, to figure out which airport is the closest in terms of driving distance to my destination.",style: TextStyle(fontSize: 14),),
                            VerticalSpace(15.h),
                            const Text("Having been both a pilot and software engineer since my late teenage years, I decided to put together a program that allows you to"),
                            VerticalSpace(15.h),
                            const BulletList(),
                          ],
                        ),
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



