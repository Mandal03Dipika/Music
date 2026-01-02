import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/domain/app_colors.dart';

Widget mSpacer({
  double mHeight=11,
  double mWidth=11
})=>SizedBox(
  height: mHeight,
  width: mWidth,
);

InputDecoration getCreateAccTextFieldDecoration()=>InputDecoration(
  filled: true,
  fillColor: AppColors.greyColor,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(11)
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(11),
    borderSide: BorderSide(
      color: AppColors.primaryColor,
      width: 2
    )
  )
);

InputDecoration getSearchTextFieldDecoration({
  IconData mIcon=Icons.search,
  Color bgColor=Colors.white,
  String mText="Search"
})=>InputDecoration(
    filled: true,
    fillColor: bgColor,
    hintText: mText,
    prefixIcon: Icon(mIcon),
    hintStyle: TextStyle(color: AppColors.secondaryBlackColor),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(11)
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(11)
    )
);