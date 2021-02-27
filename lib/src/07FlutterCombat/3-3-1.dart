import 'package:flutter/material.dart';

class TextWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextWidget',
      home: Scaffold(
        appBar: AppBar(
          title: new Text('TextWidget'),
        ),
        body: Column(
          children: [
            Text(
              'Hello World1',
              textAlign: TextAlign.left,
            ),
            Text(
              'Hello World2' * 10,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Hello World3',
              // 文本的缩放比例
              textScaleFactor: 1.5,
            ),
            Text(
              'Hello World4',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  // 文本行高，fontSize * height
                  height: 1.5,
                  fontFamily: 'Courier',
                  background: new Paint()..color = Colors.yellow,
                  decoration: TextDecoration.lineThrough,
                  decorationStyle: TextDecorationStyle.dotted,
                  decorationColor: Colors.red),
            ),
            Text.rich(TextSpan(children: [
              TextSpan(text: 'home: '),
              TextSpan(
                text: "https://flutterchina.club",
                style: TextStyle(color: Colors.blue),
              )
            ])),
            DefaultTextStyle(
                // 设置文本默认样式
                style: TextStyle(color: Colors.yellow, fontSize: 20.0),
                textAlign: TextAlign.start,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("hello world"),
                    Text("I am Jack"),
                    Text(
                      "I am Jack",
                      style: TextStyle(
                          inherit: false, //2.不继承默认样式
                          color: Colors.grey),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
