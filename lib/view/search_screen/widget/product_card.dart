import 'package:aptronixadmin/controller/controller.dart';
import 'package:aptronixadmin/utils/color.dart';
import 'package:aptronixadmin/utils/utils.dart';
import 'package:aptronixadmin/view/home_screen/production/add_screen.dart';
import 'package:aptronixadmin/view/home_screen/production/product_detail.dart';
import 'package:aptronixadmin/view/home_screen/production/widget/custom_btn.dart';
import 'package:aptronixadmin/view/home_screen/widgets/search_bar.dart';
import 'package:aptronixadmin/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key, this.search = false}) : super(key: key);
  final search;
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late Stream productStream;

  @override
  void initState() {
    super.initState();
    productStream = getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: productStream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: blue));
          }
          if (snapshot.connectionState == ConnectionState.done ||
              snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              return snapshot.data!.isEmpty
                  ? const Center(child: Text('List empty'))
                  : ListView.builder(
                      itemCount:
                          widget.search ? searchList.length : data.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final product =
                            widget.search ? searchList[index] : data[index];
                        return Padding(
                          padding: EdgeInsets.only(
                              left: mWidth! / 20,
                              right: mWidth! / 20,
                              top: mHeight! / 130),
                          child: Slidable(
                            endActionPane: ActionPane(
                                motion: const BehindMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) async {
                                      await deleteAlert(context, product['id']);
                                      // await deleteProduct(
                                      //     product['id']);
                                    },
                                    backgroundColor: deleteRed,
                                    icon: Icons.close_rounded,
                                    label: 'Delete',
                                  ),
                                ]),
                            child: Container(
                              height: mHeight! / 11.7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: grey,
                              ),
                              child: InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: mHeight! / 14.3,
                                        width: mWidth! / 6.6,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  product['images'][0]),
                                              fit: BoxFit.contain),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(13.0),
                                        child: SizedBox(
                                          width: 200,
                                          child: Text(
                                            product['name'],
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.ubuntu(
                                                textStyle: TextStyle(
                                                    fontSize: mHeight! / 48),
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        product['quantity'].toString(),
                                        style: GoogleFonts.ubuntu(
                                            textStyle: TextStyle(
                                                fontSize: mHeight! / 58),
                                            fontWeight: FontWeight.w400),
                                      ),
                                      kWidth20,
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
                          ),
                        );
                      },
                    );
            }
          }
          return const Text("Cant fetch Data");
        });
  }

  deleteAlert(context, product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          'Are you sure want to delete!',
          style: GoogleFonts.ubuntu(fontSize: mHeight! / 50),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              deleteProduct(product);
              Navigator.pop(context);

              setState(() {
                productStream = getProducts();
              });
              Fluttertoast.showToast(
                msg: "Deleted.",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: deleteRed,
                textColor: Colors.white,
                fontSize: 17.0,
              );
            },
            child: Text(
              'DELETE',
              style:
                  GoogleFonts.ubuntu(color: deleteRed, fontSize: mHeight! / 60),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'DISMISS',
              style: GoogleFonts.ubuntu(color: grey1, fontSize: mHeight! / 60),
            ),
          ),
        ],
      ),
    );
  }
}
