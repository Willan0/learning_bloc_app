import 'package:flutter/material.dart';

extension NumExtension on num {
  SizedBox get width => SizedBox(
        width: toDouble(),
      );
  SizedBox get height => SizedBox(
        height: toDouble(),
      );
}

extension ContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

extension ContextExtenson on BuildContext {
  pushAndRemove(Widget page) => Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (route) => false);
}
