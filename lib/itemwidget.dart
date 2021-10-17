import 'package:flutter/material.dart';

void onscreen() {}

class Item_Widget extends StatelessWidget {
  String title;
  String image;
  String des;
  String price;
  Item_Widget(
      {required this.title,
      required this.des,
      required this.image,
      required this.price});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onscreen,
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 5,
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      image,
                      height: 250,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    child: Container(
                      color: Colors.black54,
                      padding: EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 40,
                      ),
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    bottom: 5,
                    right: 0,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('images/cart.png'),
                  Text('\$$price'),
                  Image.asset('images/favourite.png',height: 25,)
                ],
              )
            ],
          )),
    );
  }
}
