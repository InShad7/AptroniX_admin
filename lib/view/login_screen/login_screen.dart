import 'package:aptronix/utils/utils.dart';
import 'package:aptronix/view/login_screen/widgets/login_btn.dart';
import 'package:aptronix/view/login_screen/widgets/main_card.dart';
import 'package:aptronix/view/login_screen/widgets/text_field.dart';
import 'package:flutter/material.dart';

double? mWidth;
double? mHeight;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // mWidth = MediaQuery.of(context).size.width;
    // mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(children: [
          const SignInText(),
          kHeight20,
          MyTextField(
            title: 'Email Or Phone',
            icon: Icons.mail,
            myControler: userNameController,
            passChar: false,
          ),
          kHeight,
          MyTextField(
            title: 'Password',
            icon: Icons.lock,
            myControler: passwordController,
            passChar: true,
          ),
          kHeight,
          kHeight20,
          const LoginBtn(),
        ]),
      ),
    );
  }
}
