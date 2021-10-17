import 'package:flutter/material.dart';
import './model/item.dart';
import './model/dummydata.dart';
import 'package:provider/provider.dart';
class addscreen extends StatefulWidget {
  static const route='addscreen';

  @override
  _addscreenState createState() => _addscreenState();
}

class _addscreenState extends State<addscreen> {
  var ccategory=TextEditingController();
  var ctitle=TextEditingController();
  var cdesc=TextEditingController();
  var cimage=TextEditingController();
  var cprice=TextEditingController();
  var _isloading=false;
  final _form = GlobalKey<FormState>();
  var _categoryfocusnode=FocusNode();
  var _titlefocusnode=FocusNode();
  var _desfocusnode=FocusNode();
  var _pricefocusnode=FocusNode();
  var _imagefocusnode=FocusNode();
  var _editedproduct=Item(id: '', category: [''], title: '', description: '', imageurl: '', price: '');

  void onsave(){
    setState(() {
      _isloading=true;
    });

    _editedproduct=Item(id:'', category:ccategory.text.split(','), title: ctitle.text, description: cdesc.text, imageurl: cimage.text, price: cprice.text);
    Provider.of<DummyData>(context,listen: false).adddata(_editedproduct).then((_) {_isloading=false;Navigator.of(context).pop();});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product to sale',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),backgroundColor: Colors.blue,),
      body:_isloading?Center(child: CircularProgressIndicator(),):Form(

        key: _form,
        child:Column(

          children:[
            TextFormField(

              decoration: InputDecoration(labelText: 'Category',labelStyle: TextStyle(fontSize: 20)),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {FocusScope.of(context).requestFocus(_titlefocusnode);},

              controller: ccategory,
            ),
            TextFormField(

              decoration: InputDecoration(labelText: 'Title',labelStyle: TextStyle(fontSize: 20)),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {FocusScope.of(context).requestFocus(_desfocusnode);},
              focusNode: _titlefocusnode,
              controller: ctitle,
            ),
            TextFormField(

              decoration: InputDecoration(labelText: 'Description',labelStyle: TextStyle(fontSize: 20)),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {FocusScope.of(context).requestFocus(_imagefocusnode);},
              focusNode: _desfocusnode,
              controller: cdesc,
            ),
            TextFormField(

              decoration: InputDecoration(labelText: 'Image Url',labelStyle: TextStyle(fontSize: 20)),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {FocusScope.of(context).requestFocus(_pricefocusnode);},
              focusNode: _imagefocusnode,
              controller: cimage,
            ),
            TextFormField(

              decoration: InputDecoration(labelText: 'Price',labelStyle: TextStyle(fontSize: 20)),
              textInputAction: TextInputAction.next,
              focusNode: _pricefocusnode,
              controller: cprice,
            ),

            Container(
              color: Colors.blue,
              width: double.infinity,
              height: 60,
              margin: EdgeInsets.all(30),
              child: FlatButton(onPressed: onsave,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Row(
                      children: [
                        Icon(Icons.save,size: 40,),
                        Text('Save',style: TextStyle(fontSize: 20),),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],),

      ),
    );
  }
}

