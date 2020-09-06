import 'package:flutter/material.dart';

class LayoutRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LayoutRow',
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('水平方向布局'),
        ),
        body: new Row(
          // 非灵活横向布局
//          children: <Widget>[
//            new RaisedButton(
//              onPressed: () {},
//              color: Colors.redAccent,
//              child: new Text('红色按钮'),
//            ),
//            new RaisedButton(
//              onPressed: () {},
//              color: Colors.orangeAccent,
//              child: new Text('橙色按钮'),
//            ),
//            new RaisedButton(
//              onPressed: () {},
//              color: Colors.pinkAccent,
//              child: new Text('粉色按钮'),
//            ),
//          ],

          // 灵活横向布局
//          children: <Widget>[
//            Expanded(
//              child: new RaisedButton(
//                onPressed: () {},
//                color: Colors.redAccent,
//                child: new Text('红色按钮'),
//              )
//            ),
//            Expanded(
//              child: new RaisedButton(
//                onPressed: () {},
//                color: Colors.orangeAccent,
//                child: new Text('橙色按钮'),
//              )
//            ),
//            Expanded(
//              child: new RaisedButton(
//                onPressed: () {},
//                color: Colors.pinkAccent,
//                child: new Text('粉色按钮'),
//              )
//            ),
//          ],
          children: <Widget>[
            new RaisedButton(
              onPressed: () {},
              color: Colors.redAccent,
              child: new Text('红色按钮'),
            ),
            Expanded(
              child: new RaisedButton(
                onPressed: () {},
                color: Colors.orangeAccent,
                child: new Text('橙色按钮'),
              )
            ),
            Expanded(
              child: new RaisedButton(
                onPressed: () {},
                color: Colors.pinkAccent,
                child: new Text('粉色按钮'),
              )
            ),
          ],
        ),
      ),
    );
  }
}