import 'package:flutter/material.dart';

class IconWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IconWidgetDemo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('IconWidgetDemo'),
        ),
        body: Column(
          children: [
            buildCharsIcon(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.accessible,
                  color: Colors.green,
                ),
                Icon(
                  Icons.error,
                  color: Colors.green,
                ),
                Icon(
                  Icons.fingerprint,
                  color: Colors.green,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildCharsIcon() {
    String icons = "";
// accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
// error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
// fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";

    return Text(
      icons,
      style: TextStyle(
          fontFamily: "MaterialIcons", fontSize: 24.0, color: Colors.green),
    );
  }
}
