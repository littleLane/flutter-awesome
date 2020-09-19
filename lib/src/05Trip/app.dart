import 'package:flutter/material.dart';
import 'package:practiceApp/src/05Trip/tab_navigate.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '携程旅行',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabNavigate(),
    );
  }
}