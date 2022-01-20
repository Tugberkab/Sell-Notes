import 'package:flutter/material.dart';
import 'package:sell_notes/src/constants/colors.dart';
import 'package:sell_notes/src/constants/note_text_style.dart';
import 'package:sell_notes/src/services/auth.dart';
import 'package:sell_notes/src/ui/widgets/app_button.dart';
import 'package:sell_notes/src/ui/widgets/app_text_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  AuthService auth = AuthService();
  static double sizedBoxHeight = 20;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 40),
        decoration: BoxDecoration(
          gradient: AppGradient.backgroundGradient,
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.grey)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Sign Up',
                    style: NoteTextStyle.get(
                      noteFontSize: NoteFontSize.h2,
                      noteFontWeight: NoteFontWeight.normal,
                    ),
                  ),
                  SizedBox(height: sizedBoxHeight),
                  const AppTextFormField(type: AppTextFormFieldType.name),
                  SizedBox(height: sizedBoxHeight),
                  const AppTextFormField(type: AppTextFormFieldType.surname),
                  SizedBox(height: sizedBoxHeight),
                  const AppTextFormField(type: AppTextFormFieldType.mail),
                  SizedBox(height: sizedBoxHeight),
                  const AppTextFormField(type: AppTextFormFieldType.password),
                  SizedBox(height: sizedBoxHeight),
                  const AppTextFormField(type: AppTextFormFieldType.passAgain),
                  SizedBox(height: sizedBoxHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppButton(
                        type: AppButtonType.login,
                        onPressed: () {},
                      ),
                      AppButton(
                        type: AppButtonType.signUp,
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
