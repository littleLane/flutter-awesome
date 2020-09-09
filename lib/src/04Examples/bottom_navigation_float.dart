import 'package:flutter/material.dart';
import 'each_view.dart';

class BottomNavigationFloat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BottomNavigationFloat',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      home: BottomNavigateBar(),
    );
  }
}

class BottomNavigateBar extends StatefulWidget {
  _BottomNavigateBarState createState() => _BottomNavigateBarState();
}

class _BottomNavigateBarState extends State<BottomNavigateBar> {
  List<Widget> _eachView;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _eachView = List();
    _eachView
      ..add(EachView('Home'))
      ..add(EachView('Me'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _eachView[_index],
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return EachView('New Page');
            })
          ),
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home
              ),
              color: Colors.white,
              onPressed: () => {
                setState(() {
                  _index = 0;
                }),
              },
            ),
            IconButton(
              icon:Icon(Icons.airport_shuttle),
              color:Colors.white,
              onPressed:() => {
                setState(() {
                  _index = 1;
                }),
              }
            )
          ],
        ),
      ),
    );
  }
}