import 'package:flutter/material.dart';

class FormWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FormWidgetDemo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('FormWidgetDemo'),
        ),
        body: FormRoute(),
      ),
    );
  }
}

class FormRoute extends StatefulWidget {
  @override
  _FormRouteState createState() => new _FormRouteState();
}

class _FormRouteState extends State<FormRoute> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: _nameController,
                decoration: InputDecoration(
                    labelText: 'username',
                    hintText: 'username or email',
                    icon: Icon(Icons.person)),
                validator: (v) {
                  return v.trim().length > 0 ? null : 'username is required!';
                },
              ),
              TextFormField(
                controller: _pwdController,
                decoration: InputDecoration(
                    labelText: 'password',
                    hintText: 'your password',
                    icon: Icon(Icons.lock)),
                obscureText: true,
                validator: (v) {
                  return v.trim().length > 5
                      ? null
                      : 'length of password must >= 6';
                },
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Builder(
                        builder: (context) {
                          return RaisedButton(
                            padding: EdgeInsets.all(15.0),
                            child: Text('login'),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            onPressed: () {
                              // if ((_formKey.currentState as FormState)
                              //     .validate()) {
                              //   print('pass');
                              // }

                              if (Form.of(context).validate()) {
                                print('pass');
                              }
                            },
                          );
                        },
                      ))
                    ],
                  )),
            ],
          )),
    );
  }
}
