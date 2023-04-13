import 'package:aptronixadmin/utils/color.dart';
import 'package:aptronixadmin/utils/utils.dart';
import 'package:aptronixadmin/view/home_screen/production/add_screen.dart';
import 'package:aptronixadmin/view/home_screen/production/product_detail.dart';
import 'package:aptronixadmin/view/home_screen/production/widget/custom_btn.dart';
import 'package:aptronixadmin/view/home_screen/widgets/search_bar.dart';
import 'package:aptronixadmin/view/login_screen/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          kHeight,
          const SearchBar(),
          kHeight20,
          StreamBuilder(
              stream: getProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.connectionState == ConnectionState.done ||
                    snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    final data = snapshot.data;
                    return snapshot.data!.isEmpty
                        ? const Text('list empty')
                        : Expanded(
                            child: ListView.builder(
                              itemCount: data.length,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                final product = data[index];
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: mWidth! / 20,
                                      right: mWidth! / 20,
                                      top: mHeight! / 130),
                                  child: Container(
                                    height: mHeight! / 11.7,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: grey,
                                    ),
                                    child: InkWell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: mHeight! / 14.3,
                                              width: mWidth! / 6.3,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        product['images'][0]),
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(13.0),
                                              child: Flexible(
                                                child: Text(
                                                  product['name'],
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
                                            kWidth150,
                                            Text(
                                              product['quantity'].toString(),
                                              style: GoogleFonts.ubuntu(
                                                  textStyle: TextStyle(
                                                      fontSize: mHeight! / 58),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetails(product: product),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                  }
                }
                return const Text("Cant fetch Data");
              })
        ],
      ),
      bottomNavigationBar: navigateBtn(
        title: 'Add Product',
        context: context,
        navigateTo: AddProductScreen(),
      ),
    );
  }
}

Stream getProducts() async* {
  final QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('products').get();
  final List<DocumentSnapshot> docs = querySnapshot.docs;
  yield docs;
}
