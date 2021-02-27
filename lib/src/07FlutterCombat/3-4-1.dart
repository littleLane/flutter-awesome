import 'package:flutter/material.dart';

class ButtonWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ButtonWidgetDemo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ButtonWidgetDemo'),
        ),
        body: Column(
          children: [
            // "漂浮"按钮，它默认带有阴影和灰色背景。按下后，阴影会变大
            RaisedButton(
              child: Text('normal'),
              onPressed: () => {},
            ),

            // 扁平按钮，默认背景透明并不带阴影。按下后，会有背景色
            FlatButton(
              child: Text('normal'),
              onPressed: () => {},
            ),

            // 默认有一个边框，不带阴影且背景透明。
            // 按下后，边框颜色会变亮、同时出现背景和阴影(较弱)
            OutlineButton(child: Text('normal'), onPressed: () => {}),

            // 一个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景
            IconButton(icon: Icon(Icons.thumb_up), onPressed: () => {}),

            RaisedButton.icon(
              icon: Icon(Icons.send),
              label: Text('normal'),
              onPressed: () => {},
            ),

            OutlineButton.icon(
              icon: Icon(Icons.add),
              label: Text("添加"),
              onPressed: () => {},
            ),

            FlatButton.icon(
              icon: Icon(Icons.info),
              label: Text("详情"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
