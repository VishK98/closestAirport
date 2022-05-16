import 'package:closestairport/global/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFont {
  static  final _smallFontSize = 13.sp;
  static  final _regularFontSize = 15.sp;
  static  final _mediumFontSize = 17.sp;
  static  final _largeFontSize = 19.sp;
  // static  final _extraLargeFontSize = 36.sp;

  static const poppinsRegular = 'Poppins-Regular';
  static const poppinsMedium = 'Poppins-Medium';
  static const poppinsSemiBold = 'Poppins-SemiBold';
  static const poppinsBold = 'Poppins-Bold';

  // ----------------   SMALL SIZE FONT ---------------------------//
  static TextStyle smallTextWithColor({Color? color}) {
    return TextStyle(
        color: color ?? AppColor.primaryTextColor,
        fontSize: _smallFontSize,
        fontWeight: FontWeight.normal,
        fontFamily: poppinsRegular);
  }

  static TextStyle smallBoldTextWithColor({Color? color}) {
    return TextStyle(
        color: color ?? AppColor.primaryTextColor,
        fontSize: _smallFontSize,
        fontWeight: FontWeight.bold,
        fontFamily: poppinsBold);
  }



  // ----------------   REGULAR SIZE FONT ---------------------------//

  // App Text Color
  static TextStyle regularTextWithColor({Color? color}) {
    return TextStyle(
        color: color ?? AppColor.primaryTextColor,
        fontSize: _regularFontSize,
        fontWeight: FontWeight.normal,
        fontFamily: poppinsRegular);
  }

  static TextStyle regularBoldTextWithColor({Color? color}) {
    return TextStyle(
        color: color ?? AppColor.primaryTextColor,
        fontSize: _regularFontSize,
        fontWeight: FontWeight.bold,
        fontFamily: poppinsBold);
  }

  static TextStyle regularMediumTextWithColor({Color? color}) {
    return TextStyle(
        color: color ?? AppColor.primaryTextColor,
        fontSize: _regularFontSize,
        fontFamily: poppinsMedium);
  }

  // ----------------   MEDIUM SIZE FONT ---------------------------//

  static TextStyle mediumMediumTextWithColor({Color? color}) {
    return TextStyle(
        color: color ?? AppColor.primaryTextColor,
        fontSize: _mediumFontSize,
        fontFamily: poppinsMedium);
  }


  static TextStyle mediumBoldTextWithColor({Color? color}) {
    return TextStyle(
        color: color ?? AppColor.primaryTextColor,
        fontSize: _mediumFontSize,
        fontFamily: poppinsMedium);
  }


  // ----------------   LARGE SIZE FONT ---------------------------//

  // App Text Color
  static TextStyle largeTextWithColor({Color? color}) {
    return TextStyle(
        color: color ?? AppColor.primaryTextColor,
        fontSize: _largeFontSize,
        fontWeight: FontWeight.normal,
        fontFamily: poppinsRegular);
  }

  static TextStyle largeBoldTextWithColor({Color? color}) {
    return TextStyle(
        color: color ?? AppColor.primaryTextColor,
        fontSize: _largeFontSize,
        fontWeight: FontWeight.bold,
        fontFamily: poppinsBold);
  }
  static TextStyle largeBoldTextWithWhiteColor({Color? color}) {
    return TextStyle(
        color: color ?? AppColor.appWhite,
        fontSize: _largeFontSize,
        fontWeight: FontWeight.bold,
        fontFamily: poppinsBold);
  }

  static TextStyle fontregularTextWithColor({Color? color}) {
    return TextStyle(
        color: color ?? AppColor.greyTextColor,
        fontSize: _regularFontSize,
        fontWeight: FontWeight.normal,
        fontFamily: poppinsRegular);
  }

// ----------------  EXTRA LARGE SIZE FONT ---------------------------//

// App Text Color
/*  static TextStyle extraLargeTextWithColor(Color color) {
    return TextStyle(
        color: color,
        fontSize: _extraLargeFontSize,
        fontWeight: FontWeight.normal,
        fontFamily: "Manrope");
  }

  static TextStyle extraLargeBoldTextWithColor(Color color) {
    return TextStyle(
        color: color,
        fontSize: _extraLargeFontSize,
        fontWeight: FontWeight.bold,
        fontFamily: "Manrope-Bold");
  }

  static TextStyle extraLargeLightTextWithColor(Color color) {
    return TextStyle(
        color: color,
        fontSize: _extraLargeFontSize,
        fontWeight: FontWeight.normal,
        fontFamily: "Manrope-Light");
  }*/
}
