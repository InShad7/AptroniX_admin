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
                stream: getOrder(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(color: blue));
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
                                List filteredList = [];
                                for (int i = 0; i < data.length; i++) {
                                  filteredList.add(myProduct
                                      .where((item) => data[i]['products']
                                          .contains(item['id']))
                                      .toList()
                                    ..sort((a, b) => data
                                        .indexOf(a['id'])
                                        .compareTo(data.indexOf(b['id']))));
                                }

                                final product = filteredList[index];
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: mWidth! / 20,
                                      right: mWidth! / 20,
                                      top: mHeight! / 130),
                                  child: Container(
                                    height: mHeight! / 9,
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
                                                width: 250,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      product[0]['name'],
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.ubuntu(
                                                          textStyle: TextStyle(
                                                              fontSize:
                                                                  mHeight! /
                                                                      40),
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    kHeight,
                                                    Text(
                                                      data[index]['username'],
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.ubuntu(
                                                          textStyle: TextStyle(
                                                              fontSize:
                                                                  mHeight! /
                                                                      52),
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ],
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
