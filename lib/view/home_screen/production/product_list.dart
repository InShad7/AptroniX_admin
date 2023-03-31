import 'package:aptronix/utils/utils.dart';
import 'package:aptronix/view/home_screen/production/add_screen.dart';
import 'package:aptronix/view/home_screen/production/product_detail.dart';
import 'package:aptronix/view/home_screen/production/widget/custom_btn.dart';
import 'package:aptronix/view/home_screen/widgets/search_bar.dart';
import 'package:aptronix/view/login_screen/login_screen.dart';
import 'package:aptronix/view/home_screen/widgets/my_list_view_builder.dart';
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
          Expanded(
            child: MyListBuilder(
              shrinkwrap: false,
              physics: null,
              ht: 11.7,
              contents: InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    children: [
                      Container(
                        height: mHeight! / 14.3,
                        width: mWidth! / 6.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/71yzJoE7WlL._SX522_.jpg'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text(
                          'iPhone 14 Pro',
                          style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(fontSize: mHeight! / 48),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: mHeight! / 7),
                        child: Text(
                          '8',
                          style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(fontSize: mHeight! / 58),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>const ProductDetails(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: customBtn(
          navigateTo:const AddProductScreen(),
          title: 'Add Product',
          context: context),
    );
  }
}
