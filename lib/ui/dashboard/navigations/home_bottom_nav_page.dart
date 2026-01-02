import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/domain/app_colors.dart';
import 'package:music_app/domain/ui_helper.dart';

class HomeBottomNavPage extends StatelessWidget {

  List<Map<String,dynamic>> mRecentlyPlayedList=[
    {
      "imgPath":"assets/images/1st row/1.png",
      "name":"1(Remastered)"
    },
    {
      "imgPath":"assets/images/1st row/2.png",
      "name":"Lana Del Rey"
    },
    {
      "imgPath":"assets/images/1st row/3.png",
      "name":"Marvin Gaye"
    },
    {
      "imgPath":"assets/images/1st row/4.png",
      "name":"Indie Pop"
    },
  ];

  List<Map<String,dynamic>> mReviewList=[
    {
      "imgPath":"assets/images/3rd row/1.png",
      "name":"Top Songs 2025"
    },
    {
      "imgPath":"assets/images/3rd row/2.png",
      "name":"Artists Revealed"
    },
  ];

  List<Map<String,dynamic>> mEditorPickList=[
    {
      "imgPath":"assets/images/4th row/1.png",
      "name":"Ed Sheeran, Big Sean,\nJuice WRLD, Post Malone"
    },
    {
      "imgPath":"assets/images/4th row/2.png",
      "name":"Mitski, Tame Impala,\nGlass Animals, Charli XCX"
    },
    {
      "imgPath":"assets/images/4th row/3.png",
      "name":"Marvin Gaye"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Column(
          children: [
            mSpacer(),
            recentlyPlayedUI(),
            mSpacer(mHeight: 14),
            recentlyPlayedListUI(),
            mSpacer(),
            reviewUI(),
            mSpacer(mHeight: 22),
            reviewListUI(),
            mSpacer(),
            editorPicksUI(),
          ],
        ),
      ),
    );
  }

  Widget recentlyPlayedUI(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: Row(
            children: [
              Text("Recently Played",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),
              ),
              Spacer(),
              SvgPicture.asset("assets/svg/Bell.svg",
                width: 22,
                height: 22,
                color: Colors.white,),
              mSpacer(mWidth: 20),
              SvgPicture.asset("assets/svg/orientation lock.svg",
                width: 22,
                height: 22,
                color: Colors.white,),
              mSpacer(mWidth: 20),
              SvgPicture.asset("assets/svg/Settings.svg",
                width: 24,
                height: 24,
                color: Colors.white,),
            ],
          ),
        )
      ],
    );
  }

  Widget recentlyPlayedListUI(){
    return SizedBox(
      height: 140,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount:mRecentlyPlayedList.length,
          itemBuilder: (_,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11.0),
              child: Column(
                children: [
                  Image.asset(mRecentlyPlayedList[index]['imgPath'],
                    width: 100,
                    height: 100,),
                  mSpacer(mHeight: 8),
                  Text(mRecentlyPlayedList[index]['name'],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            );
          }
      ),
    );
  }

  Widget reviewUI(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Row(
        children: [
          Image.asset("assets/images/2.png",width: 55, height: 55,),
          mSpacer(),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("#SPOTIFYWRAPPED",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                ),
              ),
              Text("Your 2025 in review",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }

  Widget reviewListUI(){
    return SizedBox(
      height: 190,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount:mReviewList.length,
          itemBuilder: (_,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(mReviewList[index]['imgPath'],
                    width: 150,
                    height: 150,),
                  mSpacer(mHeight: 8),
                  Text(mReviewList[index]['name'],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            );
          }
      ),
    );
  }

  Widget editorPicksUI(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11.0),
          child: Text("Editor's Choice",
            style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        mSpacer(mHeight: 7),
        SizedBox(
          height: 200,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:mEditorPickList.length,
              itemBuilder: (_,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(mEditorPickList[index]['imgPath'],
                        width: 150,
                        height: 150,),
                      mSpacer(mHeight: 8),
                      Text(mEditorPickList[index]['name'],
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                );
              }
              ),
        )
      ],
    );
  }

}
