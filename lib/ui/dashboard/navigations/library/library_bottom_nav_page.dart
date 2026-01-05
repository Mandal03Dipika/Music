import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/domain/app_colors.dart';
import 'package:music_app/domain/ui_helper.dart';
import 'package:music_app/ui/custom_widgets/my_library_list.dart';
import 'package:music_app/ui/custom_widgets/type_chip.dart';

class LibraryBottomNavPage extends StatelessWidget {
  List<String> mTypes = ["Playlists","Artists","Albums","Podcasts & Shows"];

  List <Map<String,dynamic>> mArtist=[
    {
      "imgPath":"assets/images/Chon.png",
      "title":"Deepi",
      "subTitle":"WishAlpha"
    },
    {
      "imgPath":"assets/images/Bryce Vine.png",
      "title":"Avhi",
      "subTitle":"WishAlpha"
    },
    {
      "imgPath":"assets/images/Anthem of the Peaceful Army.png",
      "title":"Samir Sir",
      "subTitle":"WishAlpha Head"
    },
    {
      "imgPath":"assets/images/Afterburner.png",
      "title":"Busy",
      "subTitle":"WishAlpha"
    },
    {
      "imgPath":"assets/images/Coastin.png",
      "title":"Sonu",
      "subTitle":"WishAlpha"
    },
    {
      "imgPath":"assets/images/Default.png",
      "title":"Soham",
      "subTitle":"WishAlpha"
    },
    {
      "imgPath":"assets/images/From the Fires.png",
      "title":"Sneha",
      "subTitle":"WishAlpha"
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
              titleUI(context),
              mSpacer(),
              typeChipUI(),
              mSpacer(mHeight: 16),
              recentlyPlayedUI(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      mSpacer(),
                      MyLibraryList(
                        isLeadingGradient: true,
                        mGradientColors: [
                          Color(0xff4A39EA),
                          Color(0xff868AE1),
                          Color(0xffB9D4DB),
                        ],
                        mTitle: "Liked Songs",
                        mSubTitle: "Playlist | 58 songs",
                      ),
                      mSpacer(mHeight: 5),
                      MyLibraryList(
                        mSolidColor: Colors.deepPurple,
                        mLeadingIcon: Icons.notifications_active,
                        mLeadingIconColor: Colors.green,
                        mTitle: "New Songs",
                        mSubTitle: "Updated 2 days ago",
                      ),
                      mSpacer(),
                      ListView.builder(
                          itemCount: mArtist.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (_,index){
                            return Column(
                              children: [
                                ListTile(
                                  leading: Image.asset(mArtist[index]['imgPath'],width: 60,height: 60,),
                                  title: Text(mArtist[index]['title']),
                                  titleTextStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),
                                  subtitle: Text(mArtist[index]['subTitle']),
                                  subtitleTextStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                            mSpacer(mHeight: 14),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }

  Widget titleUI(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle
              ),
              child: Center(
                  child: Image.asset(
                    "assets/images/image 2.png",
                    width: 50,
                    height: 50,
                  )
              ),
            ),
            onTap: (){
              // Navigator.pushReplacement(context,AppRoutes.profile_page);
            },
          ),
          mSpacer(),
          Text("Your Library",
            style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold
            ),
          ),
          Spacer(),
          Icon(Icons.add,size: 35,color: Colors.white,)
        ],
      ),
    );
  }

  Widget typeChipUI(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
            itemCount: mTypes.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_,index){
              return TypeChip(typeName: mTypes[index]);
            }
        ),
      )
    );
  }

  Widget recentlyPlayedUI(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Row(
        children: [
          RotatedBox(
              quarterTurns:3,
              child: Icon(
                Icons.compare_arrows_rounded,
                color: Colors.white,
              )
          ),
          mSpacer(),
          Text("Recently Played",
            style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold
            ),
          ),
          Spacer(),
          SvgPicture.asset("assets/svg/box_4.svg", color: Colors.white,)
        ],
      ),
    );
  }
}
