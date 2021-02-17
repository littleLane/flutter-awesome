import 'package:flutter/material.dart';

class TapboxCWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TapboxC',
      home: Scaffold(
        appBar: AppBar(
          title: new Text('混合状态管理'),
        ),
        body: ParentWidgetState(),
      ),
    );
  }
}

class ParentWidgetState extends StatefulWidget {
  _ParnetWidgetState createState() => new _ParnetWidgetState();
}

class _ParnetWidgetState extends State<ParentWidgetState> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxWidgetState(
        active: _active,
        onChange: _handleTapboxChanged,
      ),
    );
  }
}

class TapboxWidgetState extends StatefulWidget {
  TapboxWidgetState({Key key, this.active: false, @required this.onChange})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChange;

  _TapboxWidgetState createState() => _TapboxWidgetState();
}

class _TapboxWidgetState extends State<TapboxWidgetState> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChange(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // 在按下时添加绿色边框，当抬起时，取消高亮
    return new GestureDetector(
      child: new Container(
        child: new Center(
          child: new Text(widget.active ? 'Active' : 'Inactive',
              style: new TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? new Border.all(
                  color: Colors.teal[700],
                  width: 10.0,
                )
              : null,
        ),
      ),
      onTapDown: _handleTapDown, // 处理按下事件
      onTapUp: _handleTapUp, // 处理抬起事件
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
    );
  }
}
