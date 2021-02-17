import 'package:flutter/material.dart';

class TapboxBWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TapboxAWidget',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('父Widget管理子Widget的状态'),
        ),
        body: ParentWidgetState(),
      ),
    );
  }
}

class ParentWidgetState extends StatefulWidget {
  ParentWidgetState({Key key}) : super(key: key);

  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidgetState> {
  bool _active = false;

  void _handleChange(newVal) {
    setState(() {
      _active = newVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxB(
        active: _active,
        onChange: _handleChange,
      ),
    );
  }
}

class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChange})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChange;

  void _handleTap() {
    onChange(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
            color: active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
      onTap: _handleTap,
    );
  }
}
