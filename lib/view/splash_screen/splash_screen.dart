import 'package:aptronix/view/home_screen/home_screen.dart';
import 'package:aptronix/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isloggedIn = false;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mWidth = MediaQuery.of(context).size.width;
    mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Text(
          "Aptronix",
          style: GoogleFonts.ubuntu(
            textStyle: TextStyle(fontSize: mHeight! / 12),
          ),
        ),
      ),
    );
  }

  void checkLoggedIn() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    bool loggedIn = sharedPrefs.getBool('isLoggedIn') ?? false;
    setState(() {
      isloggedIn = loggedIn;
    });
    if (isloggedIn == true) {
      await Future.delayed(
        const Duration(seconds: 2),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      await Future.delayed(
        const Duration(seconds: 3),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }
  }
}
