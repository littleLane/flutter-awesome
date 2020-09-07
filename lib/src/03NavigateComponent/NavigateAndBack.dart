import 'package:flutter/material.dart';

class NavigateAndBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NavigateAndBack',
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('要电话'),
      ),
      body: Center(
        child: RouteButton(),
      ),
    );
  }
}

class RouteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('找小姐姐'),
      onPressed: () => {
        _navigateTo(context)
      },
    );
  }

  _navigateTo(BuildContext context) async {
    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => Xiaojiejie()));
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result'),));
  }
}

class Xiaojiejie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('小姐姐'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('大长腿小姐姐'),
              onPressed: () => {
                Navigator.pop(context, '大长腿:1511008888')
              },
            ),
            RaisedButton(
              child: Text('小蛮腰小姐姐'),
              onPressed: () => {
                Navigator.pop(context, '大长腿:1511009999')
              },
            ),
          ],
        ),
      ),
    );
  }
}