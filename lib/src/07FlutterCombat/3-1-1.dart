import 'package:flutter/material.dart';

class CounterCycleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CounterCycleWidget',
      home: BuildWidget(),
    );
  }
}

class BuildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return CounterWidget();
    return Text('haha');
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key key, this.initialValue: 0});

  final int initialValue;

  @override
  _CounterWidgetState createState() => new _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;

  // 当 Widget 第一次插入到 Widget 树时会被调用
  // 对于每一个 State 对象，Flutter framework 只会调用一次该回调
  // 通常在该回调中做一些一次性的操作，如状态初始化、订阅子树的事件通知等
  @override
  void initState() {
    super.initState();
    _counter = widget.initialValue;
    print('initState');
  }

  // 主要用于构建 Widget 子树
  // 调用场景：
  // 1、在调用initState()之后
  // 2、在调用didUpdateWidget()之后
  // 3、在调用setState()之后
  // 4、在调用didChangeDependencies()之后
  // 5、在State对象从树中一个位置移除后（会调用deactivate）又重新插入到树的其它位置之后
  @override
  Widget build(BuildContext context) {
    print('build');

    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('$_counter'),
          onPressed: () => setState(() => ++_counter),
        ),
      ),
    );
  }

  // 在 widget重新构建时，Flutter framework会调用 Widget.canUpdate检测 Widget树中同一位置的新旧节点，然后决定是否需要更新，
  // 如果 Widget.canUpdate返回true则会调用此回调
  // Widget.canUpdate会在新旧widget的key和runtimeType同时相等时会返回true，也就是说在新旧widget的key和runtimeType同时相等时didUpdateWidget()就会被调用
  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  // 当State对象从树中被移除时，会调用此回调
  // 在一些场景下，Flutter framework会将State对象重新插到树中，如包含此State对象的子树在树的一个位置移动到另一个位置时（可以通过GlobalKey来实现）
  // 如果移除后没有重新插入到树中则紧接着会调用dispose()方法。
  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }

  // 当State对象从树中被永久移除时调用；
  // 通常在此回调中释放资源
  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  // 此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，
  // 此回调在Release模式下永远不会被调用
  @override
  void reassemble() {
    super.reassemble();
    print('reassemble');
  }

  // 当State对象的依赖发生变化时会被调用
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }
}
