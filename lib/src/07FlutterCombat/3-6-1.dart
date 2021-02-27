import 'package:flutter/material.dart';

class SwitchAndCheckBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SwitchAndCheckBoxWidget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SwitchAndCheckBoxWidget'),
        ),
        body: SwitchAndCheckBox(),
      ),
    );
  }
}

class SwitchAndCheckBox extends StatefulWidget {
  _SwitchAndCheckBoxState createState() => new _SwitchAndCheckBoxState();
}

class _SwitchAndCheckBoxState extends State<SwitchAndCheckBox> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Switch(
            value: _switchSelected,
            onChanged: (value) {
              setState(() {
                _switchSelected = value;
              });
            }),
        Checkbox(
            value: _checkboxSelected,
            onChanged: (value) {
              setState(() {
                _checkboxSelected = value;
              });
            })
      ],
    );
  }
}
