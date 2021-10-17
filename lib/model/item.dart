import 'package:flutter/material.dart';

class Item {
  final String id;
  final List<String> category;
  final String title;
  final String description;
  final String price;
  final String imageurl;
  const Item(
      {required this.id ,
      required this.category ,
      required this.title ,
      required this.description ,
      required this.imageurl ,
      required this.price});
}
