import 'package:flutter/material.dart';

class AppPadding extends EdgeInsets {
  const AppPadding.all() : super.all(30);
  const AppPadding.lowAll() : super.all(15);
  const AppPadding.symmetricHigh()
      : super.symmetric(horizontal: 40, vertical: 50);
  const AppPadding.symmetricMedium()
      : super.symmetric(horizontal: 20, vertical: 30);
}
