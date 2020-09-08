import 'package:flutter/material.dart';
import 'dart:ui';

class BackdropFilterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BackdropFilterWidget',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Backdrop Filter'),
        ),
        body: FrostedGlassDemo(),
      ),
    );
  }
}

class FrostedGlassDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 重叠的Stack Widget，实现重贴
      body: Stack(
        children: <Widget>[
          // 约束盒子组件，添加额外的限制条件到 child上
          ConstrainedBox(
            //限制条件，可扩展的
            constraints: const BoxConstraints.expand(),
            child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1545738629147&di=22e12a65bbc6c4123ae5596e24dbc5d3&imgtype=0&src=http%3A%2F%2Fpic30.photophoto.cn%2F20140309%2F0034034413812339_b.jpg'),
          ),
          Center(
            // 裁切长方形
            child: ClipRect(
              // 背景滤镜器
              child: BackdropFilter(
                // 图片模糊过滤，横向竖向都设置5.0
                filter: ImageFilter.blur(
                  sigmaX: 5.0,
                  sigmaY: 5.0
                ),
                // 透明控件
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    width: 500.0,
                    height: 700.0,
                    // 盒子装饰器，进行装饰，设置颜色为灰色
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    ),
                    child: Center(
                      child: Text(
                        'JSPang',
                        // 设置比较酷炫的字体
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}