import 'package:animation/constants/dimension.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

void popUpFeedback(
  BuildContext context, {
  required String message,
  required String title,
  required IconData icon,
  bool error = false,
  required Color colors,
   double? width,
  position,
}) {
  Flushbar(
    title: title,
    // titleColor: Colors.white,
    message: message,
    flushbarPosition: position,
    flushbarStyle: FlushbarStyle.FLOATING,
    reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.elasticOut,
    // backgroundColor: Colors.red,
    // borderRadius: BorderRadius.circular(8),

    boxShadows: [
      BoxShadow(
        color: colors,
        offset: const Offset(0.0, 2.0),
        blurRadius: 1.0,
      )
    ],
    backgroundColor: Colors.white,
    isDismissible: false,
    duration: const Duration(seconds: 4),
    icon: const ClipRRect(
      borderRadius:  BorderRadius.all(
        Radius.circular(
          5.0,
        ),
      ),
      child: Icon(
        Icons.info,
        color: Colors.yellow,
        size: 30,
      ),
    ),
    mainButton: Icon(
      icon,
      color: Colors.greenAccent,
    ),
    showProgressIndicator: true,
    progressIndicatorBackgroundColor: Colors.blueGrey,
    titleText: Text(
      title,
      style: TextStyle(
        color: colors,
        fontWeight: FontWeight.w500,
        fontSize: jtdeviceWidth(context) / 25,
      ),
    ),
    messageText: Text(
      message,
      style: TextStyle(
        color: colors,
        fontWeight: FontWeight.bold,
        fontSize: jtdeviceWidth(context) / 30,
      ),
    ),
  ).show(context);
}
