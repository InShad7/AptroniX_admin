import 'package:aptronixadmin/utils/utils.dart';
import 'package:aptronixadmin/view/login_screen/widgets/login_btn.dart';
import 'package:aptronixadmin/view/login_screen/widgets/main_card.dart';
import 'package:aptronixadmin/view/login_screen/widgets/text_field.dart';
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
            ht: 15,
            border: 20,
            title: 'Email.',
            icon: Icons.mail,
            myControler: userNameController,
            passChar: false,
          ),
          kHeight,
          MyTextField(
            ht: 15,
            border: 20,
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
