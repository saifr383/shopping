import 'package:flutter/material.dart';
import 'package:untitled/categoriespage.dart';
import 'package:untitled/favourite.dart';
import 'drawerwidget.dart';
class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(child:drawer()),
        appBar: AppBar(
          title: Text('Items'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favourite',
              )
            ],
          ),
        ),
        body: TabBarView(children: [categoriepage(),favourite()],),
      ),
    );
  }
}
