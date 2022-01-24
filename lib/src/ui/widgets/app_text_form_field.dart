import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:sell_notes/src/constants/note_text_style.dart';

enum AppTextFormFieldType { name, surname, mail, password, passAgain }

class AppTextFormField extends StatefulWidget {
  final AppTextFormFieldType type;
  const AppTextFormField({Key? key, required this.type}) : super(key: key);

  @override
  _AppTextFormFieldState createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  final _formKey = GlobalKey<FormState>();
  FormFieldValidator<String>? validator;
  FormFieldSetter<String>? onSaved;
  TextInputType? keyboardType;
  String? hintText;
  IconButton? suffixIcon;
  bool showPassword = false;
  bool obscureText = false;

  String username = '';
  String mail = '';
  String pass = '';
  String passAgain = '';
  String name = '';
  String surname = '';

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case AppTextFormFieldType.mail:
        suffixIcon = null;
        hintText = 'Email';
        keyboardType = TextInputType.emailAddress;
        validator = (value) {
          if (value == null) {
            return 'Email field cannot be empty';
          } else {
            String trimmedValue = value.trim();
            if (trimmedValue.isEmpty) {
              return 'Email field cannot be empty';
            }
            if (!EmailValidator.validate(trimmedValue)) {
              return 'Please enter a valid email';
            }
          }
        };
        onSaved = (value) {
          if (value != null) {
            mail = value;
          }
        };
        break;
      case AppTextFormFieldType.name:
        suffixIcon = null;
        hintText = 'Name';
        keyboardType = TextInputType.name;
        validator = (value) {
          if (value == null) {
            return 'Name field cannot be empty';
          } else {
            String trimmedValue = value.trim();
            if (trimmedValue.isEmpty) {
              return 'Name field cannot be empty';
            }
          }
        };
        onSaved = (value) {
          if (value != null) {
            name = value;
          }
        };
        break;
      case AppTextFormFieldType.surname:
        suffixIcon = null;
        hintText = 'Surname';
        keyboardType = TextInputType.name;
        validator = (value) {
          if (value == null) {
            return 'Surname field cannot be empty';
          } else {
            String trimmedValue = value.trim();
            if (trimmedValue.isEmpty) {
              return 'Surname field cannot be empty';
            }
          }
        };
        onSaved = (value) {
          if (value != null) {
            surname = value;
          }
        };
        break;
      case AppTextFormFieldType.password:
        hintText = 'Password';
        keyboardType = TextInputType.visiblePassword;
        validator = (value) {
          if (value == null) {
            return 'Password field cannot be empty';
          } else {
            String trimmedValue = value.trim();
            if (trimmedValue.isEmpty) {
              return 'Password field cannot be empty';
            }
            if (trimmedValue.length < 6) {
              return 'Password must be at least 6 characters long';
            }
            if (trimmedValue.length > 12) {
              return 'Password length cannot longer than 12 characters long';
            }
          }
        };
        onSaved = (value) {
          if (value != null) {
            pass = value;
          }
        };
        suffixIcon = IconButton(
          onPressed: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
          icon: (showPassword == false)
              ? Icon(Icons.visibility_off, color: Colors.grey)
              : Icon(Icons.visibility, color: Colors.grey),
        );
        obscureText = (showPassword == false) ? true : false;
        break;
      case AppTextFormFieldType.passAgain:
        hintText = 'Password Again';
        keyboardType = TextInputType.visiblePassword;
        validator = (value) {
          if (value == null) {
            return 'Password Again field cannot be empty';
          } else {
            String trimmedValue = value.trim();
            if (trimmedValue.isEmpty) {
              return 'Password Again field cannot be empty';
            }
            if (trimmedValue.length < 6) {
              return 'Password Again must be at least 6 characters long';
            }
            if (trimmedValue.length > 12) {
              return 'Password Again length cannot longer than 12 characters long';
            }
          }
        };
        onSaved = (value) {
          if (value != null) {
            passAgain = value;
          }
        };
        suffixIcon = IconButton(
          onPressed: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
          icon: (showPassword == false)
              ? Icon(Icons.visibility_off, color: Colors.grey)
              : Icon(Icons.visibility, color: Colors.grey),
        );
        obscureText = (showPassword == false) ? true : false;
        break;
      default:
    }
    return TextFormField(
      key: _formKey,
      validator: validator,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
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
      ),
      keyboardType: keyboardType,
      onSaved: onSaved,
      obscureText: obscureText,
    );
  }
}
