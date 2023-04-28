import 'package:aptronixadmin/utils/color.dart';
import 'package:aptronixadmin/view/home_screen/feature_img/feature_img.dart';
import 'package:aptronixadmin/view/home_screen/order/order.dart';
import 'package:aptronixadmin/view/home_screen/production/product_list.dart';
import 'package:aptronixadmin/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Aptronix',
            style: GoogleFonts.ubuntu(
              textStyle: TextStyle(fontSize: mHeight! / 25, color: black),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  alertBox(context);
                },
                icon: Icon(
                  Icons.power_settings_new_outlined,
                  color: black,
                  size: mHeight! / 30,
                ),
              ),
            ),
          ],
          bottom: TabBar(
            labelColor: black,
            unselectedLabelColor: black,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: black,
            labelStyle: GoogleFonts.ubuntu(
              textStyle: TextStyle(
                  fontSize: mHeight! / 50, fontWeight: FontWeight.bold),
            ),
            tabs: const [
              Tab(
                text: 'Products',
              ),
              Tab(
                text: 'Orders',
              ),
              Tab(
                text: 'Banner Img',
              ),
            ],
          ),
        ),
        body:  TabBarView(
            children: [ProductList(), OrderList(), FeatureImg()]),
      ),
    );
  }
}

void alertBox(context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Text(
        'Are you sure want to LogOut.!',
        style: GoogleFonts.ubuntu(fontSize: mHeight! / 50),
      ),
      actions: [
        TextButton(
          onPressed: () async {
            final sharedPrefer = await SharedPreferences.getInstance();
            await sharedPrefer.setBool('isLoggedIn', false);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
                (route) => false);
          },
          child: Text(
            'LOGOUT',
            style:
                GoogleFonts.ubuntu(color: Colors.teal, fontSize: mHeight! / 60),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'DISMISS',
            style: GoogleFonts.ubuntu(color: red, fontSize: mHeight! / 60),
          ),
        ),
      ],
    ),
  );
}
