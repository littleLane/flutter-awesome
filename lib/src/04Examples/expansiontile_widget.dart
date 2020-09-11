import 'package:flutter/material.dart';

class ExpansionTileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExpansionTileWidget',
      theme: ThemeData.dark(),
      home: ExpansionTileDemo(),
    );
  }
}

class ExpansionTileDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('expansion tile demo'),
      ),
      body: Center(
        child: ExpansionTile(
          title:Text('Expansion Tile'),
          leading:Icon(Icons.ac_unit),
          backgroundColor: Colors.white12,
          initiallyExpanded: false,
          children: <Widget>[
            ListTile(
              title:Text('list tile'),
              subtitle:Text('subtitle')
            )
          ],
        ),
      ),
    );
  }
}