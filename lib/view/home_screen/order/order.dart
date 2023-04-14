import 'package:aptronixadmin/controller/controller.dart';
import 'package:aptronixadmin/utils/color.dart';
import 'package:aptronixadmin/utils/utils.dart';
import 'package:aptronixadmin/view/home_screen/order/order_details.dart';
import 'package:aptronixadmin/view/home_screen/widgets/search_bar.dart';
import 'package:aptronixadmin/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          kHeight,
          const SearchBar(),
          kHeight20,
          Expanded(
            child: StreamBuilder(
                stream: getProducts(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.connectionState == ConnectionState.done ||
                      snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      final data = snapshot.data;
                      return snapshot.data!.isEmpty
                          ? const Center(child: Text('List empty'))
                          : ListView.builder(
                              itemCount: data.length,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                final order = data[index];
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: mWidth! / 20,
                                      right: mWidth! / 20,
                                      top: mHeight! / 130),
                                  child: Container(
                                    height: mHeight! / 14,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: grey,
                                    ),
                                    child: InkWell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(13.0),
                                              child: SizedBox(
                                                width: 200,
                                                child: Text(
                                                  order['name'],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.ubuntu(
                                                      textStyle: TextStyle(
                                                          fontSize:
                                                              mHeight! / 48),
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ),
                                            const Spacer(),
                                            Text(
                                              'Delivered',
                                              style: GoogleFonts.ubuntu(
                                                  textStyle: TextStyle(
                                                      fontSize: mHeight! / 58),
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.green),
                                            ),
                                            kWidth,
                                          ],
                                        ),
                                      ),
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => OrderDetails(),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                    }
                  }
                  return const Text("Cant fetch Data");
                }),
          )
        ],
      ),
    );
  }
}
