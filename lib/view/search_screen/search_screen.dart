import 'package:aptronixadmin/controller/controller.dart';
import 'package:aptronixadmin/utils/color.dart';
import 'package:flutter/material.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                autofocus: true,
                controller: searchController,
                cursorColor: blue,
                style: TextStyle(color: blue),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: blue),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear, color: blue),
                    onPressed: () => searchController.clear(),
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(234, 236, 238, 2),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50)),
                  hintText: 'Search . . .',
                ),
                onChanged: (value) {
                  // title
                  //     .where((element) => element
                  //         .toString()
                  //         .toLowerCase()
                  //         .contains(value.toLowerCase()))
                  //     .toList();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
