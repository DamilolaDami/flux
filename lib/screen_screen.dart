import 'package:flutter/widgets.dart';

class Responsive {
  // function reponsible for providing value according to screensize
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static bool isTablet(BuildContext context) {
    return screenWidth(context) > 600;
  }
}
