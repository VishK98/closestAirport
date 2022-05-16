import 'package:closestairport/global/constants/all_constants.dart';
import 'package:closestairport/screens/drawer/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../global/presentation/router/app_router.dart';
import '../../../../global/presentation/widgets/checkbox_cell.dart';
import '../../../../global/presentation/widgets/custom_button.dart';
import '../../../../global/presentation/widgets/custom_space.dart';
import '../../../../global/presentation/widgets/custom_textfield.dart';
import '../../../global/presentation/widgets/custom_appbar.dart';
import '../../home/homepage_presentation/home_page.dart';

class AirCraft extends StatefulWidget {
  const AirCraft({Key? key}) : super(key: key);

  @override
  State<AirCraft> createState() => _AirCraftState();
}
class _AirCraftState extends State<AirCraft> {
  final _customAppBar = CustomAppBar();

  final TextEditingController _airCraftController = TextEditingController();
  final TextEditingController _airSpeedController = TextEditingController();
  final TextEditingController _minimumRunwayLenghtController = TextEditingController();
  final TextEditingController _minimumRunWayWidthController= TextEditingController();
  final GlobalKey<ScaffoldState> globalScaffoldKey = GlobalKey<ScaffoldState>();
  var _allowGrass = false;
  var _allowheliports = false;
  var _allowseaplane = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: globalScaffoldKey,
      appBar: customAppBar(onTap: () {
        globalScaffoldKey.currentState?.openEndDrawer();
      }),
      endDrawer: NavigationDrawer(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          width: double.infinity,
          height: double.maxFinite,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppIcons.splash), fit: BoxFit.fill),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                VerticalSpace(140.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 15.h),
                  width: size.width * 0.88,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: AppColor.primary,
                  ),
                  child: Text(
                    AppText.airCraft,
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
                    // BlocBuilder<AirCraftCubit, AirCraftState>(
                    //   builder: (context, state) {
                    //     return
                    //   }
                    // ),
                    CustomTextField(
                        label: AppText.aircraftName,
                        hintText: AppText.aircraftName,
                        textFieldController: _airCraftController,
                        valueDidChange: (value) {},
                        onFocusChange: (isFocus) {}
                    ),
                    VerticalSpace(20.h),
                    CustomTextField(
                        label: AppText.airspeed,
                        hintText: AppText.airspeed,
                        textFieldController: _airSpeedController,
                        valueDidChange: (value) {},
                        onFocusChange: (isFocus) {}
                    ),
                    VerticalSpace(20.h),
                    CustomTextField(
                        label: AppText.minimumRunwayLenght,
                        hintText: AppText.minimumRunwayLenght,
                        textFieldController: _minimumRunwayLenghtController,
                        valueDidChange: (value) {},
                        onFocusChange: (isFocus) {}
                    ),
                    VerticalSpace(20.h),
                    CustomTextField(
                        label: AppText.minimumRunwayWidth,
                        hintText: AppText.minimumRunwayWidth,
                        textFieldController: _minimumRunWayWidthController,
                        valueDidChange: (value) {},
                        onFocusChange: (isFocus) {}
                    ),
                    VerticalSpace(20.h),
                    CustomCheckBoxCell(
                      onCellTap: (int tag) {
                        setState(() {
                          _allowGrass = !_allowGrass;
                        });
                      },
                      title: AppTexts.allow_grass,
                      isSelected: _allowGrass,
                    ),
                    VerticalSpace(20.h),
                    CustomCheckBoxCell(
                      onCellTap: (int tag) {
                        setState(() {
                          _allowheliports = !_allowheliports;
                        });
                      },
                      title: AppTexts.allow_heliports,
                      isSelected: _allowheliports,
                    ),
                    VerticalSpace(20.h),
                    CustomCheckBoxCell(
                      onCellTap: (int tag) {
                        setState(() {
                          _allowseaplane = !_allowseaplane;
                        });
                      },
                      title: AppTexts.seaplane_bases,
                      isSelected: _allowseaplane,
                    ),

                    VerticalSpace(20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          height: 50.h,
                          width: size.width * 0.7,
                          label: AppTexts.save,
                          onTap: () {
                            Navigator.pushNamed(context, AppRoute.home);
                          },
                        ),
                      ],
                    ),
                    VerticalSpace(10.h),
                  ],
                ),
              ),
              VerticalSpace(40.h),
            ],
          ),
        ),
      ),
    ),);
  }
}