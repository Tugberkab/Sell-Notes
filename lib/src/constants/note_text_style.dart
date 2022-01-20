import 'package:flutter/material.dart';

enum NoteFontWeight { normal, bold }
enum NoteFontSize { h6, h5, h4, h3, h2, h1 }

const String _FONT_FAMILY = 'Abel';

class NoteTextStyle {
  static TextStyle get({
    NoteFontWeight? noteFontWeight,
    NoteFontSize? noteFontSize,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: _FONT_FAMILY,
      fontWeight: _getFontWeight(noteFontWeight!),
      fontSize: _getFontSize(noteFontSize!),
      color: color ?? Colors.black,
    );
  }

  static FontWeight _getFontWeight(NoteFontWeight appFontWeight) {
    switch (appFontWeight) {
      case NoteFontWeight.normal:
        return FontWeight.normal;
      case NoteFontWeight.bold:
        return FontWeight.bold;
      default:
        return FontWeight.normal;
    }
  }

  static double _getFontSize(NoteFontSize appFontSize) {
    switch (appFontSize) {
      case NoteFontSize.h1:
        return 30;
      case NoteFontSize.h2:
        return 25;
      case NoteFontSize.h3:
        return 20;
      case NoteFontSize.h4:
        return 16;
      case NoteFontSize.h5:
        return 14;
      case NoteFontSize.h6:
        return 12;
      default:
        return 12;
    }
  }
}
