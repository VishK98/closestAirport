
import 'package:closestairport/global/constants/all_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../global/presentation/widgets/custom_space.dart';

class BulletList extends StatelessWidget {
  const BulletList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text("• ",style: TextStyle(fontSize: 20,color: AppColor.primary), ),
            Expanded(
              child: Text('Find the closest airport (driving distance, not air miles) - Air miles to your location is often useless as there is no direct driving route'),
            ),
          ],),
        VerticalSpace(15.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text("• ",style: TextStyle(fontSize: 20,color: AppColor.primary),),
            Expanded(
              child: Text('Find the airport that meets your criteria (runway length, fuel, etc...)'),
            ),
          ],),
        VerticalSpace(15.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text("• ",style: TextStyle(fontSize: 20,color: AppColor.primary),),
            Expanded(
              child: Text('See all information about the airport (most of which you cannot see by looking at the AFD), frequencies, etc.'),
            ),
          ],),
        VerticalSpace(15.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text("• ",style: TextStyle(fontSize: 20,color: AppColor.primary),),
            Expanded(
              child: Text('Look at approach plates, airport diagrams, and other important information'),
            ),
          ],),
        VerticalSpace(15.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text("• ",style: TextStyle(fontSize: 20,color: AppColor.primary),),
            Expanded(
              child: Text('Look at total flying and driving time to see the closest total trip distance'),
            ),
          ],),
        VerticalSpace(15.h),
        const Text('A Few Disclaimers: ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        VerticalSpace(15.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text("• ",style: TextStyle(fontSize: 20,color: AppColor.primary),),
            Expanded(
              child: Text('At this time, we only have US Airports'),
            ),
          ],),
        VerticalSpace(15.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text("• ",style: TextStyle(fontSize: 20,color: AppColor.primary),),
            Expanded(
              child: Text('We do not rely on any externd ervice to calculate driving directions your initial'),
            ),
          ],),

      ],
    );
  }
}

