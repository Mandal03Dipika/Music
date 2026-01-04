import 'package:flutter/material.dart';
import 'package:music_app/domain/ui_helper.dart';
import 'package:palette_generator/palette_generator.dart';

class MyCompactMusicPlayer extends StatefulWidget {

  String songTitle,albumTitle,bluetoothName,thumbnailPath;
  bool isBluetooth;
  double mHeight;
  Color bgColor;

  MyCompactMusicPlayer({
    required this.albumTitle,
    required this.songTitle,
    this.isBluetooth=false,
    this.bluetoothName="",
    this.mHeight=65,
    required this.bgColor,
    required this.thumbnailPath
  });

  @override
  State<MyCompactMusicPlayer> createState() => _MyCompactMusicPlayerState();
}

class _MyCompactMusicPlayerState extends State<MyCompactMusicPlayer> {
  PaletteGenerator? paletteGenerator;

  @override
  void initState() {
    super.initState();
    getDominantColor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: widget.mHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: paletteGenerator!=null? 
        paletteGenerator!.dominantColor!.color.withOpacity(0.4) : widget.bgColor,
      ),
      child: Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      image: DecorationImage(image: AssetImage(widget.thumbnailPath))
                    ),
                  ),
                  mSpacer(),
                  Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(widget.songTitle,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Expanded(
                                child: Text("- ${widget.albumTitle}",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10  ,
                                  ),
                                  overflow: TextOverflow.fade,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                          widget.isBluetooth ? Row(
                            children: [
                              Icon(Icons.bluetooth,color: Colors.white,size: 14,),
                              Text(widget.bluetoothName,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ):Container()
                        ],
                      )
                  ),
                  mSpacer(),
                  Icon(widget.isBluetooth ? Icons.bluetooth:Icons.devices,color: Colors.green,),
                  mSpacer(),
                  Icon(Icons.pause,color: Colors.white,)
                ],
              ),
              LinearProgressIndicator(
                value: 0.5,
                valueColor: AlwaysStoppedAnimation<Color>(paletteGenerator!=null?
                paletteGenerator!.colors.toList()[6] : Colors.grey),
                borderRadius: BorderRadius.circular(11),
                backgroundColor: Colors.white.withOpacity(0.3),
              )
            ],
          ),
      ),
    );
  }

  getDominantColor() async{
    paletteGenerator = await PaletteGenerator.fromImageProvider(AssetImage(widget.thumbnailPath));
    setState(() {
      
    });
  }
}
