import 'package:closestairport/global/constants/all_constants.dart';
import 'package:closestairport/global/constants/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

BoxDecoration custom_boxdecoration(Color _color) {
  return BoxDecoration(
    color: _color,
    borderRadius: BorderRadius.circular(10.0),
    boxShadow: [
      BoxShadow(
        color: Colors.grey[400]!.withOpacity(0.5),
        spreadRadius: 1,
        blurRadius: 1,
        offset: const Offset(0, 0), // changes position of shadow
      ),
    ],
  );
}

BoxDecoration headerBoxDecoration({Color? bgColor}){
  return BoxDecoration(
    color: bgColor ?? AppColor.primary,
    borderRadius: BorderRadius.only(topLeft: Radius.circular(10.w),topRight: Radius.circular(10.w)),
  );
}


class CommonHeader extends StatelessWidget {
  const CommonHeader({Key? key, required this.label, this.trailingWidget}) : super(key: key);
  final String label;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.h,vertical: 16.h),
      width: MediaQuery.of(context).size.width,
      decoration:headerBoxDecoration(),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: AppFont.mediumMediumTextWithColor(color: AppColor.appWhite),
            ),
          ),
          // Spacer(),
          if(trailingWidget !=null)
            trailingWidget!,
        ],
      ),
    );
  }
}




