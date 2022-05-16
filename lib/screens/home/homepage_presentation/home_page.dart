import 'package:closestairport/global/constants/all_constants.dart';
import 'package:closestairport/global/constants/app_icons.dart';
import 'package:closestairport/global/constants/app_texts.dart';
import 'package:closestairport/global/constants/size_config.dart';
import 'package:closestairport/global/presentation/router/app_router.dart';
import 'package:closestairport/global/presentation/widgets/checkbox_cell.dart';
import 'package:closestairport/global/presentation/widgets/common_widgets.dart';
import 'package:closestairport/global/presentation/widgets/custom_appbar.dart';
import 'package:closestairport/global/presentation/widgets/custom_button.dart';
import 'package:closestairport/global/presentation/widgets/custom_space.dart';
import 'package:closestairport/global/presentation/widgets/custom_textfield.dart';
import 'package:closestairport/screens/drawer/drawer_screen.dart';
import 'package:closestairport/screens/home/homepage_presentation/home_page_widget.dart';
import 'package:closestairport/screens/home/homepage_presentation/homepage_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _customAppBar = CustomAppBar();
  final _sizeMultiplier = 10.0;
  final TextEditingController _runwayWidthController = TextEditingController();
  final TextEditingController _runwayLengthController = TextEditingController();
  final _runwayWidthFocusNode = FocusNode();
  final _runwayLengthFocusNode = FocusNode();
  final boxHeight = 38.w;
  final GlobalKey<ScaffoldState> globalScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    bool value = false;
    return Scaffold(
        key: globalScaffoldKey,
        appBar: customAppBar(onTap: () {
      globalScaffoldKey.currentState?.openEndDrawer();
    }),
    endDrawer: const NavigationDrawer(),
      backgroundColor: AppColor.bgColor,
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
            maintainBottomViewPadding: true,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Stack(children: [
    Container(
    height: MediaQuery.of(context).size.height/1.7,
    width: MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(
    image: DecorationImage(
    image: AssetImage(AppIcons.splash), fit: BoxFit.cover),
    ),
    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.5 * _sizeMultiplier),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeHorizontal! * 5,
                            vertical: SizeConfig.blockSizeVertical! * 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CommonHeader(label: AppTexts.airport_req),
                            VerticalSpace(20.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.h),
                                    child: Text(
                                      AppTexts.sel_air,
                                      style: AppFont.mediumMediumTextWithColor(
                                          color: AppColor.textColor2),
                                    ),
                                  ),
                                  Container(
                                    // width: double.maxFinite,
                                      padding:
                                      EdgeInsets.only(left: 12.w, right: 20.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                        Border.all(color: Colors.grey[400]!),
                                      ),
                                      child: DropDownMenu()



                                  /*DropdownButton(
                                    isExpanded: true,
                                    underline: const SizedBox.shrink(),
                                    hint: const Text('Select Aircraft'),
                                    icon: Transform.rotate(
                                        angle: 270 * math.pi / 180,
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          size: 20.h,
                                          color: AppColor.appBlack,
                                        )),
                                    items: const [
                                      DropdownMenuItem(
                                          child: Text('Men'), value: 'Men'),
                                      DropdownMenuItem(
                                          child: Text('Women'), value: 'Women'),
                                      DropdownMenuItem(
                                          child: Text('NA'), value: 'NA'),
                                    ],
                                    onChanged: (value) {},
                                  ),*/
                                ),
                                VerticalSpace(11.h),
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 90.w,
                                        height: boxHeight,
                                        child: CommonTextField(
                                          validator: (value) {
                                            return '';
                                          },
                                          controller: _runwayWidthController,
                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.next,
                                          focusNode: _runwayWidthFocusNode,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 12.h, horizontal: 10.w),
                                        ),
                                      ),
                                      HorizontalSpace(16.w),
                                      Text(
                                        AppTexts.runway_wdt,
                                        style: AppFont.regularTextWithColor(
                                            color: AppColor.textColor2),
                                      )
                                    ]),
                                VerticalSpace(11.h),
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 90.w,
                                        height: boxHeight,
                                        child: CommonTextField(
                                          validator: (value) {
                                            return '';
                                          },
                                          controller: _runwayLengthController,
                                          keyboardType: TextInputType.number,
                                          textInputAction: TextInputAction.done,
                                          focusNode: _runwayLengthFocusNode,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 12.h, horizontal: 10.w),
                                        ),
                                      ),
                                      HorizontalSpace(16.w),
                                      Text(
                                        AppTexts.runway_len,
                                        style: AppFont.regularTextWithColor(
                                            color: AppColor.textColor2),
                                      )
                                    ]),
                                VerticalSpace(11.h),
                                FilterCheckBox(filterType: AppTexts.jetfuel,tag: 0,isChecked: false),
                                VerticalSpace(11.h),
                                FilterCheckBox(filterType:AppTexts.avgas,tag: 1,isChecked: false),
                                VerticalSpace(11.h),
                                FilterCheckBox(filterType:AppTexts.turf_run, tag: 2,isChecked: false),
                                VerticalSpace(11.h),
                                FilterCheckBox(filterType:AppTexts.seaplane_bases,tag: 3,isChecked: false),
                                VerticalSpace(11.h),
                                FilterCheckBox(filterType:AppTexts.allow_heliports, tag: 4,isChecked: false),
                                VerticalSpace(22.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: CustomButton(
                                        height: 56.h,
                                        width: size.width,
                                        label: AppTexts.txt_filter,
                                        onTap: () {

                                          Navigator.pushReplacementNamed(
                                              context,AppRoute.search);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                VerticalSpace(20.h),
                                /* Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20, left: 20, right: 20),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF1B317D),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                    child: Text(
                                      AppTexts.txt_filter,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),*/
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          )),
    ),);
  }

}
