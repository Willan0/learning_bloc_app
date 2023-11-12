import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.maxLine = 2,
      required this.textStyle,
      this.textAlign,
      this.textOverflow = TextOverflow.ellipsis});

  final String text;
  final TextStyle textStyle;
  final int maxLine;
  final TextOverflow textOverflow;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      textAlign: textAlign ?? TextAlign.left,
      maxLines: maxLine,
    );
  }
}

class CustomTextStyle {
  static TextStyle smallTextStyle(
          {String fontFamily = '',
          Color color = Colors.black,
          TextOverflow overflow = TextOverflow.ellipsis}) =>
      TextStyle(
          fontSize: 12.4.sp,
          fontFamily: fontFamily,
          color: color,
          overflow: overflow);
  static TextStyle normalTextStyle(
          {String fontFamily = '',
          Color color = Colors.black,
          TextOverflow overflow = TextOverflow.ellipsis}) =>
      TextStyle(
          fontSize: 16.4.sp,
          fontFamily: fontFamily,
          fontWeight: FontWeight.normal,
          color: color,
          overflow: overflow);
}
