import 'package:cookbook/screens/details/components/detail_body.dart';
import 'package:flutter/material.dart';
import '../../models/product_data.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Body(product: product),
    );
  }
}
