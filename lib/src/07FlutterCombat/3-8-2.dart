import 'package:flutter/material.dart';

class ProgressWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProgressWidgetDemo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ProgressWidget'),
        ),
        body: ProgressWidget(),
      ),
    );
  }
}

class ProgressWidget extends StatefulWidget {
  _ProgressWidgetState createState() => new _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(16.0),
              child: Container(
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                      .animate(_animationController),
                  value: _animationController.value,
                ),
              )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
