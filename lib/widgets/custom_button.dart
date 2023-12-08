import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.onPressed,
      this.width,
      this.height,
      this.backGroundColor,
      this.radius});

  final String text;
  final double? width;
  final double? height;
  final Function()? onPressed;
  final Color? backGroundColor;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 10.r))),
          backgroundColor: backGroundColor ?? Colors.blue,
          fixedSize: Size(width ?? 200.w, height ?? 45.5.h)),
      child: Text(text),
    );
  }
}
