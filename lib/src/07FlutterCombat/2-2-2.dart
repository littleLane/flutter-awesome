import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NamedRouteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RouteWidget',
      initialRoute: '/',
      routes: {
        'new_page': (context) => NewRoutePage(),
        'params_page': (context) => NewParamsRoutePage(
              text: ModalRoute.of(context).settings.arguments,
            ),
        '/': (context) => MyHomePage(title: 'Flutter Demo Home Page'),
      },
      // 只会针对命名路由生效
      // 当调用 Navigator.pushNamed(...)打开命名路由时，如果指定的路由名在路由表中已注册，则会调用路由表中的 builder 函数来生成路由组件；
      // 如果路由表中没有注册，才会调用 onGenerateRoute 来生成路由
      // 函数必须返回有效 page，否则会因为返回值无效，而报错
      onGenerateRoute: (RouteSettings setting) {
        return MaterialPageRoute(builder: (context) {
          String routeName = setting.name;
          print('onGenerateRoute: $routeName');

          return LoginPage();
        });
      },
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
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => NewRoutePage()));

                  Navigator.pushNamed(context, 'new_page', arguments: 'lane');
                },
              ),
              RaisedButton(
                  child: Text("打开提示页"),
                  onPressed: () async {
                    // 打开`TipRoute`，并等待返回结果
                    // var result = await Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return NewParamsRoutePage(
                    //         // 路由参数
                    //         text: "我是提示xxxx",
                    //       );
                    //     },
                    //   ),
                    // );

                    var result = await Navigator.pushNamed(
                        context, 'params_page1',
                        arguments: '我是提示 Named');
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
    var args = ModalRoute.of(context).settings.arguments;

    print('命名路由获取参数：$args');

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

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('login'),
      ),
      body: Center(child: Builder(
        builder: (context) {
          Scaffold parentScaffold =
              context.findAncestorWidgetOfExactType<Scaffold>();
          print((parentScaffold.appBar as AppBar).title);

          return new Text('login');
        },
      )),
    );
  }
}
