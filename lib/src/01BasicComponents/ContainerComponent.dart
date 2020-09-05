import 'package:flutter/material.dart';

class ContainerComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Container',
      home: Scaffold(
        body: Center(
          child: Container(
            child: new Text(
              'container',
              style: TextStyle(fontSize: 40.0),
            ),
            alignment: Alignment.center,
            width: 400.0,
            height: 400.0,
//            color: Colors.lightBlue,
//            padding: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 0.0),
//            margin: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.fromLTRB(20.0, 30.0, 0.0, 0.0),
            // 会和已经设置的 color 属性冲突
            decoration: new BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Colors.lightBlue, Colors.greenAccent, Colors.blueAccent]
              ),
              border: Border.all(
                width: 2.0,
                color: Colors.red
              )
            ),
          ),
        )
      ),
    );
  }
}