import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:practiceApp/src/widget/glass_widget.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../widget/glass_widget.dart';

class Glassmorphic extends StatelessWidget {
  static final String title = '体能+';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: GlassmorphicWidget(),
    );
  }
}

class GlassmorphicWidget extends StatefulWidget {
  @override
  State<GlassmorphicWidget> createState() => GlassmorphicWidgetState();
}

class GlassmorphicWidgetState extends State<GlassmorphicWidget> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              'assets/bg.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              scale: 1,
            ),
            SafeArea(
                child: Center(
              child: GlassWidget(
                  width: width * 0.9,
                  height: height,
                  borderRadius: 30,
                  blur: 20,
                  linearGradientBeginOpacity: 0.3,
                  linearGradientEndOpacity: 0.2,
                  borderGradientBeginOpacity: 0.5,
                  borderGradientEndOpacity: 0.02,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        buildUser(),
                        buildInfo(),
                        SizedBox(
                          height: 30,
                        ),
                        buildProgress(),
                        buildMessage(),
                        buildWork(),
                        buildBottom(),
                      ],
                    ),
                  )),
            ))
          ],
        ),
      ),
    );
  }

  Widget buildUser() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [buildName(), buildPic()],
      );

  Widget buildName() => Container(
        padding: EdgeInsets.only(left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '星期五',
              style: TextStyle(
                  color: Color(0xFFeb3c63),
                  fontSize: 30,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              '波比boy',
              style: TextStyle(
                  color: Color(0xFFef7079),
                  fontSize: 20,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      );

  Widget buildPic() => Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Container(
          padding: EdgeInsets.all(5),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFec445b).withOpacity(0.8),
                    Color(0xFFfbb055).withOpacity(0.8)
                  ])),
          child: Container(
            width: 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage('assets/head.jpg'))),
          ),
        ),
      );

  Widget buildInfo() => Container(
        padding: EdgeInsets.only(top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildInfoItem('身高', ' 180'),
            buildInfoItem('体重', ' 70'),
            buildInfoItem('大卡', ' 280')
          ],
        ),
      );

  Widget buildInfoItem(String text1, String text2) => Center(
        child: GlassWidget(
          width: 108,
          height: 50,
          borderRadius: 5,
          blur: 10,
          linearGradientBeginOpacity: 0.4,
          linearGradientEndOpacity: 0.4,
          borderGradientBeginOpacity: 0.5,
          borderGradientEndOpacity: 0.1,
          child: Center(
            child: RichText(
              text: TextSpan(
                text: text1,
                style: TextStyle(
                  color: Color(0xff757575),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                children: [
                  TextSpan(
                    text: text2,
                    style: TextStyle(
                      color: Color(0xFFe82c5c),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );

  Widget buildProgress() => SleekCircularSlider(
        innerWidget: (double value) => Center(
          child: buildCenterInfo(),
        ),
        appearance: CircularSliderAppearance(
          startAngle: 0,
          angleRange: 500,
          size: 250,
          customColors: CustomSliderColors(
            trackColor: Color(0xffffffff).withOpacity(0.5),
            progressBarColors: [
              Color(0xfffec753),
              Color(0xfff16d58),
            ],
            shadowColor: Color(0xffffffff).withOpacity(0.1),
          ),
          customWidths: CustomSliderWidths(
            progressBarWidth: 30,
            trackWidth: 30,
          ),
        ),
      );

  Widget buildCenterInfo() => GlassWidget(
        width: 130,
        height: 130,
        borderRadius: 65,
        blur: 10,
        linearGradientBeginOpacity: 0.6,
        linearGradientEndOpacity: 0.4,
        borderGradientBeginOpacity: 0.2,
        borderGradientEndOpacity: 0.05,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '6550',
                style: TextStyle(
                  color: Color(0xfff26a5a).withOpacity(0.9),
                  fontSize: 30,
                  letterSpacing: -2,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '步数',
                style: TextStyle(
                  color: Color(0xfff79056).withOpacity(0.9),
                  fontSize: 15,
                  letterSpacing: -2,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildMessage() => Container(
        padding: EdgeInsets.only(top: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildMessageItem('assets/heart.png', '心跳'),
            buildMessageItem('assets/water.png', '补水'),
            buildMessageItem('assets/moon.png', '睡眠')
          ],
        ),
      );
  Widget buildMessageItem(String image, String text) => Center(
        child: GlassWidget(
            width: 108,
            height: 110,
            borderRadius: 10,
            blur: 10,
            linearGradientBeginOpacity: 0.4,
            linearGradientEndOpacity: 0.4,
            borderGradientBeginOpacity: 0.5,
            borderGradientEndOpacity: 0.1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    image,
                    height: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        color: Color(0xff535353),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )),
      );
  Widget buildWork() => Container(
        padding: EdgeInsets.only(top: 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildWorkItem('assets/workout.png', '健身日程'),
            buildWorkItem('assets/diet.png', '健康饮食'),
          ],
        ),
      );
  Widget buildWorkItem(String image, String text) => Center(
        child: GlassWidget(
          width: 164,
          height: 60,
          borderRadius: 10,
          blur: 10,
          linearGradientBeginOpacity: 0.4,
          linearGradientEndOpacity: 0.4,
          borderGradientBeginOpacity: 0.5,
          borderGradientEndOpacity: 0.1,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  height: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  text,
                  style: TextStyle(
                      color: Color(0xff535353),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      );
  Widget buildBottom() => Container(
        margin: EdgeInsets.only(top: 23),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.calendar_today,
                color: Color(0xffe82c5c),
              ),
              onPressed: null,
            ),
            IconButton(
              icon: Icon(Icons.person_pin),
              onPressed: null,
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: null,
            ),
            IconButton(
              icon: Icon(Icons.filter_drama),
              onPressed: null,
            )
          ],
        ),
      );
}
