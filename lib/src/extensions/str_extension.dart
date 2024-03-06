import 'package:flutter/material.dart';

extension SnackBars on String {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showBottomSnackBar(
    BuildContext context, {
    Duration? duration,
    Color? color,
    Color? textColor,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(
          this,
          style: TextStyle(color: textColor),
        ),
        duration: duration ?? const Duration(seconds: 4),
      ),
    );
  }
}
