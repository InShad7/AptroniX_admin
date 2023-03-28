import 'package:aptronix/utils/color.dart';
import 'package:aptronix/view/home_screen/home_screen.dart';
import 'package:aptronix/view/login_screen/login_screen.dart';
import 'package:aptronix/view/login_screen/widgets/text_field.dart';
import 'package:aptronix/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: mHeight! / 15,
          width: mWidth! / 1.099,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                checkLogin(context);
              }
            },
            child: Text(
              'Sign In',
              style: GoogleFonts.ubuntu(
                  textStyle: TextStyle(fontSize: mHeight! / 40)),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: mHeight! / 3.1),
          child: Text(
            'Admin App',
            style: GoogleFonts.ubuntu(
              textStyle: TextStyle(
                  fontSize: mHeight! / 44,
                  color: grey,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }

  void checkLogin(BuildContext context) async {
    if (userNameController.text == 'admin' &&
        passwordController.text == 'pass') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Loged In Succesfully',
            style: GoogleFonts.ubuntu(
              textStyle: TextStyle(fontSize: mHeight! / 55),
            ),
          ),
          backgroundColor: blue,
        ),
      );

      final sharedPrefer = await SharedPreferences.getInstance();
      await sharedPrefer.setBool('isLoggedIn', true);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => const HomeScreen()),
        ),
      );
    } else if (userNameController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please Enter Valid Credential',
            style: GoogleFonts.ubuntu(
              textStyle: TextStyle(fontSize: mHeight! / 55),
            ),
          ),
          backgroundColor: red,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Invalid Username And Password',
            style: GoogleFonts.ubuntu(
              textStyle: TextStyle(fontSize: mHeight! / 55),
            ),
          ),
          backgroundColor: red,
        ),
      );
    }
  }
}
