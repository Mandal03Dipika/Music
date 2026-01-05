import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/domain/ui_helper.dart';

class MyLibraryList extends StatelessWidget {

  bool isLeadingGradient;
  List<Color>? mGradientColors;
  Color? mSolidColor;
  IconData mLeadingIcon;
  Color mLeadingIconColor;
  String mTitle,mSubTitle;

  MyLibraryList({
    this.isLeadingGradient=false,
    this.mGradientColors,
    this.mSolidColor,
    this.mLeadingIcon=Icons.favorite,
    this.mLeadingIconColor=Colors.white,
    required this.mSubTitle,
    required this.mTitle
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 60,
        height: 60,
        child: Icon(mLeadingIcon, color: mLeadingIconColor,),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            color: mSolidColor ?? Color(0xff5E3B7A),
            gradient: isLeadingGradient? LinearGradient(
              colors: mGradientColors ?? [
                Color(0xff4A39EA),
                Color(0xff868AE1),
                Color(0xffB9D4DB),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          ):null
        ),
      ),
      title: Text(mTitle),
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold
      ),
      subtitle: Row(
        children: [
          SvgPicture.asset("assets/svg/Pin.svg",width: 16,height: 16,),
          mSpacer(mHeight: 28),
          Text(mSubTitle),
        ],
      ),
      subtitleTextStyle: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold
      ),
    );
  }
}
