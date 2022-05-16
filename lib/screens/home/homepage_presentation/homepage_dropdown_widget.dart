import 'package:closestairport/global/constants/all_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

class DropDownMenu extends StatefulWidget {

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  final items = [AppTexts.dummy, AppTexts.dummy+' new' ];
  String? value;


  @override
  Widget build(BuildContext context) {
    return DropdownButton<dynamic>(
        value: value,
        isExpanded: true,
        underline: const SizedBox.shrink(),
        hint: const Text('Select Aircraft'),
        icon: Transform.rotate(
            angle: 270 * math.pi / 180,
            child: Icon(
              Icons.arrow_back_ios,
              size: 20.h,
              color: AppColor.appBlack,
            )),
        items: items.map(menuItem).toList(),
        onChanged: (value){
          setState(() {
            this.value= value ;
          });});
  }


  DropdownMenuItem menuItem(String item) =>
      DropdownMenuItem(value:item ,child: Text(item));
}
