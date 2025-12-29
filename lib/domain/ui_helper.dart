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