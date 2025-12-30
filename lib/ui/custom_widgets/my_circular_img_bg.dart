import 'package:flutter/material.dart';

class MyCircularImgBg extends StatelessWidget {
  double mWidth ,mHeight;
  String imgPath;

  MyCircularImgBg({this.mWidth=100,this.mHeight=100,required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle, 
          image: DecorationImage(
              image: AssetImage(imgPath))),
      width: mWidth,
      height: mHeight,
    );
  }
}
