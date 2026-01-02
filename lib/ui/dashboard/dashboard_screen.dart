import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/domain/app_colors.dart';
import 'package:music_app/ui/custom_widgets/my_compact_music_player.dart';
import 'package:music_app/ui/dashboard/navigations/home_bottom_nav_page.dart';
import 'package:music_app/ui/dashboard/navigations/library_bottom_nav_page.dart';
import 'package:music_app/ui/dashboard/navigations/search_bottom_nav_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  List<Widget> mBottomNavPages=[
    HomeBottomNavPage(),
    LibraryBottomNavPage(),
    SearchBottomNavPage()
  ];
  int selectedBottomIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            mBottomNavPages[selectedBottomIndex],
            Align(
                alignment: Alignment.bottomCenter,
                child: MyCompactMusicPlayer(
                    albumTitle: "The Beatles",
                    songTitle: "From Me to You - Mono / Remastered",
                    bgColor: Colors.black.withOpacity(0.8),
                    thumbnailPath: "assets/images/1st row/1.png",
                    isBluetooth: true,
                    bluetoothName: "Dipika",
                )
            )
          ]
      ),
      backgroundColor: AppColors.blackColor,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedBottomIndex,
          iconSize: 11,
          elevation: 11,
          selectedLabelStyle: TextStyle(color: AppColors.whiteColor),
          unselectedLabelStyle: TextStyle(color: AppColors.greyColor),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          backgroundColor: AppColors.secondaryBlackColor,
          type: BottomNavigationBarType.fixed,
          onTap: (value){
            selectedBottomIndex=value;
            setState(() {

            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Image.asset("assets/png/Home_outline.png", width: 20, height: 20, color: Colors.grey,),
                label: "Home",
                activeIcon: Image.asset("assets/png/Home_Solid.png",width: 20, height: 20, color: Colors.white,)
            ),
            BottomNavigationBarItem(
                icon: Image.asset("assets/png/Search_outline.png", width: 20, height: 20, color: Colors.grey,),
                label: "Search",
                activeIcon: Image.asset("assets/png/Search_Solid.png", width: 20, height: 20, color: Colors.white,)
            ),
            BottomNavigationBarItem(
                icon: Image.asset("assets/png/Library_outline.png", width: 20, height: 20, color: Colors.grey,),
                label: "Library",
                activeIcon: Image.asset("assets/png/Library_Solid.png", width: 20, height: 20, color: Colors.grey,)
            ),
      ]),
    );
  }
}
