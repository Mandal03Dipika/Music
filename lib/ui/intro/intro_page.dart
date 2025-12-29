import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/domain/app_colors.dart';
import 'package:music_app/domain/app_routes.dart';
import 'package:music_app/domain/ui_helper.dart';
import 'package:music_app/ui/custom_widgets/my_custom_rounded_btn.dart';

class IntroPage extends StatelessWidget{
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            Image.asset('assets/images/intro_bg.png'),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.blackColor.withOpacity(0.3),
                      AppColors.blackColor
                    ]
                )
              ),
            ),
            bottomLoginUI(context)
          ],
        ),
      ),
    );
  }

  Widget bottomLoginUI(BuildContext context) => Container(
    padding: EdgeInsets.only(bottom: 50),
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/logo/Logo.svg",
          width: 50,
          height: 50,
        ),
        mSpacer(),
        Text('Million of songs.\nFree on Spotify.',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25),
            textAlign: TextAlign.center
        ),
        mSpacer(),
        MyCustomRoundedBtn(
          text: "Sign Up Free",
          bgColor: AppColors.primaryColor,
          onTap: (){
            Navigator.pushReplacementNamed(context, AppRoutes.create_account_page);
          },
        ),
        mSpacer(),
        MyCustomRoundedBtn(
          isOutlined: true,
          text: "Continue with Google",
          mIconPath: "assets/logo/Component 38.svg",
          bgColor: AppColors.primaryColor,
          textColor: Colors.white,
          onTap: (){

          },
        ),
        mSpacer(),
        MyCustomRoundedBtn(
          isOutlined: true,
          text: "Continue with Facebook",
          mIconPath: "assets/logo/facebook.svg",
          bgColor: AppColors.primaryColor,
          textColor: Colors.white,
          onTap: (){

          },
        ),
        mSpacer(),
        MyCustomRoundedBtn(
          isOutlined: true,
          text: "Continue with Apple",
          mIconPath: "assets/logo/Vector5.svg",
          bgColor: AppColors.primaryColor,
          textColor: Colors.white,
          onTap: (){

          },
        ),
        TextButton(
            onPressed: (){},
            child: Text('Login',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
            )
        )
      ],
    ),
  );

}