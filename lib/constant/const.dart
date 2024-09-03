import 'package:flutter/material.dart';

class ScreenSize {
  static late double width;
  static late double height;
  static void updateScreenDimensions({required BuildContext context}) {
    Size size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
  }
}
const Color bgColor =Color(0xff001321);
const Color textColor =Color(0xff51DDE2);
const Color titleColor=Color.fromARGB(255, 65, 80, 240);