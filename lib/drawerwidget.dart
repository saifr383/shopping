import 'package:flutter/material.dart';
import 'package:untitled/addscreen.dart';

class drawer extends StatelessWidget {
  void addbutton(BuildContext context){
    Navigator.of(context).pushNamed(addscreen.route);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(children: [
            Text(
              'Options',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],mainAxisAlignment: MainAxisAlignment.spaceAround,),
          width: double.infinity,
          padding: EdgeInsets.only(top: 30),
          alignment: Alignment.topCenter,
          height: 100,
          color: Colors.blue,
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(onTap:()=>addbutton(context),
          child:Container(

            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.add),
              title: Text(
                'Product to sale',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )), )
        ,
        Container(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Setting',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
        Container(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.help),
              title: Text(
                'help',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
      ],
    );
  }
}
