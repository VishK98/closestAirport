import 'package:closestairport/global/constants/all_constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.onTap,
      required this.label,
      this.width = 50,
      this.height = 50,
      this.isDisabled = false,
      this.onTapDisabled})
      : super(key: key);

  final VoidCallback onTap;
  final VoidCallback? onTapDisabled;
  final double width;
  final double height;
  final bool isDisabled;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (!isDisabled) ? onTap : onTapDisabled,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: (isDisabled) ?
          AppColor.primaryMild :
          AppColor.primary,
          borderRadius: BorderRadius.circular(height * 0.2),
          border: Border.all(color: AppColor.strokes),
        ),
        child: Center(
            child: Text(
                  label,
                  style: AppFont.regularTextWithColor(color: AppColor.appWhite),
                )),
      ),
    );
  }
}


class CustomButtonWithColor extends StatelessWidget {
  const CustomButtonWithColor(
      {Key? key,
        required this.onTap,
        required this.labelColor,
        required this.borderColor,
        required this.color,
        required this.label,
        this.width = 50,
        this.height = 50,
        this.isDisabled = false,
        this.onTapDisabled})
      : super(key: key);

  final VoidCallback onTap;
  final VoidCallback? onTapDisabled;
  final double width;
  final double height;
  final bool isDisabled;
  final String label;
  final Color color;
  final Color labelColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (!isDisabled) ? onTap : onTapDisabled,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(height * 0.2),
          //need platform checker boolean as border width fluctuate in android and tab
          border: Border.all(color: borderColor,width: 1.3),
        ),
        child: Center(
            child: Text(
              label,
              style: AppFont.regularTextWithColor(color: labelColor),
            )),
      ),
    );
  }
}