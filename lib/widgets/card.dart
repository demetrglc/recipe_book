import 'package:cookbook/constants.dart';
import 'package:cookbook/models/product_data.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final Product product;

  const MyWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 2.0,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            child: Image.asset(
              product.image.toString(),
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            width: 180.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title.toString(),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: kTinyTitleTextStyle,
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
