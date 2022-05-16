import 'package:closestairport/global/constants/all_constants.dart';
import 'package:closestairport/global/constants/app_icons.dart';
import 'package:closestairport/global/dummy_data/dummy_data.dart';
import 'package:closestairport/global/presentation/widgets/custom_space.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global/presentation/widgets/common_widgets.dart';

class TopTitleWidget extends StatelessWidget {
  const TopTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 11.h),
      decoration: BoxDecoration(
          color: AppColor.primary, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppText.dummyAirportName,
            style: AppFont.mediumMediumTextWithColor(color: AppColor.appWhite),
          ),
          VerticalSpace(3.h),
          Text(
            AppText.dummyAirportDesc,
            style: AppFont.regularTextWithColor(color: AppColor.appWhite),
          ),
        ],
      ),
    );
  }
}

class ChartSupplementWidget extends StatelessWidget {
  const ChartSupplementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CommonHeader(label: AppText.chartSupplement),
          VerticalSpace(10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              AppText.clickToSee,
              style: AppFont.regularTextWithColor(color: AppColor.textColorBlue)
                  .copyWith(decoration: TextDecoration.underline),
            ),
          ),
          VerticalSpace(12.h),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const ChartTextRow(text1: '', text2: '');
              },
              separatorBuilder: (context, index) => VerticalSpace(10.h),
              itemCount: 4),
          VerticalSpace(24.h),
        ],
      ),
    );
  }
}

class ChartTextRow extends StatelessWidget {
  const ChartTextRow({Key? key, required this.text1, required this.text2})
      : super(key: key);
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    const text3 = 'Newark Liberty INTL';
    const text4 = '(ISP) RWY 04L/22RH11000X150 (ASPH-CONC-E)';
    return Row(
      children: [
        Expanded(
          child: RichText(
            text: TextSpan(
              text: '$text3 ',
              style: AppFont.regularMediumTextWithColor(),
              children: <TextSpan>[
                TextSpan(
                  text: text4,
                  style: AppFont.regularTextWithColor(),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class AirportDiagram extends StatelessWidget {
  const AirportDiagram({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CommonHeader(label: AppText.keAirport),
          VerticalSpace(18.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  AppIcons.sampleAirportDiagram,
                  height: size.width * 0.8,
                  fit: BoxFit.fill,
                ),
                VerticalSpace(5.h),
                Text(
                  AppText.airportDiagram,
                  style: AppFont.regularTextWithColor(),
                ),
              ],
            ),
          ),
          VerticalSpace(20.h),
        ],
      ),
    );
  }
}

class KEWRWidget extends StatelessWidget {
  const KEWRWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: ExpandablePanel(
        theme: const ExpandableThemeData(),
        header: const CommonHeader(label: AppText.operationData),
        collapsed: ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) => Text(
            AppText.clickToSee,
            style: AppFont.regularTextWithColor(color: AppColor.textColorBlue)
                .copyWith(decoration: TextDecoration.underline),
          ),
        ),
        expanded: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          itemBuilder: (context, index) => Text(
            AppText.clickToSee,
            style: AppFont.regularTextWithColor(color: AppColor.textColorBlue)
                .copyWith(decoration: TextDecoration.underline),
          ),
        ),
        builder: (_, collapsed, expanded) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
            child: Expandable(
              collapsed: collapsed,
              expanded: expanded,
              theme: const ExpandableThemeData(crossFadePoint: 0),
            ),
          );
        },
      ),
    );
  }
}

class OperationData extends StatefulWidget {
  const OperationData({Key? key, required this.labels, required this.item, required this.childs})
      : super(key: key);
  final List<TestData> item;
  final String labels;
  final Widget childs;


  @override
  State<OperationData> createState() => _OperationDataState();
}

class _OperationDataState extends State<OperationData> {
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonHeader(
            label: widget.labels,
            trailingWidget: GestureDetector(
              child: Icon(
                isExpand
                    ? Icons.expand_less_outlined
                    : Icons.expand_more_outlined,
                color: AppColor.appWhite,
                size: 24,
              ),
              onTap: () {
                setState(() {
                  isExpand = !isExpand;
                });
              },
            ),
          ),
          VerticalSpace(10.h),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.item[index].key,
                        style: AppFont.fontregularTextWithColor(),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.item[index].value,
                        style: AppFont.regularTextWithColor(),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => VerticalSpace(8.h),
              itemCount: isExpand ? widget.item.length : 3),
          VerticalSpace(24.h),
        ],
      ),
    );
  }
}

class AirportCom extends StatefulWidget {
  const AirportCom({Key? key,required this.labels, required this.item, required this.childs}) : super(key: key);
  final List<TestData_2> item;
  final String labels;
  final Widget childs;

  @override
  State<AirportCom> createState() => _AirportComState();
}

class _AirportComState extends State<AirportCom> {
  bool isExpand = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonHeader(
            label: widget.labels,
            trailingWidget: GestureDetector(
              child: Icon(
                isExpand
                    ? Icons.expand_less_outlined
                    : Icons.expand_more_outlined,
                color: AppColor.appWhite,
                size: 24,
              ),
              onTap: () {
                setState(() {
                  isExpand = !isExpand;
                });
              },
            ),
          ),
          VerticalSpace(10.h),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      child: Text(
                          widget.item[index].key,
                          style: AppFont.fontregularTextWithColor(),
                        ),
                    ),
                       Expanded(
                         child: Text(
                          widget.item[index].value,
                          style: AppFont.regularTextWithColor(),
                      ),
                       ),
                  ],
                );
              },
              separatorBuilder: (context, index) => VerticalSpace(8.h),
              itemCount: isExpand ? widget.item.length : 3),
          VerticalSpace(24.h),
        ],
      ),
    );
  }
}

