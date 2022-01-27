import 'package:flutter/material.dart';
import 'package:sell_notes/src/constants/note_text_style.dart';

class ProjectInputDecoration extends InputDecoration {
  ProjectInputDecoration(String hintText, IconButton? suffixIcon)
      : super(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: NoteTextStyle.get(
            noteFontSize: NoteFontSize.h4,
            noteFontWeight: NoteFontWeight.normal,
          ),
          suffixIcon: suffixIcon,
          suffixIconColor: Colors.grey,
        );
}
