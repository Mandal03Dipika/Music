import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/domain/app_colors.dart';
import 'package:music_app/domain/app_routes.dart';
import 'package:music_app/domain/ui_helper.dart';
import 'package:music_app/ui/custom_widgets/my_custom_rounded_btn.dart';

class CreateAccountPage extends StatefulWidget {

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  int selectedIndex=0;
  List<Widget> allSteps=[];
  bool isPP1Selected=false, isPP2Selected=false;

  @override
  void initState() {
    super.initState();
    allSteps=[stepOneUI(),stepTwoUI(),stepThreeUI(),stepFourUI()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        centerTitle: true,
        title: Text("Create Account",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        leading: InkWell(
          onTap: (){
            if(selectedIndex>0)
              {
                selectedIndex--;
                setState(() {

                });
              }
            else{
                // Navigator.pop(context);
              Navigator.pushReplacementNamed(context, AppRoutes.intro_page);
              }
          },
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SvgPicture.asset("assets/svg/Left.svg",
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          children: [
            allSteps[selectedIndex],
            mSpacer(),
            Padding(
              padding: EdgeInsets.only(bottom: selectedIndex<3? 0 : 50),
              child: MyCustomRoundedBtn(
                onTap: ()
                {
                  if(selectedIndex<3){
                    selectedIndex++;
                    setState(() {

                    });
                  }
                  else{
                    Navigator.pushNamed(context, AppRoutes.choose_artist_page);
                  }
                },
                text: selectedIndex<3?"Next":"Create an account",
                mWidth: selectedIndex<3?100:180,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget stepOneUI()=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("What\'s your email?",
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25),),
      TextField(
        style: TextStyle(
            color: Colors.white,
            fontSize: 20
        ),
        cursorColor: Colors.white,
        decoration: getCreateAccTextFieldDecoration(),
      ),
      mSpacer(
        mHeight:7,
      ),
      Text("You\'ll need to confirm this email later.",
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15),
      ),
    ],
  );

  Widget stepTwoUI()=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Create a password",
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25),),
      TextField(
        style: TextStyle(
            color: Colors.white,
            fontSize: 20
        ),
        cursorColor: Colors.white,
        decoration: getCreateAccTextFieldDecoration(),
      ),
      mSpacer(
        mHeight:7,
      ),
      Text("Use atleast 8 characters.",
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15),
      ),
    ],
  );

  Widget stepThreeUI()=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("What\'s your gender?",
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25),
      ),
      mSpacer(),
      Wrap(
        runAlignment: WrapAlignment.spaceEvenly,
        runSpacing: 11,
        spacing: 11,
        children: [
          MyCustomRoundedBtn(
            mWidth: 100,
            mHeight: 34,
            isOutlined: true,
            textColor: Colors.white,
            text: "Male",
            bgColor: AppColors.primaryColor,
            onTap: (){

            },
          ),
          MyCustomRoundedBtn(
            mWidth: 100,
            mHeight: 34,
            isOutlined: true,
            textColor: Colors.white,
            text: "Female",
            bgColor: AppColors.primaryColor,
            onTap: (){

            },
          ),
          MyCustomRoundedBtn(
            mWidth: 160,
            mHeight: 34,
            isOutlined: true,
            textColor: Colors.white,
            text: "Not prefer to say",
            bgColor: AppColors.primaryColor,
            onTap: (){

            },
          ),
          MyCustomRoundedBtn(
            mWidth: 100,
            mHeight: 34,
            isOutlined: true,
            textColor: Colors.white,
            text: "Other",
            bgColor: AppColors.primaryColor,
            onTap: (){

            },
          ),
        ],
      ),
    ],
  );

  Widget stepFourUI()=>Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("What\'s your name?",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25),),
        TextField(
          style: TextStyle(
              color: Colors.white,
              fontSize: 20
          ),
          cursorColor: Colors.white,
          decoration: getCreateAccTextFieldDecoration(),
        ),
        mSpacer(
          mHeight:7,
        ),
        Text("This appears on your spotify profile.",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
        mSpacer(
          mHeight: 21
        ),
        Divider(color: AppColors.greyColor,height: 5,),
        mSpacer(mHeight: 21),
        Text("By tapping on \"Create Account\", you agree to the Spotify\'s Terms of Use.",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17),
        ),
        mSpacer(mHeight: 21),
        Text("Terms of Use",
          style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 17),
        ),
        mSpacer(mHeight: 21),
        Text("To learn more data how Spotify collect, uses, shares and protects your personal data. Please see the Spotify Privacy Policy.",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17),
        ),
        mSpacer(mHeight: 21),
        Text("Privacy Policy",
          style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 17),
        ),
        mSpacer(mHeight: 21),
        RadioListTile.adaptive(
          controlAffinity: ListTileControlAffinity.trailing,
          title: Text("Please send me news and offers from Spotify.",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
          value: isPP1Selected,
          groupValue: false,
          onChanged: (value){
            isPP1Selected=value!;
            setState(() {

            });
          },),
        mSpacer(mHeight: 21),
        RadioListTile.adaptive(
          controlAffinity: ListTileControlAffinity.trailing,
          title: Text("Share my registration data with Spotify's content providers for marketing purposes.",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
          value: isPP2Selected,
          groupValue: false,
          onChanged: (value){
            isPP2Selected=value!;
            setState(() {

            });
          },)
      ],
    ),
  );
}
