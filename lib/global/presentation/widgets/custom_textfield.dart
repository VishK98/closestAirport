import 'package:closestairport/global/constants/all_constants.dart';
import 'package:closestairport/global/presentation/widgets/custom_space.dart';
import 'package:closestairport/global/presentation/widgets/outline_input_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef FieldValueChange(String value);
typedef FieldOnTap();
typedef OnFocusChange(bool focus);

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? errorText;
  final Color highLight;
  final TextEditingController textFieldController;
  final FieldValueChange valueDidChange;
  final OnFocusChange onFocusChange;
  final FieldOnTap? tapOnAccessoryView;
  final Widget? rightAccessoryView;
  final bool isObscure;
  final FocusNode? focus;
  final int tag;
  final String? label;
  final int minLines;
  final int maxLines;
  final TextInputAction? textInputAction;
  final InputDecoration? inputDecoration;

  const CustomTextField(
      {required this.hintText,
        this.inputDecoration,
      this.label,
      this.highLight = AppColor.strokes,
      required this.textFieldController,
      required this.valueDidChange,
      required this.onFocusChange,
      this.tapOnAccessoryView,
      this.rightAccessoryView,
      this.isObscure = false,
      this.focus,
      this.tag = 0,
      this.minLines = 1,
        this.maxLines= 1,
        this.textInputAction,
      this.errorText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (label != null)
            ? Column(
                children: [
                  Text(
                    label!,
                    style: AppFont.regularMediumTextWithColor(),
                  ),
                  VerticalSpace(5.h)
                ],
              )
            : const SizedBox.shrink(),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 22.0, right: 10),
              child: Stack(
                children: [
                  FocusScope(
                    child: Focus(
                      onFocusChange: (focus) {
                        onFocusChange(focus);
                      },
                      child: TextField(
                        textInputAction: textInputAction,
                        minLines: minLines,
                        maxLines: maxLines,
                        cursorColor: AppColor.primary,
                        controller: textFieldController,
                        obscureText: isObscure,
                        style: AppFont.regularTextWithColor(
                            color: AppColor.primaryTextColor),
                        decoration: InputDecoration(
                          hintText: hintText,
                          hintStyle: AppFont.regularTextWithColor(
                              color: AppColor.secondaryTextColor),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          valueDidChange(value);
                        },
                      ),
                    ),
                  ),
                  (rightAccessoryView != null)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: InkWell(
                                child: rightAccessoryView,
                                onTap: () {
                                  tapOnAccessoryView!();
                                },
                              ),
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: highLight),
          ),
        ),
        (errorText != null)
            ? Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  errorText!,
                  style: AppFont.smallTextWithColor(color: AppColor.appRed),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}


class CommonTextField extends StatefulWidget {
  CommonTextField(
      {Key? key,
        this.margin,
        this.padding,
        this.labelText,
        this.hintText,
        this.labelStyle,
        this.controller,
        this.focusNode,
        this.onFieldSubmitted,
        this.suffixOnTap,
        this.onTap,
        this.border,
        this.iconColor,
        this.style,
        required this.validator,
        this.keyboardType,
        this.obscureText = false,
        this.suffixIcon,
        this.hintStyle,
        this.readOnly = false,
        this.inputFormatters,
        this.textInputAction,
        this.maxLines = 1,
        this.contentPadding,
        this.onChanged,
        this.prefixIcon,
        this.prefixWidget})
      : super(key: key);

  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BoxBorder? border;
  final Color? iconColor;
  final void Function()? onTap;
  final void Function(dynamic value)? onFieldSubmitted;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final String? hintText;
  final String? labelText;
  final TextStyle? labelStyle;
  bool? obscureText;
  final TextStyle? style;
  final void Function()? suffixOnTap;
  final String? Function(String? value) validator;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final bool readOnly;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final Icon? prefixIcon;
  final Widget? prefixWidget;

  @override
  _CommonTextFieldState createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      child: TextFormField(
        style: widget.style ?? AppFont.regularMediumTextWithColor(),
        onTap: widget.onTap,
        cursorColor: AppColor.primary,
        // textAlignVertical: TextAlignVertical.center,
        onFieldSubmitted: widget.onFieldSubmitted,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction,
        obscureText: widget.obscureText ?? false,
        validator: widget.validator,
        readOnly: widget.readOnly,
        inputFormatters: widget.inputFormatters,
        maxLines: widget.maxLines,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
            isDense: true,
            prefixIcon: widget.prefixIcon,
            isCollapsed: true,
            // prefixIconConstraints: const BoxConstraints(maxHeight: 44, minHeight: 44, maxWidth: 40, minWidth: 40),
            // suffixIconConstraints: const BoxConstraints(maxHeight: 44, minHeight: 44, maxWidth: 40, minWidth: 40),
            border: kAuthInputBorder(),
            focusedBorder: kAuthInputBorder(color: AppColor.primary),
            enabledBorder: kAuthInputBorder(),
            errorBorder: kAuthInputBorder(),
            disabledBorder: kAuthInputBorder(),
            focusedErrorBorder: kAuthInputBorder(color: AppColor.primary),
            fillColor: AppColor.appWhite,
            filled: true,
            errorStyle:
                AppFont.regularMediumTextWithColor(color: AppColor.appRed),
            hintText: widget.hintText,
            hintStyle:
                AppFont.regularMediumTextWithColor(color: AppColor.strokes),
            contentPadding: widget.contentPadding ??
                EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
            prefix: widget.prefixWidget,
            suffixIcon: widget.suffixIcon),
      ),
    );
  }
}
