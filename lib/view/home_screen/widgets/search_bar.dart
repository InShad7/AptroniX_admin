import 'package:aptronixadmin/view/login_screen/widgets/text_field.dart';
import 'package:flutter/material.dart';

TextEditingController searchController = TextEditingController();

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      ht: 19,
      border: 13,
      icon: Icons.search_rounded,
      myControler: searchController,
      passChar: false,
      title: 'search . . .',
    );
  }
}
