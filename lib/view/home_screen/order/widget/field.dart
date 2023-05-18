import 'dart:developer';
import 'package:aptronixadmin/utils/color.dart';
import 'package:aptronixadmin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.ht,
    this.width,
    required this.num,
    required this.max,
    required this.content,
    required this.readOnly,
    required this.label,
    this.btn = false,
    this.btnName = '',
    this.refresh,
  });
  final double? ht;
  final double? width;
  final bool num;
  final int max;
  final String content;
  final bool readOnly;
  final bool btn;
  final String btnName;
  final String label;
  final refresh;

  bool a = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                " $label",
                style: GoogleFonts.roboto(
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
          
            ],
          ),
          kHeight5,
          Container(
            decoration: BoxDecoration(
              color: cardClr,
              borderRadius: BorderRadius.circular(18),
            ),
            // height: ht,
            width: width,
            child: customField(num, max, content, readOnly),
          ),
        ],
      ),
    );
  }
}

Widget customField(bool num, int max, String content, bool readOnly) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8),
    child: TextFormField(
      scrollPhysics: const NeverScrollableScrollPhysics(),
      enableInteractiveSelection: false,
      minLines: 1,
      // initialValue: content,
      controller: TextEditingController(text: content),
      readOnly: readOnly,
      maxLines: max,
      keyboardType: num ? TextInputType.number : TextInputType.text,
      textAlignVertical: TextAlignVertical.center,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        border: InputBorder.none,
      ),
      style: GoogleFonts.roboto(
        height: 1.3,
        textStyle: TextStyle(color: grey1, fontSize: 22),
      ),
    ),
  );
}
