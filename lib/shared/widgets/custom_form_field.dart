// ignore_for_file: deprecated_member_use

import 'package:feature_based_mvvm_architecture/app/constants/text_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/colors.gen.dart';

final class CustomFormField extends StatelessWidget {
  final String? hintText;
  final double? hintFontSize;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final double? fieldHeight;
  final int? maxline;
  final String? Function(String?)? validator;
  final bool? validation;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isObsecure;
  final bool isPass;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final Function(String?)? onSave;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final bool? isEnabled;
  final double? cursorHeight;
  final Color? disableColor;
  final Color? borderCOlor;
  final bool isRead;
  final bool? noBorder;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;

  const CustomFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.controller,
    this.inputType,
    this.fieldHeight,
    this.maxline,
    this.validator,
    this.validation = false,
    this.suffixIcon,
    this.prefixIcon,
    this.isObsecure = false,
    this.isPass = false,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.onChanged,
    this.inputFormatters,
    this.labelStyle,
    this.isEnabled,
    this.style,
    this.cursorHeight,
    this.disableColor,
    this.isRead = false,
    this.borderRadius,
    this.padding,
    this.hintFontSize,
    this.fillColor,
    this.noBorder,
    this.contentPadding,
    this.borderCOlor,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.zero,
      child: TextFormField(
        readOnly: isRead,
        cursorHeight: cursorHeight ?? 20.h,
        cursorColor: AppColors.c202020,
        focusNode: focusNode,
        obscureText: isPass ? isObsecure : false,
        textInputAction: textInputAction,
        autovalidateMode:
            validation!
                ? AutovalidateMode.always
                : AutovalidateMode.onUserInteraction,
        validator: validator,
        maxLines: maxline ?? 1,
        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        onSaved: onSave,
        inputFormatters: inputFormatters,
        enabled: isEnabled,
        decoration: InputDecoration(
          contentPadding: contentPadding ?? EdgeInsets.all(16.sp),
          filled: true,
          fillColor: fillColor ?? AppColors.cFFFFFF,
          isDense: true,
          suffixIcon: suffixIcon,
          prefixIcon:
              prefixIcon != null
                  ? Padding(padding: EdgeInsets.all(12.sp), child: prefixIcon)
                  : null,
          hintText: hintText,
          hintStyle:
              labelStyle ??
              TextFontStyle.headline12w400cF1F1F1styleLexend.copyWith(
                fontSize: hintFontSize ?? 14.sp,
                color: AppColors.c202020.withOpacity(.6),
              ),
          labelStyle:
              labelStyle ??
              TextFontStyle.headline12w400cF1F1F1styleLexend.copyWith(
                fontSize: hintFontSize ?? 14.sp,
                color: AppColors.c202020.withOpacity(.6),
              ),
          labelText: labelText,
          errorStyle: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            // color: AppColors.cD12E34,
          ),
          focusedErrorBorder: _borderStyle(borderCOlor ?? AppColors.cACB7BD),
          focusedBorder: _borderStyle(
            borderCOlor ?? AppColors.cACB7BD.withOpacity(.40),
            width: 1.5.w,
          ),
          disabledBorder: _borderStyle(
            disableColor ?? AppColors.cACB7BD.withOpacity(0.19),
          ),
          errorBorder: _borderStyle(Colors.red),
          enabledBorder: _borderStyle(
            borderCOlor ?? AppColors.cACB7BD,
            width: 1.w,
          ),
          // focusedErrorBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          //   borderSide: BorderSide(
          //     color: AppColors.cFF7A01,
          //     width: 1.w,
          //   ),
          // ),
          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          //   borderSide: BorderSide(
          //     color: AppColors.cFF7A01,
          //     width: 1.w,
          //   ),
          // ),
          // disabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          //   borderSide: const BorderSide(
          //     // color: disableColor ?? AppColors.c6D6D6D.withOpacity(0.19),
          //     width: 1,
          //   ),
          // ),
          // errorBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          //   borderSide: const BorderSide(
          //     color: Colors.red,
          //     width: 1,
          //   ),
          // ),
          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          //   borderSide: BorderSide(
          //     color: AppColors.cBABABA,
          //     width: 0.5.w,
          //   ),
          // ),
        ),
        style:
            style ??
            TextFontStyle.headline12w400cF1F1F1styleLexend.copyWith(
              fontSize: hintFontSize ?? 14.sp,
              color: AppColors.c202020,
            ),
        keyboardType: inputType,
      ),
    );
  }

  OutlineInputBorder _borderStyle(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
      borderSide:
          noBorder == true
              ? BorderSide.none
              : BorderSide(color: color, width: width),
    );
  }
}
