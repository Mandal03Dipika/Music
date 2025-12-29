import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCustomRoundedBtn extends StatelessWidget {
  VoidCallback onTap;
  double mWidth,mHeight;
  Color bgColor;
  String text;
  String? mIconPath;
  Color textColor;
  bool isOutlined;

  MyCustomRoundedBtn({
    required this.onTap,
    required this.text,
    this.textColor=Colors.black,
    this.mIconPath,
    this.mHeight=50,
    this.mWidth=300,
    this.bgColor=Colors.white,
    this.isOutlined=false
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child:Container(
          width: mWidth,
          height: mHeight,
          child: mIconPath != null? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11.0),
            child: Row(
              children: [
                SvgPicture.asset(mIconPath!, height: 20, width: 20,),
                Expanded(
                    child: Center(
                      child: Text(
                          text,
                          style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 16
                          )
                      ),
                    )
                )
              ],
            ),
          ) : Center(
            child: Text(
                text,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16
                )),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: isOutlined? Colors.transparent : bgColor,
            border: isOutlined? Border.all(
              width: 1,
              color: isOutlined? Colors.white : Colors.transparent
            ):null
          ),
        ),
      );
  }
}
