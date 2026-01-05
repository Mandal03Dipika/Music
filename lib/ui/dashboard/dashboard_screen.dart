import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/domain/app_colors.dart';
import 'package:music_app/domain/ui_helper.dart';
import 'package:music_app/ui/custom_widgets/my_compact_music_player.dart';
import 'package:music_app/ui/dashboard/navigations/home_bottom_nav_page.dart';
import 'package:music_app/ui/dashboard/navigations/library/library_bottom_nav_page.dart';
import 'package:music_app/ui/dashboard/navigations/library/my_profile.dart';
import 'package:music_app/ui/dashboard/navigations/search_bottom_nav_page.dart';
import 'package:palette_generator/palette_generator.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  PaletteGenerator? paletteGenerator;
  double currentValue=50;
  bool isPlaying=false;

  @override
  void initState() {
    super.initState();
    initializeColor();
  }

  initializeColor() async{
    paletteGenerator=await getColorPalette("assets/images/1st row/1.png");
    setState(() {

    });
  }

  List<Widget> mBottomNavPages=[
    HomeBottomNavPage(),
    SearchBottomNavPage(),
    // MyProfile(profilePicPath: "assets/images/image 2.png"),
    LibraryBottomNavPage(),
  ];
  int selectedBottomIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 65.0),
              child: mBottomNavPages[selectedBottomIndex],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: (){
                    showModalBottomSheet(
                        isScrollControlled:true,
                        context: context,
                        builder: (_){
                          return Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: [0.16,1.0],
                                  colors: [
                                    HSLColor.fromColor(paletteGenerator!.dominantColor!.color).withLightness(0.35).toColor(),
                                    Colors.black87
                                  ]
                              )
                            ),
                            child: Stack(
                              children:[
                                Column(
                                  children: [
                                    mSpacer(mHeight: 34),
                                    Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          child: SvgPicture.asset("assets/svg/Down.svg",
                                            width: 25,
                                            height: 25,
                                            color: Colors.white,),
                                          onTap: (){
                                            Navigator.pop(context);
                                          },
                                        ),
                                        Text("1(Remastered)",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),),
                                        Icon(Icons.more_horiz,color: Colors.white,)
                                      ],
                                    ),
                                  ),
                                    mSpacer(mHeight: 16),
                                    Padding(
                                      padding: EdgeInsets.all(20),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(11),
                                        child: Image.asset("assets/images/1st row/1.png"),
                                      ),
                                  ),
                                    Column(
                                    children: [
                                      ListTile(
                                        title: Text("From Me to You - Mono / Remastered",
                                          maxLines: 1,
                                          softWrap: false,
                                        ),
                                        titleTextStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                        subtitle: Text("The Beatles"),
                                        subtitleTextStyle: TextStyle(
                                            color: Colors.grey,
                                        ),
                                        trailing: Icon(Icons.favorite,color: Colors.white,size: 26,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                        child: StatefulBuilder(builder: (_,ss){
                                          return SliderTheme(
                                            data: SliderThemeData(
                                              overlayShape: SliderComponentShape.noOverlay
                                            ),
                                            child: Slider(
                                                min:0,
                                                max:100,
                                                activeColor: Colors.white,
                                                thumbColor: Colors.white,
                                                inactiveColor: Colors.grey,
                                                value: currentValue,
                                                onChanged: (value){
                                                  currentValue=value;
                                                  ss(() {
                              
                                                  });
                                                }
                                            ),
                                          );
                                        }),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 16.0,left: 16),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("0:38",
                                              style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 12
                                              ),
                                            ),
                                            Text("-1:18",
                                              style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 12
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SvgPicture.asset("assets/svg/Shuffle.svg",
                                              width: 25,
                                              height: 25,
                                              color: Colors.white,
                                            ),
                                            Icon(Icons.skip_previous_sharp,
                                              color: Colors.white,
                                              size: 40,),
                                            StatefulBuilder(
                                              builder: (context,ss){
                                                return InkWell(
                                                  onTap: (){
                                                    isPlaying = !isPlaying;
                                                    ss(() {
                              
                                                    });
                                                  },
                                                  child: Icon(isPlaying ? Icons.pause_circle_filled_sharp : Icons.pause_circle_filled_sharp,
                                                    color: Colors.white,
                                                    size: 77,),
                                                );
                                              }
                                            ),
                                            Icon(Icons.skip_next_sharp,
                                              color: Colors.white,
                                              size: 40,),
                                            SvgPicture.asset("assets/svg/Repeat.svg",
                                              width: 25,
                                              height: 25,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                              
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Row(
                                          children: [
                                            mSpacer(),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.bluetooth,
                                                  color: Colors.green,
                                                  size: 14,
                                                ),
                                                Text("Dipika",
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 12
                                                  ),
                                                )
                                              ],
                                            ),
                                            Spacer(),
                                            SvgPicture.asset("assets/svg/Share.svg",width: 25,height: 25,color: Colors.white,),
                                            mSpacer(mWidth: 20),
                                            SvgPicture.asset("assets/svg/Playlist.svg",width: 25,height: 25,color: Colors.white),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 16),
                                    height: 70,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xffD8672A),
                                      borderRadius: BorderRadius.vertical(top: Radius.circular(7))
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text("Lyrics" ,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(vertical: 7),
                                            width:88,
                                            child: Row(
                                              children: [
                                                Text("More",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15
                                                  ),
                                                ),
                                                SvgPicture.asset("assets/svg/Full Screen.svg",color: Colors.white,)
                                              ],
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.black54,
                                              borderRadius: BorderRadius.circular(100)
                                            ),
                                          )
                                        ],
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                      ),
                                    ),
                                  ),
                                )
                              ]
                            ),
                          );
                        }
                    );
                  },
                  child: MyCompactMusicPlayer(
                      albumTitle: "The Beatles",
                      songTitle: "From Me to You - Mono / Remastered",
                      bgColor: Colors.black.withOpacity(0.8),
                      thumbnailPath: "assets/images/1st row/1.png",
                      isBluetooth: true,
                      bluetoothName: "Dipika",
                  ),
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
