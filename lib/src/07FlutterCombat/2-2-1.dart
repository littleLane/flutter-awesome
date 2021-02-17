import 'package:flutter/material.dart';

class RouteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RouteWidget',
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _count = 0;

  void _incrementCounter() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'You have pushed the button this many times:',
              ),
              new Text(
                '$_count',
                style: Theme.of(context).textTheme.headline4,
              ),
              FlatButton(
                child: Text("open new route"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewRoutePage()));
                },
              ),
              RaisedButton(
                  child: Text("打开提示页"),
                  onPressed: () async {
                    // 打开`TipRoute`，并等待返回结果
                    var result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return NewParamsRoutePage(
                            // 路由参数
                            text: "我是提示xxxx",
                          );
                        },
                      ),
                    );
                    //输出`TipRoute`路由返回结果
                    print("路由返回值: $result");
                  })
            ],
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        ));
  }
}

// 普通的新路由页面
class NewRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("New route page"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

// 带参数的路由页面
class NewParamsRoutePage extends StatelessWidget {
  NewParamsRoutePage({Key key, @required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('提示'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                child: Text("返回"),
                onPressed: () => Navigator.pop(context, "我是返回值"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
