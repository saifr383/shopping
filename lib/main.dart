import 'package:flutter/material.dart';
import 'package:untitled/addscreen.dart';
import 'package:untitled/authscreen.dart';
import 'package:untitled/model/dummydata.dart';
import 'authscreen.dart';
import 'itempage.dart';
import 'tabbedpage.dart';
import 'package:provider/provider.dart';
import './model/auth.dart';
void main() => runApp(homepage());

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider.value(value:Auth()),
        ChangeNotifierProxyProvider<Auth, DummyData>(
          update: (ctx,auth,previousitem)=>DummyData(auth.token!,previousitem==null?[]:previousitem.dummy_item),
        ),


      ],
      child: Consumer<Auth>(
        builder:(ctx,auth,_)=> MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shoppingapp',
          home:auth.isAuth?TabsScreen(): AuthScreen(),
          routes: {
            ItemPage.routename: (ctx) => ItemPage(),
            addscreen.route: (ctx) => addscreen()
          },
        ),
      )
    );
  }
}
