import 'package:flutter/material.dart';
import 'package:sell_notes/src/constants/app_padding.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/note_text_style.dart';
import '../../../../services/auth.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String mail = '';
  String pass = '';
  AuthService auth = AuthService();
  static double sizedBoxHeight = 20;

  @override
  Widget build(BuildContext context) {
    return _gestureDetector(context);
  }

  GestureDetector _gestureDetector(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: Scaffold(
        body: _scaffoldBody(context),
      ),
    );
  }

  Container _scaffoldBody(BuildContext context) {
    return Container(
      padding: const AppPadding.symmetricHigh(),
      decoration: BoxDecoration(
        gradient: AppGradient.backgroundGradient,
      ),
      child: Center(
        child: Container(
          padding: const AppPadding.symmetricMedium(),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: Colors.grey)),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: NoteTextStyle.get(
                      noteFontSize: NoteFontSize.h2,
                      noteFontWeight: NoteFontWeight.normal,
                    ),
                  ),
                  SizedBox(height: sizedBoxHeight),
                  AppTextFormField(
                    type: AppTextFormFieldType.mail,
                    onSaved: (newValue) {},
                  ),
                  SizedBox(height: sizedBoxHeight),
                  AppTextFormField(
                    type: AppTextFormFieldType.password,
                    onSaved: (newValue) {},
                  ),
                  const SizedBox(height: 5),
                  InkWell(
                    onTap: () {},
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot password?',
                        style: NoteTextStyle.get(
                          color: AppColors.backgroundSecondaryColor,
                          noteFontSize: NoteFontSize.h5,
                          noteFontWeight: NoteFontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: sizedBoxHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppButton(
                        type: AppButtonType.login,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                      ),
                      AppButton(
                        type: AppButtonType.signUp,
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
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
