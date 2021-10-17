import 'package:flutter/material.dart';
import 'model/dummydata.dart';
import './model/item.dart';
import 'itemwidget.dart';
import 'package:provider/provider.dart';
class ItemPage extends StatefulWidget {
  static const routename = 'itempage';

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  var isloading=false;
  @override
  void initState(){
    setState(() {
      isloading=true;
      Provider.of<DummyData>(context,listen: false).dummy_item;
    });
    Provider.of<DummyData>(context,listen: false).getdata().then((_){setState(() {
      isloading=false;
    });});

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final route =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String? name = route['name'];
    final String? id = route['id'];
    final item_cat = Provider.of<DummyData>(context).dummy_item.where((item) {
      return item.category.contains(id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(name!),
      ),
      body:isloading?Center( child:CircularProgressIndicator(),): ListView.builder(
        itemBuilder: (ctx, index) {
          return Item_Widget(title: item_cat[index].title, des: item_cat[index].description, image: item_cat[index].imageurl,price: item_cat[index].price,);
        },
        itemCount: item_cat.length,
      ),
    );
  }
}
