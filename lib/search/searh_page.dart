import 'dart:ui';

import 'package:cookbook/constants.dart';
import 'package:cookbook/models/product_data.dart';
import 'package:cookbook/models/products.dart';
import 'package:cookbook/screens/details/details_screen.dart';
import 'package:flutter/material.dart';

import '../screens/home/components/item_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static List<Product> product_list = [];
  List<Product> display_list = List.from(product_list);

  void updateList(String value) {
    setState(() {
      display_list = product_list
          .where((element) =>
              element.title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    allList();
  }

  allList() {
    product_list.addAll(products1);
    product_list.addAll(products2);
    product_list.addAll(products3);
    product_list.addAll(products4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: themeColor,
        elevation: 0.0,
        title: TextField(
          onChanged: (value) => updateList(value),
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: themeColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            hintText: "eg : Baklava",
            hintStyle: TextStyle(color: Colors.white),
            prefixIcon: Icon(Icons.search),
            prefixIconColor: Color.fromARGB(255, 209, 60, 172),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: display_list.length == 0
                  ? Center(
                      child: Text("Not found"),
                    )
                  : ListView.builder(
                      itemCount: display_list.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => DetailsScreen(
                                      product: display_list[index]))));
                        }),
                        child: ItemCard(
                          product: display_list[index],
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
