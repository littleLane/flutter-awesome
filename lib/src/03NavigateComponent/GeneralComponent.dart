import 'package:flutter/material.dart';

class GeneralComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '页面导航',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('页面导航'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('查看商品详情页面'),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => new SecondPage()
            ),
          )
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text('商品详情页')),
      body:Center(child:RaisedButton(
        child:RaisedButton(
          child:Text('返回'),
          onPressed: () => Navigator.pop(context),
        )
      ))
    );
  }
}