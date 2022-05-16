import 'package:closestairport/global/constants/all_constants.dart';
import 'package:closestairport/global/presentation/widgets/custom_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../global/constants/size_config.dart';
import '../../../global/presentation/widgets/common_widgets.dart';

class SearchResultUI extends StatelessWidget {
  const SearchResultUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return Container(width: SizeConfig.screenWidth!,

      margin: EdgeInsets.all(10),
      decoration: custom_boxdecoration(AppColor.appWhite),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: customExpansionWidget(context),
      ),
    );
  }

  Widget customExpansionWidget(BuildContext context) => ExpansionTile(
        childrenPadding: EdgeInsets.all(8),

        //collapsed expansion tile header
        title: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(flex: 1,
                    child: Container(width: SizeConfig.screenWidth!/5,
                      child: Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          VerticalSpace(12.h),
                          Text(
                            AppTexts.airport,
                            style: AppFont.regularMediumTextWithColor(),
                          ),

                          VerticalSpace(12.h),
                          Text(
                            AppTexts.airport_dummy_name,
                            style: AppFont.regularMediumTextWithColor(color: Colors.grey),
                          ),
                        ],),
                    ),
                  ),
                  HorizontalSpace(10.h),
                  Flexible(flex: 1,
                    child: Container(width: SizeConfig.screenWidth!/5,
                      child: Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          VerticalSpace(12.h),
                          Text(
                            AppTexts.city_state,
                            style: AppFont.regularMediumTextWithColor(),
                          ),

                          VerticalSpace(12.h),
                          Text(
                            AppTexts.city_state_dummy,
                            style: AppFont.regularMediumTextWithColor(color: Colors.grey),
                          ),
                        ],),
                    ),
                  ),
                  HorizontalSpace(10.h),
                  Flexible(flex: 1,
                     child: Container(width: SizeConfig.screenWidth!/5,
                      child: Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          VerticalSpace(12.h),
                          Text(
                            AppTexts.driving_time_in.substring(0,12),
                            style: AppFont.regularMediumTextWithColor(),
                          ),

                          VerticalSpace(12.h),
                          Text(
                            AppTexts.driving_time_dummy_data_hhmm,
                            style: AppFont.regularMediumTextWithColor(color: Colors.grey),
                          ),
                        ],),
                    ),
                  ),


                ],
              ),
              VerticalSpace(10.h),




            ],
          ),

        //expanded expansion tile body
        children: [Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //body first row
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [HorizontalSpace(10.h),
                Flexible(flex: 1,
                  child: Container(width: SizeConfig.screenWidth!/5,
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        VerticalSpace(12.h),
                        Text(
                          AppTexts.airport_code,
                          style: AppFont.regularMediumTextWithColor(),
                        ),

                        VerticalSpace(12.h),
                        Text(
                          AppTexts.airport_code_dummy_data,
                          style: AppFont.regularMediumTextWithColor(color: Colors.grey),
                        ),
                      ],),
                  ),
                ),
                HorizontalSpace(5.h),
                Flexible(flex: 1,
                  child: Container(width: SizeConfig.screenWidth!/5,
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        VerticalSpace(12.h),
                        Text(
                          AppTexts.driving_dist,
                          style: AppFont.regularMediumTextWithColor(),
                        ),

                        VerticalSpace(12.h),
                        Text(
                          AppTexts.driving_dist_dummy_data,
                          style: AppFont.regularMediumTextWithColor(color: Colors.grey),
                        ),
                      ],),
                  ),
                ),
                HorizontalSpace(5.h),
                Flexible(flex: 1,
                  child: Container(width: SizeConfig.screenWidth!/5,
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        VerticalSpace(12.h),
                        Text(
                          AppTexts.flight_dist,
                          style: AppFont.regularMediumTextWithColor(),
                        ),

                        VerticalSpace(12.h),
                        Text(
                          AppTexts.flight_dist_dummy_data,
                          style: AppFont.regularMediumTextWithColor(color: Colors.grey),
                        ),
                      ],),
                  ),
                ),

              ],
            ),
            VerticalSpace(10.h),


            //body second row
            Row(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [HorizontalSpace(10.h),
                Flexible(flex: 1,
                  child: Container(width: SizeConfig.screenWidth!/5,
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        VerticalSpace(12.h),
                        Text(
                          AppTexts.total_drive_fly_time,
                          style: AppFont.regularMediumTextWithColor(),
                        ),

                        VerticalSpace(12.h),
                       
                      ],),
                  ),
                ),
                HorizontalSpace(5.h),
                Flexible(flex: 1,
                  child: Container(width: SizeConfig.screenWidth!/5,
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [VerticalSpace(12.h),
                        Text(
                          AppTexts.runway_len.substring(0,13),
                          style: AppFont.regularMediumTextWithColor(),
                        ),

                        VerticalSpace(12.h),
                      ],),
                  ),
                ),
                HorizontalSpace(5.h),
                Flexible(flex: 1,
                  child: Container(width: SizeConfig.screenWidth!/5,
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        VerticalSpace(12.h),
                        Text(
                          AppTexts.jetfuel.substring(5,9),
                          style: AppFont.regularMediumTextWithColor(),
                        ),

                        VerticalSpace(12.h),

                      ],),
                  ),
                ),

              ],
            ),

            //body third row
            Row(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [HorizontalSpace(10.h),
                Flexible(flex: 1,
                  child: Container(width: SizeConfig.screenWidth!/5,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        VerticalSpace(12.h),
                        Text(
                          AppTexts.total_drive_fly_time_dummy_data,
                          style: AppFont.regularMediumTextWithColor(color: Colors.grey),
                        ),
                      ],),
                  ),
                ),
                HorizontalSpace(5.h),
                Flexible(flex: 1,
                  child: Container(width: SizeConfig.screenWidth!/5,
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [

                        VerticalSpace(12.h),
                        Text(
                          AppTexts.runway_length_dummy_data_for_seach_result,
                          style: AppFont.regularMediumTextWithColor(color: Colors.grey),
                        ),
                      ],),
                  ),
                ),
                HorizontalSpace(5.h),
                Flexible(flex: 1,
                  child: Container(width: SizeConfig.screenWidth!/5,
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [


                        VerticalSpace(12.h),
                        Text(
                          AppTexts.avgas + AppTexts.comma+ AppTexts.jetfuel.substring(0,5),
                          style: AppFont.regularMediumTextWithColor(color: Colors.grey),
                        ),
                      ],),
                  ),
                ),

              ],
            ),


            VerticalSpace(10.h),

            //body fourth row

            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [HorizontalSpace(10.h),
                Flexible(flex: 1,
                  child: Container(width: SizeConfig.screenWidth!/5,
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        VerticalSpace(12.h),
                        Text(
                          AppTexts.closest_hotels,
                          style: AppFont.regularMediumTextWithColor(),
                        ),

                        VerticalSpace(12.h),
                        /*Text(
                          AppTexts.closest_hotels_dummy_data,
                          style: AppFont.regularMediumTextWithColor(color: Colors.grey),
                        ),*/
                      ],),
                  ),
                ),
                HorizontalSpace(5.h),
                Flexible(flex: 1,
                  child: Container(width: SizeConfig.screenWidth!/5,
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [VerticalSpace(12.h),
                        Text(
                          AppTexts.surface_pcn_value,
                          style: AppFont.regularMediumTextWithColor(),
                        ),

                        VerticalSpace(12.h),
                        /*Text(
                          AppTexts.surface_pcn_dummy_data,
                          style: AppFont.regularMediumTextWithColor(color: Colors.grey),
                        ),*/
                      ],),
                  ),
                ),
                HorizontalSpace(5.h),
                Flexible(flex: 1,
                  child: Container(width: SizeConfig.screenWidth!/5,
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        VerticalSpace(12.h),
                        Text(
                          AppTexts.driving_direction,
                          style: AppFont.regularMediumTextWithColor(),
                        ),

                        VerticalSpace(12.h),
                        /*IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/icons/map_icon.svg")),
*/
                      ],),
                  ),
                ),

              ],
            ),

            //body fifth row
            Row(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [HorizontalSpace(10.h),
                Flexible(flex: 1,
                  child: Container(width: SizeConfig.screenWidth!/5,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        VerticalSpace(12.h),
                        Text(
                          AppTexts.closest_hotels_dummy_data,
                          style: AppFont.regularMediumTextWithColor(color: Colors.grey),
                        ),
                      ],),
                  ),
                ),
                HorizontalSpace(5.h),
                Flexible(flex: 1,
                  child: Container(width: SizeConfig.screenWidth!/5,
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [

                        VerticalSpace(12.h),
                        Text(
                          AppTexts.surface_pcn_dummy_data,
                          style: AppFont.regularMediumTextWithColor(color: Colors.grey),
                        ),
                      ],),
                  ),
                ),
                HorizontalSpace(5.h),
                Flexible(flex: 1,
                  child: Container(width: SizeConfig.screenWidth!/5,
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        VerticalSpace(12.h),
                        IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/icons/map_icon.svg")),

                      ],),
                  ),
                ),

              ],
            ),
          ],
        ),],
      );
}
