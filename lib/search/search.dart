import 'package:cookbook/models/product_data.dart';
import 'package:cookbook/models/products.dart';
import 'package:cookbook/screens/home/components/home_body.dart';
import 'package:flutter/material.dart';

import '../screens/details/details_screen.dart';
import '../screens/home/components/item_card.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Container(
        decoration: BoxDecoration(
          color: Colors.red,
        ),
        child: IconButton(
            onPressed: () {
              query = "";
            },
            icon: Icon(
              Icons.close,
              color: Colors.white,
            )),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 0, 0, 0),
          )),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Product> matchQuery = [];
    for (var element in allItems) {
      if (element.title!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(element);
      }
    }
    if (matchQuery.length > 0) {
      return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(255, 255, 255, 255),
        ])),
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: matchQuery.length,

              //birbiri arasındaki orta mesafeler ayarlandı

              itemBuilder: (context, index) => GestureDetector(
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              DetailsScreen(product: matchQuery[index]))));
                }),
                child: ItemCard(
                  product: matchQuery[index],
                ),
              ),
            ),
          ),
        ),
      );
    } else
      return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 255, 255, 255),
          ])),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              child: Center(
                child: Text(
                  'Aradığınız yemek bulunamadı!',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(255, 255, 255, 255),
        ])),
        child: Center(
          child: Text(
            'Aramak istediğiniz yemeği yukarıya yazınız',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ));
  }
}
