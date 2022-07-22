import 'package:flutter/material.dart';


///space between product alignment [height]
Widget jtmanualStepper({int step = 5}) {
  return SizedBox(height: step.toDouble());
}

Widget jtmanualSpacer({int step = 5}) {
  return SizedBox(
    width: step.toDouble(),
  );
}

///dynamic device height
double jtdeviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

///dynamic device width
double jtdeviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

//physics
ScrollPhysics physics = const BouncingScrollPhysics();

