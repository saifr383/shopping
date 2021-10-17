import 'package:flutter/material.dart';
import 'package:untitled/categoriespage.dart';
import 'itempage.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final Color color;
  final String id ;
  CategoryItem(this.id,this.name, this.color);
  void onclick(BuildContext context) {
    Navigator.of(context)
        .pushNamed(ItemPage.routename, arguments: {'name': name, 'id': id});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onclick(context),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.5),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
