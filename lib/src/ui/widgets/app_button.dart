import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sell_notes/src/constants/colors.dart';
import 'package:sell_notes/src/constants/note_text_style.dart';

enum AppButtonType { login, signUp }

class AppButton extends StatefulWidget {
  final VoidCallback onPressed;
  final AppButtonType type;
  const AppButton({
    Key? key,
    required this.type,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  String? name;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: (widget.type == AppButtonType.login)
            ? AppColors.backgroundColor
            : AppColors.backgroundSecondaryColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: TextButton(
        style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
        onPressed: widget.onPressed,
        child: Text(
          (widget.type == AppButtonType.login) ? 'Login' : 'Sign Up',
          style: NoteTextStyle.get(
            noteFontSize: NoteFontSize.h4,
            noteFontWeight: NoteFontWeight.bold,
            color: (widget.type == AppButtonType.login)
                ? Colors.black87
                : Colors.black,
          ),
        ),
      ),
    );
  }
}
