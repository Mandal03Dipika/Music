import 'dart:math';

import 'package:flutter/material.dart';
import 'package:music_app/domain/app_colors.dart';
import 'package:music_app/domain/app_routes.dart';
import 'package:music_app/domain/ui_helper.dart';
import 'package:music_app/ui/custom_widgets/my_custom_rounded_btn.dart';
import 'package:music_app/ui/custom_widgets/my_rounded_img_card.dart';
import 'package:music_app/ui/dashboard/dashboard_screen.dart';

class ChoosePodcastPage extends StatelessWidget {
  List <List<Map<String,dynamic>>> mPodcast=[
    [
      {
        "imgPath":"assets/images/Chon.png",
        "name":"Deepi",
        "isBlackBg":true,
        "isSpotifyOriginal":true
      },
      {
        "imgPath":"assets/images/Bryce Vine.png",
        "name":"Avhi",
        "isBlackBg":true,
        "isSpotifyOriginal":true
      },
      {
        "imgPath":"",
        "name":"More in Fight",
        "isBlackBg":true,
        "isSpotifyOriginal":false
      },
    ],
    [
      {
        "imgPath":"assets/images/Anthem of the Peaceful Army.png",
        "name":"Samir Sir",
        "isBlackBg":true,
        "isSpotifyOriginal":true
      },
      {
        "imgPath":"assets/images/Afterburner.png",
        "name":"Busy",
        "isBlackBg":true,
        "isSpotifyOriginal":true
      },
      {
        "imgPath":"",
        "name":"More in Comedy",
        "isBlackBg":true,
        "isSpotifyOriginal":false
      },
    ],
    [
      {
        "imgPath":"assets/images/Coastin.png",
        "name":"Sonu",
        "isBlackBg":true,
        "isSpotifyOriginal":true
      },
      {
        "imgPath":"assets/images/Default.png",
        "name":"Soham",
        "isBlackBg":true,
        "isSpotifyOriginal":true
      },
      {
        "imgPath":"",
        "name":"More in Stories",
        "isBlackBg":true,
        "isSpotifyOriginal":false
      },
    ],
    [
      {
        "imgPath":"assets/images/From the Fires.png",
        "name":"Sneha",
        "isBlackBg":false,
        "isSpotifyOriginal":true
      },
      {
        "imgPath":"assets/images/Members.png",
        "name":"Sargam",
        "isBlackBg":true,
        "isSpotifyOriginal":true
      },
      {
        "imgPath":"",
        "name":"More in Relationships",
        "isBlackBg":true,
        "isSpotifyOriginal":false
      },
    ],
    [
      {
        "imgPath":"assets/images/Members2.png",
        "name":"Vidya",
        "isBlackBg":false,
        "isSpotifyOriginal":true
      },
      {
        "imgPath":"assets/images/Members3.png",
        "name":"Abhijeet",
        "isBlackBg":true,
        "isSpotifyOriginal":true
      },
      {
        "imgPath":"",
        "name":"More in Horrors",
        "isBlackBg":true,
        "isSpotifyOriginal":false
      },
    ],
    [
      {
        "imgPath":"assets/images/MGK.png",
        "name":"Ujjwal",
        "isBlackBg":true,
        "isSpotifyOriginal":true
      },
      {
        "imgPath":"assets/images/Mothership.png",
        "name":"Rohit",
        "isBlackBg":true,
        "isSpotifyOriginal":true
      },
      {
        "imgPath":"",
        "name":"More in Drama",
        "isBlackBg":true,
        "isSpotifyOriginal":false
      },
    ],
    [
      {
        "imgPath":"assets/images/Self Titled.png",
        "name":"Tuk Tuk",
        "isBlackBg":false,
        "isSpotifyOriginal":true
      },
      {
        "imgPath":"assets/images/The Office.png",
        "name":"Tannu",
        "isBlackBg":true,
        "isSpotifyOriginal":true
      },
      {
        "imgPath":"",
        "name":"More in Motivation",
        "isBlackBg":true,
        "isSpotifyOriginal":false
      },
    ],
    [
      {
        "imgPath":"assets/images/Time Bomb.png",
        "name":"Lolo",
        "isBlackBg":true,
        "isSpotifyOriginal":true
      },
      {
        "imgPath":"assets/images/Tycho.png",
        "name":"Golu",
        "isBlackBg":true,
        "isSpotifyOriginal":true
      },
      {
        "imgPath":"",
        "name":"More in True Crime",
        "isBlackBg":true,
        "isSpotifyOriginal":false
      },
    ],
    [
      {
        "imgPath":"assets/images/Chon.png",
        "name":"Aasu",
        "isBlackBg":true,
        "isSpotifyOriginal":true
      },
      {
        "imgPath":"assets/images/Bryce Vine.png",
        "name":"Guddu",
        "isBlackBg":true,
        "isSpotifyOriginal":true
      },
      {
        "imgPath":"",
        "name":"More in Love",
        "isBlackBg":true,
        "isSpotifyOriginal":false
      },
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 300,
                child: Text("Now choose some podcasts.",
                  style:TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),),
              ),
              mSpacer(),
              SizedBox(
                height: 50,
                child: TextField(
                  decoration: getSearchTextFieldDecoration(),
                ),
              ),
              mSpacer(mHeight: 21),
              Expanded(
                child: Stack(
                  children: [
                    ListView.builder(
                      itemCount: mPodcast.length,
                      itemBuilder: (_,index){
                        return Container(
                          padding: EdgeInsets.only(bottom: 11),
                          height: 170,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: mPodcast[index].length,
                              itemBuilder: (_,childIndex){
                                return Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: Column(
                                  children: [
                                    childIndex == 2 ? Container(
                                      padding: EdgeInsets.symmetric(horizontal: 11),
                                      width: 120,
                                      height: 120,
                                      child: Center(
                                          child: Text(
                                            mPodcast[index][childIndex]['name'],
                                            style:  TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                                textAlign: TextAlign.center,
                                          )
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(11),
                                          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                                      ),) : MyRoundedImgCard(
                                      mWidth: 120,
                                      mHeight: 120,
                                      imgPath: mPodcast[index][childIndex]['imgPath'],
                                      isBlackBg: mPodcast[index][childIndex]['isBlackBg'],
                                      isSpotifyOriginal: mPodcast[index][childIndex]['isSpotifyOriginal'],
                                    ),
                                    mSpacer(),
                                    Text(childIndex == 2 ? "" : mPodcast[index][childIndex]['name'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                    )
                                  ],),
                                );
                              }
                          ),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        height: 180,
                        child: Center(
                          child: MyCustomRoundedBtn(
                            onTap: ()
                            {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashboardScreen(),));
                            },
                            text: "Done",
                            mWidth: 100,
                          ),
                        ),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.05,0.8],
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.7)
                                ]
                            )
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
