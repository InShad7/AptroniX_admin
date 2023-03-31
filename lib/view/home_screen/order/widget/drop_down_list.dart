import 'package:aptronix/utils/color.dart';
import 'package:aptronix/view/home_screen/order/order_details.dart';
import 'package:aptronix/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownList extends StatefulWidget {
  const DropDownList({super.key});

  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  @override
  Widget build(BuildContext context) {
    return  Container(
          height: mHeight! / 20,
          width: mWidth! / 2,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: DropdownButton(
              value: selectedItem,
              isExpanded: true,
              underline: null,
              hint: const Text('Select'),
              style: GoogleFonts.sora(
                textStyle: TextStyle(fontSize: 19, color: black),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Ordered',
                  child: Text('Ordered'),
                ),
                DropdownMenuItem(
                  value: 'Shipped',
                  child: Text('Shipped'),
                ),
                DropdownMenuItem(
                  value: 'Delivered',
                  child: Text('Delivered'),
                ),
                DropdownMenuItem(
                  value: 'Cancelled',
                  child: Text('Cancelled'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedItem = value;
                });
              }),
        );
  }
}