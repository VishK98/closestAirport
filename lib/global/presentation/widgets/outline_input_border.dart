import 'package:closestairport/global/constants/all_constants.dart';
import 'package:flutter/material.dart';

OutlineInputBorder kAuthInputBorder({Color? color}) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: color ?? AppColor.strokes),
    );
