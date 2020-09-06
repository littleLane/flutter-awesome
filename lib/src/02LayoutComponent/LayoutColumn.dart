import 'package:flutter/material.dart';

class LayoutColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LayoutColums',
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('Layout colums'),
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: Text('I am JSPang'),
            ),
            Text('my website is jspang.com'),
            Expanded(
              child: Text('I love coding'),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}