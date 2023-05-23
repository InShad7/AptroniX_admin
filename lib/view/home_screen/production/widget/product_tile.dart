import 'package:aptronixadmin/controller/controller.dart';
import 'package:aptronixadmin/utils/color.dart';
import 'package:aptronixadmin/utils/utils.dart';
import 'package:aptronixadmin/view/home_screen/production/product_detail.dart';
import 'package:aptronixadmin/view/login_screen/login_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductTile extends StatefulWidget {
  const ProductTile({super.key, this.product});
  final product;
  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: mWidth! / 20, right: mWidth! / 20, top: mHeight! / 130),
      child: Slidable(
        endActionPane: ActionPane(motion: const BehindMotion(), children: [
          SlidableAction(
            onPressed: (context) async {
              await deleteAlert(context, widget.product['id']);
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
                    height: mHeight! / 14.7,
                    width: mWidth! / 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: white,
                    ),
                    child: CachedNetworkImage(
                      placeholder: (context, url) =>
                          Image.asset('assets/APPRONIX.jpg'),
                      imageUrl: widget.product['images'][0],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: SizedBox(
                      width: 200,
                      child: Text(
                        widget.product['name'],
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(fontSize: mHeight! / 48),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    widget.product['quantity'].toString(),
                    style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(fontSize: mHeight! / 58),
                        fontWeight: FontWeight.w400),
                  ),
                  kWidth20,
                ],
              ),
            ),
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetails(product: widget.product),
                ),
              );
              if (result == 'refresh') {
                setState(() {});
              }
            },
          ),
        ),
      ),
    );
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
                getProducts();
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