class Runway extends StatefulWidget {
  const Runway({Key? key,required this.labels, required this.item, required this.childs}) : super(key: key);
  final List<TestData_3> item;
  final String labels;
  final Widget childs;


  @override
  State<Runway> createState() => _RunwayState();
}

class _RunwayState extends State<Runway> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonHeader(
            label: widget.labels,
            trailingWidget: GestureDetector(
              child: Icon(
                isExpanded
                    ? Icons.expand_less_outlined
                    : Icons.expand_more_outlined,
                color: AppColor.appWhite,
                size: 24,
              ),
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
          VerticalSpace(10.h),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.item[index].key,
                        style: AppFont.fontregularTextWithColor(),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.item[index].value,
                        style: AppFont.regularTextWithColor(),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => VerticalSpace(8.h),
              itemCount: isExpanded ? widget.item.length : 3),
          VerticalSpace(24.h),
        ],
      ),
    );
  }
}

class Runway2 extends StatefulWidget {
  const Runway2({Key? key,required this.labels, required this.item, required this.childs}) : super(key: key);
  final List<TestData_4> item;
  final String labels;
  final Widget childs;

  @override
  State<Runway2> createState() => _Runway2State();
}

class _Runway2State extends State<Runway2> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonHeader(
            label: widget.labels,
            trailingWidget: GestureDetector(
              child: Icon(
                isExpanded
                    ? Icons.expand_less_outlined
                    : Icons.expand_more_outlined,
                color: AppColor.appWhite,
                size: 24,
              ),
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
          VerticalSpace(10.h),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.item[index].key,
                        style: AppFont.fontregularTextWithColor(),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.item[index].value,
                        style: AppFont.regularTextWithColor(),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => VerticalSpace(8.h),
              itemCount: isExpanded ? widget.item.length : 3),
          VerticalSpace(24.h),
        ],
      ),
    );
  }
}

class InstrumentApp extends StatefulWidget {
  const InstrumentApp({Key? key,required this.labels}) : super(key: key);
  final String labels;

  @override
  State<InstrumentApp> createState() => _InstrumentAppState();
}

class _InstrumentAppState extends State<InstrumentApp> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonHeader(
            label: widget.labels,
            trailingWidget: GestureDetector(
              child: Icon(
                isExpanded
                    ? Icons.expand_less_outlined
                    : Icons.expand_more_outlined,
                color: AppColor.appWhite,
                size: 24,
              ),
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
          VerticalSpace(10.h),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 8),
                height: 203,
                width: 163,
                child: Image.asset(AppIcons.sampleAirportDiagram),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 203,
                width: 163,
                child: Image.asset(AppIcons.sampleAirportDiagram),
              )
            ],),
          VerticalSpace(24.h),
        ],
      ),
    );
  }
}

class Departure extends StatefulWidget {
  const Departure({Key? key,required this.labels, required this.item, required this.childs}) : super(key: key);
  final List<String> item;
  final String labels;
  final Widget childs;
  @override
  State<Departure> createState() => _DepartureState();
}

class _DepartureState extends State<Departure> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonHeader(
            label: widget.labels,
            trailingWidget: GestureDetector(
              child: Icon(
                isExpanded
                    ? Icons.expand_less_outlined
                    : Icons.expand_more_outlined,
                color: AppColor.appWhite,
                size: 24,
              ),
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
          VerticalSpace(10.h),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 8),
                height: 203,
                width: 163,
                child: Image.asset(AppIcons.sampleAirportDiagram),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 203,
                width: 163,
                child: Image.asset(AppIcons.sampleAirportDiagram),
              )
            ],),
          VerticalSpace(24.h),
        ],
      ),
    );
  }
}

class CommonExpandedWidget extends StatefulWidget {
  const CommonExpandedWidget(
      {Key? key, required this.items, required this.label, required this.child})
      : super(key: key);
  final List<String> items;
  final String label;
  final Widget child;

  @override
  State<CommonExpandedWidget> createState() => _CommonExpandedWidgetState();
}

class _CommonExpandedWidgetState extends State<CommonExpandedWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonHeader(
            label: widget.label,
            trailingWidget: GestureDetector(
              child: Icon(
                isExpanded
                    ? Icons.expand_less_outlined
                    : Icons.expand_more_outlined,
                color: AppColor.appWhite,
                size: 24,
              ),
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
          VerticalSpace(10.h),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Text(
                  widget.items[index],
                  style: AppFont.regularTextWithColor()
                      .copyWith(decoration: TextDecoration.underline),
                );
              },
              separatorBuilder: (context, index) => VerticalSpace(8.h),
              itemCount: isExpanded ? widget.items.length : 3),
          VerticalSpace(24.h),
        ],
      ),
    );
  }
}

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppFont.regularTextWithColor()
          .copyWith(decoration: TextDecoration.underline),
    );
  }
}

