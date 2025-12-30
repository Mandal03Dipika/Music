import 'package:flutter/material.dart';
import 'package:music_app/domain/app_colors.dart';
import 'package:music_app/domain/ui_helper.dart';
import 'package:music_app/ui/custom_widgets/my_circular_img_bg.dart';

class ChooseArtistPage extends StatelessWidget {
  List <Map<String,dynamic>> mArtist=[
    {
      "imgPath":"assets/images/Chon.png",
      "name":"Deepi",
    },
    {
      "imgPath":"assets/images/Bryce Vine.png",
      "name":"Avhi",
    },
    {
      "imgPath":"assets/images/Anthem of the Peaceful Army.png",
      "name":"Samir Sir",
    },
    {
      "imgPath":"assets/images/Afterburner.png",
      "name":"Busy",
    },
    {
      "imgPath":"assets/images/Coastin.png",
      "name":"Sonu",
    },
    {
      "imgPath":"assets/images/Default.png",
      "name":"Soham",
    },
    {
      "imgPath":"assets/images/From the Fires.png",
      "name":"Sneha",
    },
    {
      "imgPath":"assets/images/Members.png",
      "name":"Sargam",
    },
    {
      "imgPath":"assets/images/Members2.png",
      "name":"Vidya",
    },
    {
      "imgPath":"assets/images/Members3.png",
      "name":"Abhijeet",
    },
    {
      "imgPath":"assets/images/MGK.png",
      "name":"Ujjwal",
    },
    {
      "imgPath":"assets/images/Mothership.png",
      "name":"Rohit",
    },
    {
      "imgPath":"assets/images/Self Titled.png",
      "name":"Tuk Tuk",
    },
    {
      "imgPath":"assets/images/The Office.png",
      "name":"Tannu",
    },
    {
      "imgPath":"assets/images/Time Bomb.png",
      "name":"Lolo",
    },
    {
      "imgPath":"assets/images/Tycho.png",
      "name":"Golu",
    },{
      "imgPath":"assets/images/Chon.png",
      "name":"Aasu",
    },
    {
      "imgPath":"assets/images/Bryce Vine.png",
      "name":"Guddu",
    },
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
                child: Text("Choose 3 or more artists you like.",
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
                    GridView.builder(
                      itemCount: mArtist.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 11,
                          crossAxisSpacing: 11,
                          childAspectRatio: 7/8,
                      ),
                      itemBuilder: (_,index){
                        return Column(
                          children: [
                            MyCircularImgBg(imgPath: mArtist[index]['imgPath']),
                            mSpacer(),
                            Text(mArtist[index]['name'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),)
                          ],
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        height: 180,
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
