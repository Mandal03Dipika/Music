import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/domain/app_colors.dart';
import 'package:music_app/domain/ui_helper.dart';
import 'package:palette_generator/palette_generator.dart';

class MyProfile extends StatefulWidget {

  String profilePicPath="assets/images/image 2.png";

  MyProfile({required this.profilePicPath});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  PaletteGenerator? paletteGenerator;

  List <Map<String,dynamic>> mPlaylists=[
    {
      "imgPath":"assets/images/playlist1.png",
      "title":"Deepi",
      "subTitle":"WishAlpha"
    },
    {
      "imgPath":"assets/images/playlist2.png",
      "title":"Avhi",
      "subTitle":"WishAlpha"
    },
    {
      "imgPath":"assets/images/playlist3.png",
      "title":"Samir Sir",
      "subTitle":"WishAlpha Head"
    },
  ];

  @override
  void initState() {
    super.initState();
    initializeColor();
  }

  void initializeColor() async{
    paletteGenerator=await getColorPalette(widget.profilePicPath);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.34,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    paletteGenerator!=null?
                    HSLColor.fromColor(paletteGenerator!.dominantColor!.color).withLightness(0.25).toColor(): Colors.blue,
                    Colors.black
                  ],
                  stops: [0,1.0],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: SvgPicture.asset("assets/svg/Left.svg",
                            width: 25,
                            height: 25,
                            color: Colors.white,),
                          onTap: (){
                            Navigator.pop(context);
                          },
                        ),
                        Icon(Icons.more_horiz,color: Colors.white,),
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage(widget.profilePicPath))
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){

                    },
                    child: Text("Edit Profile"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondaryBlackColor,
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,

                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("23",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            Text("Playlists",style: TextStyle(color: Colors.grey),)
                          ],
                        ),
                        Column(
                          children: [
                            Text("58",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            Text("Followers",style: TextStyle(color: Colors.grey),)
                          ],
                        ),
                        Column(
                          children: [
                            Text("43",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            Text("Following",style: TextStyle(color: Colors.grey),)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Playlists",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      mSpacer(),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount:mPlaylists.length,
                          itemBuilder: (_,index){
                            return ListTile(
                              leading: Image.asset(mPlaylists[index]['imgPath']),
                              title: Text(mPlaylists[index]['title'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              subtitle: Text(mPlaylists[index]['subTitle'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16
                                ),
                              ),
                              trailing: Icon(Icons.chevron_right_sharp, color: Colors.white, size: 25,),
                            );
                          }
                      ),
                      mSpacer(mHeight: 14),
                      Row(
                        children: [
                          Text("See All Playlist",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 24.0),
                            child: Icon(Icons.chevron_right_sharp, color: Colors.white, size: 25,),
                          )
                        ],
                      ),
                    ],
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
