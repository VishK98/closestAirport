

import 'package:closestairport/global/constants/all_constants.dart';
import 'package:closestairport/global/constants/app_icons.dart';
import 'package:closestairport/global/constants/app_texts.dart';
import 'package:closestairport/global/constants/size_config.dart';
import 'package:closestairport/global/presentation/widgets/common_widgets.dart';
import 'package:closestairport/global/presentation/widgets/custom_appbar.dart';
import 'package:closestairport/global/presentation/widgets/custom_button.dart';
import 'package:closestairport/global/presentation/widgets/custom_space.dart';
import 'package:closestairport/screens/drawer/drawer_screen.dart';

import 'package:closestairport/global/presentation/widgets/custom_textfield.dart';
import 'package:closestairport/screens/search/search_presentation/closest_hotel_expandable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _customAppBar = CustomAppBar();
  final _sizeMultiplier = 10.0;
  final TextEditingController _searchBarEnteredText = TextEditingController();
  final TextEditingController _closestHotelNearDestination = TextEditingController();
  final TextEditingController _originAirport=TextEditingController();
  final boxHeight = 38.w;
  bool _isSearchButtonTapped = false;
  bool _isCalculateButtonTapped = false;
  bool _isAirspeedButtonTapped = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    SizeConfig().init(context);

    return Scaffold(
        appBar: _customAppBar.appbar(),
        endDrawer: NavigationDrawer(),
        backgroundColor: AppColor.bgColor,
        body: SafeArea(
          maintainBottomViewPadding: true,


            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Stack(
                    children: [Container(
                      height: MediaQuery.of(context).size.height/1.75,
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
                              borderRadius: BorderRadius.circular(22)),
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.blockSizeHorizontal! * 5,
                              vertical: SizeConfig.blockSizeVertical! * 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CommonHeader(label: AppTexts.gen_aviation),
                              VerticalSpace(20.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.h),
                                      child: Text(
                                        //logic to be implement for getting selected aircraft
                                        AppTexts.dummy,
                                        style: AppFont.mediumBoldTextWithColor(
                                            color: AppColor.textColor2),
                                      ),
                                    ),
                                    VerticalSpace(10.h),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 9.h),
                                          child: Text(
                                            //this widget doesn't need logic as it is a label
                                            AppTexts.runway_wdt.substring(0, 12) +
                                                AppTexts.semi_colon,
                                            style: AppFont
                                                .regularMediumTextWithColor(
                                                    color: AppColor.textColor2),
                                          ),
                                        ),
                                        Text(
                                          //this widget need logic for getting width from previous page
                                          AppTexts.runway_wdt_dummy_data,
                                          style: AppFont.smallBoldTextWithColor(
                                              color: AppColor.textColor2),
                                        ),
                                        HorizontalSpace(10.h),
                                        Text(
                                          //this widget doesn't need logic as it is a label
                                          AppTexts.runway_len.substring(0, 13) +
                                              AppTexts.semi_colon,
                                          style:
                                              AppFont.regularMediumTextWithColor(
                                                  color: AppColor.textColor2),
                                        ),
                                        Text(
                                          //this widget need logic for getting width from previous page
                                          AppTexts.runway_len_dummy_data,
                                          style: AppFont.smallBoldTextWithColor(
                                              color: AppColor.textColor2),
                                        ),
                                      ],
                                    ),
                                    VerticalSpace(10.h),
                                    Row(children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 9.h),
                                        child: Text(
                                          //this widget doesn't need logic as it is a label
                                          AppTexts.driving_time_in +
                                              AppTexts.semi_colon,
                                          style:
                                              AppFont.regularMediumTextWithColor(
                                                  color: AppColor.textColor2),
                                        ),
                                      ),
                                      Text(
                                        //this widget need logic for getting width from previous page
                                        AppTexts.driving_time_dummy_data,
                                        style: AppFont.smallBoldTextWithColor(
                                            color: AppColor.textColor2),
                                      ),
                                    ]),
                                    VerticalSpace(10.h),
                                    Stack(
                                      children: [
                                        CustomTextField(
                                          hintText: _isSearchButtonTapped ? AppTexts.searchbar_hint_text
                                              : AppTexts.searchbar_hint_text
                                                  .substring(0, 26) +
                                              '...',
                                          textFieldController:
                                              _searchBarEnteredText,
                                          valueDidChange: (value) {},
                                          onFocusChange: (isFocus) {
                                            if (isFocus) {}
                                          },
                                        ),
                                        _isSearchButtonTapped ? VerticalSpace(0.h) : Positioned(
                                            right: 2,
                                            top:1.5,
                                            child: FittedBox(
                                                child: CustomButton(
                                              onTap: () {
                                                setState(() {
                                                  _isSearchButtonTapped = true;
                                                  print(_isSearchButtonTapped);
                                                });
                                              },
                                              height: 54.h,
                                              width: 100.h,
                                              label: AppTexts.search,

                                            )))
                                      ],
                                    ),


                                    VerticalSpace(12.h),

                                    CustomTextField(
                                      hintText: AppTexts.closest_hotel,
                                      textFieldController:
                                      _closestHotelNearDestination,
                                      valueDidChange: (value) {},
                                      onFocusChange: (isFocus) {
                                        if (isFocus) {}
                                      },
                                    ),

                                    VerticalSpace(12.h),

                                    //calculator widget comes here
                                    _isSearchButtonTapped ? Container(
                                      decoration: custom_boxdecoration(AppColor.bgColor),
                                      width: SizeConfig.screenWidth!,
                                      height: SizeConfig.screenHeight!/5.2,
                                      child: Padding(padding: EdgeInsets.all(18),
                                        child:  Column(
                                          children: [
                                            CustomTextField(
                                              hintText: AppTexts.origin_airport_label,
                                              textFieldController:
                                              _originAirport,
                                              valueDidChange: (value) {},
                                              onFocusChange: (isFocus) {
                                                if (isFocus) {}
                                              },
                                            ),
                                            VerticalSpace(30.h),
                                            Flexible(flex:1,
                                              child: Container(
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      flex:1,
                                                      child: CustomButtonWithColor(color: AppColor.appWhite,
                                                          height: SizeConfig.screenHeight!/16,
                                                          borderColor: _isAirspeedButtonTapped
                                                              ?AppColor.primary
                                                              :AppColor.appWhite,

                                                          labelColor: _isAirspeedButtonTapped
                                                              ?AppColor.primary
                                                          :AppColor.appBlack,
                                                          onTap: (){
                                                        setState(() {
                                                          _isAirspeedButtonTapped = true;
                                                          _isCalculateButtonTapped=false;
                                                        });
                                                          },
                                                          label: AppTexts.airspeed
                                                      ),
                                                    ),
                                                    HorizontalSpace(10.h),
                                                    Expanded(
                                                      flex:1,
                                                      child: CustomButtonWithColor(
                                                        height: SizeConfig.screenHeight!/16,
                                                        borderColor: _isCalculateButtonTapped
                                                            ?AppColor.primary
                                                            :AppColor.appWhite,
                                                          color: AppColor.appWhite,
                                                          onTap: (){
                                                          setState(() {
                                                            _isCalculateButtonTapped = true;
                                                            _isAirspeedButtonTapped=false;
                                                          });
                                                          },
                                                          label: AppTexts.calculate,
                                                        labelColor: _isCalculateButtonTapped
                                                        ?AppColor.primary
                                                        :AppColor.appBlack,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ) : VerticalSpace(10.h),

                                    VerticalSpace(12.h),

                                   _isSearchButtonTapped ? Container(width: SizeConfig.screenWidth!,
                                        child: CustomButton(onTap: (){
                                          setState(() {
                                            _isSearchButtonTapped = false;
                                            _isCalculateButtonTapped=false;
                                            _isAirspeedButtonTapped=false;
                                          });
                                        },height: SizeConfig.screenHeight!/16,
                                            label: AppTexts.clear_result)) : VerticalSpace(12.h),


                                    //expandable widget goes here
                                    VerticalSpace(10.h),
                                    _isSearchButtonTapped ? const SearchResultUI() :
                                    VerticalSpace(10.h),
                                    _isSearchButtonTapped ? SearchResultUI() :
                                    VerticalSpace(10.h),
                                    _isSearchButtonTapped ? SearchResultUI() :
                                    VerticalSpace(10.h),
                                    _isSearchButtonTapped ? SearchResultUI() :
                                    VerticalSpace(10.h),
                                    _isSearchButtonTapped ? SearchResultUI() : VerticalSpace(10.h),
                                    VerticalSpace(250.h),

                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
  }
}
