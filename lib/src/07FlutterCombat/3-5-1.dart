import 'package:flutter/material.dart';

class ImageWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ImageWidgetDemo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ImageWidget'),
        ),
        body: ListView(
          children: [
            buildNetworkImage(),
            buildNetwork(),
            buildFitFill(),
            buildFitContain(),
            buildFitCover(),
            buildFitWidth(),
            buildFitHeight(),
            buildFitScaledown(),
            buildFitNone(),
            buildBlendMode(),
            buildImageRepeat()
          ],
        ),
      ),
    );
  }

  Widget buildNetwork() {
    return Container(
      width: 200.0,
      height: 100.0,
      child: Image.network(
        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
      ),
    );
  }

  Widget buildNetworkImage() {
    return Container(
      width: 200.0,
      height: 100.0,
      child: Image.network(
        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
      ),
    );
  }

  // 会拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形
  Widget buildFitFill() {
    return Container(
      width: 200.0,
      height: 100.0,
      child: Image.network(
        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
        fit: BoxFit.fill,
      ),
    );
  }

  // 这是图片的默认适应规则，图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形
  Widget buildFitContain() {
    return Container(
      width: 200.0,
      height: 100.0,
      child: Image.network(
        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
        fit: BoxFit.contain,
      ),
    );
  }

  // 会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁
  Widget buildFitCover() {
    return Container(
      width: 200.0,
      height: 100.0,
      child: Image.network(
        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
        fit: BoxFit.cover,
      ),
    );
  }

  // 图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁
  Widget buildFitWidth() {
    return Container(
      width: 200.0,
      height: 100.0,
      child: Image.network(
        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
        fit: BoxFit.fitWidth,
      ),
    );
  }

  // 图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁
  Widget buildFitHeight() {
    return Container(
      width: 200.0,
      height: 100.0,
      child: Image.network(
        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget buildFitScaledown() {
    return Container(
      width: 200.0,
      height: 100.0,
      child: Image.network(
        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
        fit: BoxFit.scaleDown,
      ),
    );
  }

  // 图片没有适应策略，会在显示空间内显示图片，如果图片比显示空间大，则显示空间只会显示图片中间部分
  Widget buildFitNone() {
    return Container(
      width: 200.0,
      height: 100.0,
      child: Image.network(
        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
        fit: BoxFit.none,
      ),
    );
  }

  Widget buildBlendMode() {
    return Container(
      width: 200.0,
      height: 100.0,
      child: Image.network(
        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
        color: Colors.blue,
        colorBlendMode: BlendMode.difference,
      ),
    );
  }

  Widget buildImageRepeat() {
    return Container(
      width: 200.0,
      height: 100.0,
      child: Image.network(
        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
        width: 100.0,
        repeat: ImageRepeat.repeatX,
      ),
    );
  }
}
