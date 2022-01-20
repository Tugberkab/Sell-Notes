import 'package:flutter/material.dart';

class AppColors {
  static final Color primaryColor = Color(0xff86E3CE);
  static final Color secondaryColor = Color(0xffD0E6A5);
  static final Color backgroundColor = Color(0xffFFDD94);
  static final Color backgroundSecondaryColor = Color(0xffFA897B);
  static final Color thirdColor = Color(0xffCCABD8);
}

class AppGradient {
  static final LinearGradient backgroundGradient = LinearGradient(
    colors: [AppColors.backgroundColor, AppColors.backgroundSecondaryColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
