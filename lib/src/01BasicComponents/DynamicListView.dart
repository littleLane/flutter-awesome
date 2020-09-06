import 'package:flutter/material.dart';

class DynamicListView extends StatelessWidget {
  final List<String> items;
  DynamicListView({ Key key, @required this.items }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic ListView',
      home: Scaffold(
        body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return new ListTile(
              title: new Text('${items[index]}'),
            );
          }
        ),
      ),
    );
  }
}