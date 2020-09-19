import 'package:flutter/material.dart';
import 'package:practiceApp/src/05Trip/pages/home_page.dart';
import 'package:practiceApp/src/05Trip/pages/my_page.dart';
import 'package:practiceApp/src/05Trip/pages/search_page.dart';
import 'package:practiceApp/src/05Trip/pages/travel_page.dart';

class TabNavigate extends StatefulWidget {
  @override
  _TabNavigateState createState() => _TabNavigateState();
}

class _TabNavigateState extends State<TabNavigate> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('搜索'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            title: Text('旅拍'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('我的'),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}