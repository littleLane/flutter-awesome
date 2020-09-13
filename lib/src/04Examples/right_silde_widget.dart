import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RightSildeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RightSildeWidget',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: RightBackDemo(),
    );
  }
}

class RightBackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Container(
          width: 100.0,
          height: 100.0,
          color: CupertinoColors.lightBackgroundGray,
          child: CupertinoButton(
            child: Icon(CupertinoIcons.add, size: 40.0),
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (BuildContext context) {
                    return RightBackDemo();
                  }
                )
              );
            },
          ),
        ),
      ),
    );
  }
}