import 'package:flutter/material.dart';

class TextFieldWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextFieldWidgetDemo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('TextFieldWidget'),
        ),
        body: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  _LoginFormState createState() => new _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    _nameController.text = '初始组织';
    _nameController.selection =
        TextSelection(baseOffset: 2, extentOffset: _nameController.text.length);
    _nameController.addListener(() {
      print(_nameController.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          autofocus: true,
          focusNode: focusNode1,
          controller: _nameController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: '用户名',
              hintText: '用户名或邮箱',
              prefixIcon: Icon(Icons.person),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue))),
        ),
        TextField(
          focusNode: focusNode2,
          controller: _passwordController,
          decoration: InputDecoration(
              labelText: '密码',
              hintText: '您的登录密码',
              prefixIcon: Icon(Icons.lock),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue))),
          obscureText: true,
        ),
        Builder(builder: (ctx) {
          return Column(
            children: <Widget>[
              RaisedButton(
                  child: Text("移动焦点"),
                  onPressed: () {
                    // 将焦点从第一个TextField移到第二个TextField
                    // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                    // 这是第二种写法

                    // 获取当前上下文的焦点
                    if (null == focusScopeNode) {
                      focusScopeNode = FocusScope.of(context);
                    }

                    if (focusNode1.hasFocus) {
                      focusScopeNode.requestFocus(focusNode2);
                    } else if (focusNode2.hasFocus) {
                      focusScopeNode.requestFocus(focusNode1);
                    }
                  }),
              RaisedButton(
                  child: Text("隐藏键盘"),
                  onPressed: () {
                    // 当所有编辑框都失去焦点时键盘就会收起
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                  })
            ],
          );
        })
      ],
    );
  }
}
