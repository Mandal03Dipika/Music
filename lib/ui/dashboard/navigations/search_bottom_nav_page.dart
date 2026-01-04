import 'package:flutter/material.dart';
import 'package:music_app/domain/app_colors.dart';
import 'package:music_app/domain/ui_helper.dart';
import 'package:music_app/ui/custom_widgets/album_row.dart';

class SearchBottomNavPage extends StatelessWidget {
  List <Map<String,dynamic>> mTopGenreList=[
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
  ];

  List <Map<String,dynamic>> mPopularPodcastList=[
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
  ];

  List <Map<String,dynamic>> mBrowseAllList=[
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
    },
    {
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                mSpacer(),
                titleUI(),
                mSpacer(mHeight: 8),
                searchBarUI(),
                mSpacer(mHeight: 14),
                topGenresUI(),
                mSpacer(mHeight: 14),
                popularPodcastsUI(),
                mSpacer(mHeight: 14),
                browseAllUI()
              ],
            ),
          ),
        )
    );
  }

  Widget titleUI(){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Search",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),
              ),
              Spacer(),
              Icon(Icons.camera_alt_outlined, size: 30, color: Colors.white,)
            ],
          ),
        ),
      ],
    );
  }

  Widget searchBarUI(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 11),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11)
        ),
        child: TextField(
          cursorColor: AppColors.primaryColor,
          autofocus: false,
          decoration: InputDecoration(
            hintText: "Artists, songs or podcasts",
            hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            border: InputBorder.none,
            prefixIconConstraints: BoxConstraints(minWidth: 0,minHeight: 0),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.search,size: 30,),
            ),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none
          ),
        )
      ),
    );
  }

  Widget topGenresUI(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Top Genres",
            style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold
            ),
          ),
          mSpacer(),
          SizedBox(
            height: 120,
            child: ListView.builder(
                itemCount: mTopGenreList.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,index){
                  return Padding(
                    padding: const EdgeInsets.only(right: 11.0),
                    child: AlbumRow(
                      thumbnailPath: mTopGenreList[index]['imgPath'],
                      albumName: mTopGenreList[index]['name'],
                    ),
                  );
                }
            ),
          )
        ],
      ),
    );
  }

  Widget popularPodcastsUI(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Popular Podcast Categories",
            style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold
            ),
          ),
          mSpacer(),
          SizedBox(
            height: 120,
            child: ListView.builder(
                itemCount: mPopularPodcastList.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,index){
                  return Padding(
                    padding: const EdgeInsets.only(right: 11.0),
                    child: AlbumRow(
                      thumbnailPath: mPopularPodcastList[index]['imgPath'],
                      albumName: mPopularPodcastList[index]['name'],),
                  );
                }
            ),
          )
        ],
      ),
    );
  }

  Widget browseAllUI(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Popular Podcast Categories",
            style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold
            ),
          ),
          mSpacer(),
          GridView.builder(
              itemCount: mBrowseAllList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 16/9,
                  mainAxisSpacing: 11,
                  crossAxisSpacing: 11
              ),
              itemBuilder: (_,index){
                return Padding(
                  padding: const EdgeInsets.only(right: 11.0),
                  child: AlbumRow(
                    thumbnailPath: mBrowseAllList[index]['imgPath'],
                    albumName: mBrowseAllList[index]['name'],
                  ),
                );
              }
          )
        ],
      ),
    );
  }

}
