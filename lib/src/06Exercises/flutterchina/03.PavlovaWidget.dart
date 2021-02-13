import 'package:flutter/material.dart';

class PavlovaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pavlova',
        home: new Scaffold(
          appBar: new AppBar(
            leading: new Icon(
              Icons.cake,
            ),
            title: new Text('Pavlova'),
          ),
          body: new Center(
            child: new Container(
              // margin: new EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 30.0),
              height: 600.0,
              child: new Card(
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Container(
                      width: 420.0,
                      child: leftColumn(),
                    ),
                    buildImage()
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget leftColumn() {
    var titleText = new Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: new Text(
        'Oeschinen Lake Campground',
        style: new TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0),
      ),
    );

    var subTitle = new Container(
      padding: const EdgeInsets.all(8.0),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. .
        ''',
        // 表示文本是否应在软换行符（例如句点或逗号）之间断开
        softWrap: true,
        textAlign: TextAlign.center,
      ),
    );

    var ratings = new Container(
      padding: const EdgeInsets.all(16.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new Icon(Icons.star, color: Colors.green),
              new Icon(
                Icons.star,
                color: Colors.green,
              ),
              new Icon(
                Icons.star,
                color: Colors.green,
              ),
              new Icon(
                Icons.star_border,
                color: Colors.black,
              ),
              new Icon(
                Icons.star_border,
                color: Colors.black,
              ),
            ],
          ),
          new Text(
            '170 Reviews',
            style: new TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 18.0,
            ),
          )
        ],
      ),
    );

    var descTextStyle = new TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 14.0,
      height: 2.0,
    );

    var iconList = DefaultTextStyle.merge(
        style: descTextStyle,
        child: new Container(
          padding: const EdgeInsets.all(20.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new Column(
                children: [
                  new Icon(Icons.kitchen, color: Colors.green[500]),
                  new Text('PREP:'),
                  new Text('25 min'),
                ],
              ),
              new Column(
                children: [
                  new Icon(Icons.timer, color: Colors.green[500]),
                  new Text('COOK:'),
                  new Text('1 hr'),
                ],
              ),
              new Column(
                children: [
                  new Icon(Icons.restaurant, color: Colors.green[500]),
                  new Text('FEEDS:'),
                  new Text('4-6'),
                ],
              ),
            ],
          ),
        ));

    return new Container(
      padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
      child: new Column(
        children: [titleText, subTitle, ratings, iconList],
      ),
    );
  }

  Widget buildImage() {
    return new Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(16.0)),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        'assets/cake.jpg',
        width: 450.0,
        height: 400.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
