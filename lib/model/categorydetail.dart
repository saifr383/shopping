import 'package:flutter/material.dart';

class CategoryDetail {
  final String id;
  final String name;
  final Color color;
  const CategoryDetail(
      {required this.id ,
      required this.name,
      this.color = Colors.orange});
}
