import 'package:flutter/material.dart';

class ExpansionPanelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExpansionPanelList',
      theme: ThemeData.light(),
      home: ExpansionPanelDemo(),
    );
  }
}

class ExpansionPanelDemo extends StatefulWidget {
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  var currentPanelIndex = -1;
  List<int> mList;
  List<ExpandStateBean> expandStateList;

  _ExpansionPanelDemoState() {
    mList = new List();
    expandStateList = new List();

    for (int i = 0; i < 10; i++) {
      mList.add(i);
      expandStateList.add(ExpandStateBean(i, false));
    }
  }

  _setCurrentIndex(int index, isExpand) {
    setState(() {
      expandStateList.forEach((item) {
        if (item.index == index) {
          item.isOpen = !isExpand;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("expansion panel list")
      ),
      //加入可滚动组件
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index,bol){
            //调用内部方法
            _setCurrentIndex(index, bol);
          },
          children: mList.map((index) {
            return ExpansionPanel(
              headerBuilder: (context, isExpanded){
                return ListTile(
                  title:Text('This is No. $index')
                );
                },
                body:ListTile(
                    title:Text('expansion no.$index')
                ),
                isExpanded: expandStateList[index].isOpen
            );
          }).toList(),
        ),
      ),
    );
  }
}

//自定义扩展状态类
class ExpandStateBean{
  var isOpen;
  var index;
  ExpandStateBean(this.index,this.isOpen);
}