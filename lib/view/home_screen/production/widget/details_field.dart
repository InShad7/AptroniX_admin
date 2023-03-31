import 'package:aptronix/utils/color.dart';
import 'package:aptronix/utils/utils.dart';
import 'package:aptronix/view/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget detailsField(
    {required String label,
    required double ht,
    required double width,
    required bool num,
    required int max,
    required String content,
    required bool readOnly}) {
  return Padding(
    padding: EdgeInsets.only(left: mWidth! / 22, right: mWidth! / 22),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(
          " $label",
          style: GoogleFonts.sora(
              textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ),
        Container(
          decoration: BoxDecoration(
            color: grey,
            borderRadius: BorderRadius.circular(18),
          ),
          height: ht,
          width: width,
          child: customField(num, max, content, readOnly),
        ),
      ],
    ),
  );
}

Widget customField(bool num, int max, String content, bool readOnly) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      minLines: 1,
      initialValue: content,
      readOnly: readOnly,
      maxLines: max,
      keyboardType: num ? TextInputType.number : TextInputType.text,
      textAlignVertical: TextAlignVertical.center,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        border: InputBorder.none,
      ),
      style: GoogleFonts.ubuntu(
        height: 1.3,
        textStyle: TextStyle(color: grey1, fontSize: mHeight! / 47),
      ),
    ),
  );
}
