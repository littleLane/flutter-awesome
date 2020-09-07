import 'package:flutter/material.dart';

class AssestLoad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'load image',
      home: Scaffold(
        appBar: AppBar(
          title: Text('load image'),
        ),
        body: Container(
          child: Image.asset('lib/assets/11111.png'),
        ),
      ),
    );
  }
}