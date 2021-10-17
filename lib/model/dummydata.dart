import 'dart:convert';
import 'package:flutter/material.dart';
import 'categorydetail.dart';
import './item.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
class DummyData  with ChangeNotifier {
  final String authToken;
  DummyData(this.authToken,this.dummy_item);
  final data = const [
    CategoryDetail(id: 'c1', name: 'Cloths', color: Colors.purple),
    CategoryDetail(id: 'c2', name: 'ElectricProducts', color: Colors.red),
    CategoryDetail(id: 'c3', name: 'ComputerComponents', color: Colors.pink),
    CategoryDetail(id: 'c4', name: 'MobileItems', color: Colors.yellow),

  ];
  var dummy_item = const[];

  Future<void> adddata(Item data) {
    var url = 'https://shopping-85cb2-default-rtdb.firebaseio.com/item.json?auth=$authToken';
    return http.post(Uri.parse(url), body: json.encode({
      'title': data.title,
      'category': data.category,
      'imageurl': data.imageurl,
      'price': data.price,
      'des': data.description
    }));
    notifyListeners();
  }

  Future<void> getdata() async {
    final List<Item>loadedlist = [];
    var url = 'https://shopping-85cb2-default-rtdb.firebaseio.com/item.json?auth=$authToken';
    var response = await http.get(Uri.parse(url));
    var data = json.decode(response.body) as Map<String, dynamic>;
    data.forEach((key, value) {
      loadedlist.add(Item(id: key,
          category: List.from(value['category']),
          title: value['title'],
          description: value['des'],
          imageurl: value['imageurl'],
          price: value['price']));
    });
    dummy_item = loadedlist;
    notifyListeners();
  }

}