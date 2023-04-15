import 'package:aptronixadmin/utils/color.dart';
import 'package:aptronixadmin/utils/utils.dart';
import 'package:aptronixadmin/view/login_screen/login_screen.dart';
import 'package:aptronixadmin/view/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextEditingController searchController = TextEditingController();

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 7),
        height: 50,
        width: mWidth,
        decoration: BoxDecoration(
          color: grey,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              color: grey1,
            ),
            kWidth,
            Text(
              'Search . . .',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(fontSize: 20, color: grey1),
              ),
            ),
          ],
        ),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchScreen(),
        ),
      ),
    );
  }
}
