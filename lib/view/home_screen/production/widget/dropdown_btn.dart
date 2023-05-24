import 'package:aptronixadmin/controller/controller.dart';
import 'package:aptronixadmin/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class dropDownList extends StatefulWidget {
  dropDownList(
      {super.key,
      required this.label,
      required this.height,
      required this.width,
      required this.GB,
      required this.edit,
       this.product});
  final String label;
  final double height;
  final double width;
  final edit;
  final product;

  final bool GB;

  @override
  State<dropDownList> createState() => _dropDownListState();
}

class _dropDownListState extends State<dropDownList> {
  @override
  void initState() {
    if (widget.edit) {
      category1 = widget.product['category'];
      varient = widget.product['size'].toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: GoogleFonts.sora(
                textStyle: TextStyle(
              fontWeight: FontWeight.bold,
            )),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: widget.GB ? dropDown1() : dropDown2(),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: grey),
            ),
            height: widget.height,
            width: widget.width,
          ),
        ],
      ),
    );
  }

  DropdownButton<String> dropDown1() {
    return DropdownButton(
      isExpanded: true,
      value: category1,
      hint: const Text('Select'),
      items: const [
        DropdownMenuItem(value: 'iPhone', child: Text('iPhone')),
        DropdownMenuItem(value: 'iPad', child: Text('iPad')),
        DropdownMenuItem(value: 'Macbook', child: Text('Macbook')),
        DropdownMenuItem(value: 'Apple watch', child: Text('Apple watch')),
      ],
      onChanged: (value) {
        setState(() {
          category1 = value!;
        });
      },
    );
  }

  DropdownButton<String> dropDown2() {
    return DropdownButton(
      isExpanded: true,
      value: varient,
      hint: const Text('Select'),
      items: const [
        DropdownMenuItem(value: '64', child: Text('64 GB')),
        DropdownMenuItem(value: '128', child: Text('128 GB')),
        DropdownMenuItem(value: '256', child: Text('256 GB')),
        DropdownMenuItem(value: '512', child: Text('512 GB')),
      ],
      onChanged: (value) {
        setState(() {
          varient = value!;
        });
      },
    );
  }
}
