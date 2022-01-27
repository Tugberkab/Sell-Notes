import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/note_text_style.dart';
import '../../../../services/auth.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_text_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  AuthService auth = AuthService();
  static double sizedBoxHeight = 20;

  String? username;
  String? mail;
  String? pass;
  String? passAgain;
  String? name;
  String? surname;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: Scaffold(
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
                child: Form(
                  key: _formKey,
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
                      AppTextFormField(
                        type: AppTextFormFieldType.name,
                        onSaved: (newValue) {
                          if (newValue != null) {
                            name = newValue;
                          }
                        },
                      ),
                      SizedBox(height: sizedBoxHeight),
                      AppTextFormField(
                        type: AppTextFormFieldType.surname,
                        onSaved: (newValue) {
                          if (newValue != null) {
                            surname = newValue;
                          }
                        },
                      ),
                      SizedBox(height: sizedBoxHeight),
                      AppTextFormField(
                        type: AppTextFormFieldType.mail,
                        onSaved: (newValue) {
                          if (newValue != null) {
                            mail = newValue;
                          }
                        },
                      ),
                      SizedBox(height: sizedBoxHeight),
                      AppTextFormField(
                        type: AppTextFormFieldType.password,
                        onSaved: (newValue) {
                          if (newValue != null) {
                            pass = newValue;
                          }
                        },
                      ),
                      SizedBox(height: sizedBoxHeight),
                      AppTextFormField(
                        type: AppTextFormFieldType.passAgain,
                        onSaved: (newValue) {
                          if (newValue != null) {
                            passAgain = newValue;
                          }
                        },
                      ),
                      SizedBox(height: sizedBoxHeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppButton(
                            type: AppButtonType.login,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          AppButton(
                            type: AppButtonType.signUp,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print('validasyon sağlandı');
                                if (pass == passAgain) {
                                  _formKey.currentState!.save();
                                  print('şifreler aynı');
                                  print('Mail: ' + mail.toString());
                                  print('pass: ' + pass.toString());
                                  print('passAgain: ' + passAgain.toString());
                                  print('username: ' + username.toString());
                                  print('Name: ' + name.toString());
                                  print('Surname: ' + surname.toString());
                                } else if (pass != passAgain) {
                                  print('Şifreler farklı');
                                } else {
                                  print('başka bir hata var');
                                }
                              }
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
        ),
      ),
    );
  }
}
