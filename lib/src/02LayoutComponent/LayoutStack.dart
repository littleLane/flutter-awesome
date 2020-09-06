import 'package:flutter/material.dart';

class LayoutStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stack = new Stack(
      alignment: const FractionalOffset(0.5, 0.8),
      children: <Widget>[
        new CircleAvatar(
          backgroundImage: new NetworkImage('https://tse1-mm.cn.bing.net/th/id/OIP.snmk3r72JlDpfRdiwmeZ3wHaCt?pid=Api&rs=1'),
          radius: 100.0,
        ),
        new Container(
          decoration: new BoxDecoration(
            color: Colors.lightBlue
          ),
          padding: EdgeInsets.all(5.0),
          child: new Text('Layout Stack'),
        ),

        /// Positioned 指定元素的宽高、位置信息
        new Positioned(
          top:10.0,
          left:10.0,
          child: new Text('JSPang.com'),
        ),
        new Positioned(
          bottom:10.0,
          right:10.0,
          child: new Text('技术胖'),
        )
      ],
    );

    return MaterialApp(
      title: 'LayoutStack',
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('Layout Stack'),
        ),
        body: Center(child: stack),
      ),
    );
  }
}