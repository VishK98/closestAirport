import 'package:closestairport/global/constants/all_constants.dart';
import 'package:closestairport/global/dummy_data/dummy_data.dart';
import 'package:closestairport/global/presentation/widgets/custom_appbar.dart';
import 'package:closestairport/global/presentation/widgets/custom_space.dart';
import 'package:closestairport/screens/airport_detail/airport_detail_presentation/airport_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/homepage_presentation/home_page.dart';

class AirportDetailScreen extends StatefulWidget {
   const AirportDetailScreen({Key? key}) : super(key: key);

  @override
  State<AirportDetailScreen> createState() => _AirportDetailScreenState();
}

class _AirportDetailScreenState extends State<AirportDetailScreen> {
  final GlobalKey<ScaffoldState> globalScaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalScaffoldKey,
      backgroundColor: AppColor.bgColor,
      appBar: customAppBar(onTap: () {
        globalScaffoldKey.currentState?.openEndDrawer();
      }),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 21.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              VerticalSpace(22.h),
              const TopTitleWidget(),
              VerticalSpace(22.h),
              const ChartSupplementWidget(),
              VerticalSpace(22.h),
              const AirportDiagram(),
              VerticalSpace(22.h),
              CommonExpandedWidget(label: AppText.keAirport,items:testItems,child: Text(
                '',
                style: AppFont.regularTextWithColor()
                    .copyWith(decoration: TextDecoration.underline),
              )),
               // const KEWRWidget(),
              VerticalSpace(22.h),
              OperationData(labels: AppText.operationData,item:operationData,childs: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                ],
              )),
              VerticalSpace(22.h),
              AirportCom(labels: AppText.airportcom, item: airportData, childs: Row()),
              VerticalSpace(22.h),
              Runway(labels: AppText.runway1, item: runwayData, childs: Row()),
              VerticalSpace(22.h),
              Runway2(labels: AppText.runway2, item: runwayData_2, childs: Row()),
              VerticalSpace(22.h),
              InstrumentApp(labels: AppText.Instrument),
              VerticalSpace(22.h),
              Departure(labels: AppText.Departure, item: testItems, childs: Row()),
              VerticalSpace(22.h),
            ],
          ),
        ),
      ),
    );
  }
}
