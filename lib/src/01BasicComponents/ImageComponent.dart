import 'package:flutter/material.dart';

/// 加载图片的四种方式
/// 1、Image.asset：加载资源图片，也就是加载项目资源目录中的图片,加入图片后会增大打包的包体体积，用的是相对路径。
/// 2、Image.network：网络资源图片，意思就是你需要加入一段 http://xxxx.xxx的这样的网络路径地址。
/// 3、Image.file：加载本地图片，就是加载本地文件中的图片，这个是一个绝对路径，跟包体无关。
/// 4、Image.memory：加载 Uint8List 资源图片

class ImageComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Widget',
      home: Scaffold(
        body: Center(
          child: Container(
            child: new Image.network(
              'https://tse1-mm.cn.bing.net/th/id/OIP.snmk3r72JlDpfRdiwmeZ3wHaCt?pid=Api&rs=1',
              scale: 1.0,

              /// BoxFit.fill：全图显示，图片会被拉伸，并充满父容器
              /// BoxFit.contain：全图显示，显示原比例，可能会有空隙
              /// BoxFit.cover：显示可能拉伸，可能裁切，充满（图片要充满整个容器，还不变形）
              /// BoxFit.fitWidth：宽度充满（横向充满），显示可能拉伸，可能裁切
              /// BoxFit.fitHeight ：高度充满（竖向充满）,显示可能拉伸，可能裁切
              /// BoxFit.scaleDown：效果和contain差不多，但是此属性不允许显示超过源图片大小，可小不可大
              fit: BoxFit.contain,
              color: Colors.greenAccent,
              colorBlendMode: BlendMode.darken,

              /// ImageRepeat.repeat : 横向和纵向都进行重复，直到铺满整个画布
              /// ImageRepeat.repeatX: 横向重复，纵向不重复
              /// ImageRepeat.repeatY：纵向重复，横向不重复
              repeat: ImageRepeat.repeat,
            ),
            width: 300.0,
            height: 200.0,
            color: Colors.lightBlue,
          ),
        ),
      ),
    );
  }
}