import 'package:flutter/material.dart';

class LakeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'lake',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Lake'),
        ),
        body: new ListView(
          children: [
            Image.asset(
              'assets/lake.jpeg',
              width: 600.0,
              height: 240.0,
              // 告诉框架，图像应该尽可能小，但覆盖整个渲染框
              fit: BoxFit.cover,
            ),
            buildTitle(),
            new Row(
              // 在一行上平分空间
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButton(context, Icons.phone, 'CALL'),
                buildButton(context, Icons.near_me, 'ROUTE'),
                buildButton(context, Icons.share, 'SHARE'),
              ],
            ),
            buildSection()
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return new Container(
      padding: EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text(
                  'Oeschinen Lake Campground',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              new Text(
                'Kandersteg, Switzerland',
                style: new TextStyle(color: Colors.grey[500]),
              )
            ],
          )),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Container(
            padding: const EdgeInsets.only(left: 2.0),
            child: new Text('41'),
          )
        ],
      ),
    );
  }

  Widget buildButton(BuildContext context, IconData icon, String label) {
    Color color = Theme.of(context).primaryColor;

    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        new Icon(
          icon,
          color: color,
        ),
        new Container(
          padding: const EdgeInsets.only(top: 8.0),
          child: new Text(
            label,
            style: new TextStyle(
                color: color, fontSize: 12.0, fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}

Widget buildSection() {
  return new Container(
    padding: const EdgeInsets.all(32.0),
    child: new Text(
      '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
      // 表示文本是否应在软换行符（例如句点或逗号）之间断开
      softWrap: true,
    ),
  );
}
