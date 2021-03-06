import 'package:flutter/material.dart';

class TooltipWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TooltipWidget',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: ToolTipDemo(),
    );
  }
}

class ToolTipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('tool tips demo')
      ),
      body: Center(
        child: Tooltip(
          message: '不要碰我，我怕痒',
          child: Icon(Icons.all_inclusive),
        ),
      )
    );
  }
}