import 'package:flutter/material.dart';
import 'model/dummydata.dart';
import 'categorywidget.dart';
import 'package:provider/provider.dart';

class categoriepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      GridView(
        padding: EdgeInsets.all(20),
        children: Provider.of<DummyData>(context).data.map((ctx) => CategoryItem(ctx.id,ctx.name, ctx.color)).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),

    );
  }
}
