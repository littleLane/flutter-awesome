import 'package:flutter/material.dart';

import 'package:practiceApp/src/05Trip/dao/home_dao.dart';
import 'package:practiceApp/src/05Trip/model/home_model.dart';
import 'package:practiceApp/src/05Trip/widgets/grid_nav.dart';

import 'package:practiceApp/src/05Trip/widgets/home_page_swiper.dart';
import 'package:practiceApp/src/05Trip/widgets/local_nav.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _appBarAlpha = 0;
  HomeModel homeData;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _onScroll(double offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;

    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }

    setState(() {
      _appBarAlpha = alpha;
    });
  }

  _loadData() async {
    // HomeDao.fetchHomeData().then((result) => {
    //   setState(() {
    //     resultString = convert.json.encode(result);
    //   })
    // }).catchError((e) => {
    //   setState(() {
    //     resultString = e.toString();
    //   })
    // });

    try {
      HomeModel dataModel = await HomeDao.fetchHomeData();
      
      setState(() {
        homeData = dataModel;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: Stack(
        children: <Widget>[
          NotificationListener(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollUpdateNotification &&
                  scrollNotification.depth == 0) {
                // 滚动且列表滚动的时候
                _onScroll(scrollNotification.metrics.pixels);
              }
            },
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView(
                children: <Widget>[
                  HomePageSwiper(imgUrls: homeData == null ? [] : homeData.bannerList),
                  Padding(
                    padding: EdgeInsets.fromLTRB(7, 4, 7, 4), 
                    child: LocalNav(localNavList: homeData == null ? [] : homeData.localNavList),
                  ),
                  GridNav(gridNavModel: homeData == null ? [] : homeData.gridNav)
                ],
              ),
            )
          ),
          Opacity(
            opacity: _appBarAlpha,
            child: Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text('首页'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
