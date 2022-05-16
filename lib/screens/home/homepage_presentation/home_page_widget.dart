import 'package:closestairport/global/constants/app_font.dart';
import 'package:closestairport/global/presentation/widgets/checkbox_cell.dart';
import 'package:closestairport/global/presentation/widgets/custom_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterCheckBox extends StatefulWidget {
  final String filterType;
  final int tag;
  final bool isChecked;

  FilterCheckBox({Key? key, required this.filterType, required this.tag, required this.isChecked}) : super(key: key);


  getCheckedItems(int tag, bool value){
  }

  @override
  State<FilterCheckBox> createState() => _FilterCheckBoxState();
}

class _FilterCheckBoxState extends State<FilterCheckBox> {


  var _value = false;
  get value => _value;

  @override
  Widget build(BuildContext context) {
    final boxHeight = 38.w;
    return Row(
      children: [
        SizedBox(
          width: 90.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CommonCheckBoxCell(tag: widget.tag,
                isSelected: _value,
                onCellTap: (tag){
                  setState(() {
                    _value=!_value;
                    if(_value == true)
                      print(tag);
                  }

                  );},
                size: boxHeight,
              ),

            ],
          ),
        ),
        HorizontalSpace(16.w),
        Text(widget.filterType, style: AppFont.regularTextWithColor()),
      ],
    );
  }
}

