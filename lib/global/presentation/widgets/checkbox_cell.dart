import 'package:closestairport/global/constants/all_constants.dart';
import 'package:closestairport/global/presentation/widgets/custom_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef void CellCallBack(int tag);

class CustomCheckBoxCell extends StatelessWidget {
  const CustomCheckBoxCell({
    required this.title,
    this.fillColor = AppColor.appWhite,
    this.selectedColor = AppColor.primaryLight,
    required this.onCellTap,
    this.isSelected = false,
    this.tag = 0,
    this.mSpace,
    this.size,
  });

  final Color fillColor;
  final Color selectedColor;
  final String title;
  final CellCallBack onCellTap;
  final bool isSelected;
  final int tag;
  final double? mSpace;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          onCellTap(tag);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: isSelected ? AppColor.primary : AppColor.strokes,
                    width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: size ?? 30.w,
                      color: AppColor.primary,
                    )
                  : Icon(
                      null,
                      size: size ?? 30.w,
                    ),
            ),
            HorizontalSpace(mSpace ?? 10.w),
            Text(title, style: AppFont.regularTextWithColor()),
          ],
        ),
      ),
    );
  }
}

class CommonCheckBoxCell extends StatelessWidget {
  const CommonCheckBoxCell({
    this.fillColor = AppColor.appWhite,
    this.selectedColor = AppColor.primaryLight,
    required this.onCellTap,
    this.isSelected = false,
    this.tag = 0,
    this.size,
  });

  final Color fillColor;
  final Color selectedColor;
  final CellCallBack onCellTap;
  final bool isSelected;
  final int tag;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          onCellTap(tag);
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: isSelected ? AppColor.primary : AppColor.strokes,
                width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: isSelected
              ? Icon(
            Icons.check,
            size: size ?? 30.w,
            color: AppColor.primary,
          )
              : Icon(
            null,
            size: size ?? 30.w,
          ),
        ),
      ),
    );
  }
}