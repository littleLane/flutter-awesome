import 'package:flutter/material.dart';

class ListViewComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Component',
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('ListView Widget'),
        ),
//        body: new Text('ListView Text'),
        body: Center(
          child: Container(
            height: 200.0,
            child: MyList(),
          ),
        )
      ),
    );
  }
}

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
//          children: <Widget>[
//            new ListTile(
//              leading: new Icon(Icons.access_time),
//              title: new Text('access_time'),
//            ),
//            new ListTile(
//              leading:new Icon(Icons.account_balance),
//              title:new Text('account_balance')
//            ),
//            new Image.network(
//                'https://static001.geekbang.org/resource/image/01/fd/010a4d14444c1be2c69fb3bd750305fd.jpg'
//            ),
//            new Image.network(
//                'https://static001.geekbang.org/resource/image/01/fd/010a4d14444c1be2c69fb3bd750305fd.jpg',
//              color: Colors.blueAccent,
//              colorBlendMode: BlendMode.colorBurn,
//            ),
//          ],
      /// Axis.horizontal:横向滚动或者叫水平方向滚动
      /// Axis.vertical:纵向滚动或者叫垂直方向滚动
      scrollDirection: Axis.vertical,
      children: <Widget>[
        new Container(
          width:180.0,
          height: 180.0,
          color: Colors.lightBlue,
        ),
        new Container(
          width:180.0,
          height: 180.0,
          color: Colors.amber,
        ),
        new Container(
          width:180.0,
          height: 180.0,
          color: Colors.deepOrange,
        ),
        new Container(
          width:180.0,
          height: 180.0,
          color: Colors.deepPurpleAccent,
        ),
      ],
    );
  }
}