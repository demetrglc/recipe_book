import 'package:flutter/cupertino.dart';

class Product {
  final String? image, title, description;
  final int? service, second, id;
  final Color? color;

  Product({
    this.id,
    this.image,
    this.title,
    this.service,
    this.second,
    this.description,
    this.color,
  });
}
