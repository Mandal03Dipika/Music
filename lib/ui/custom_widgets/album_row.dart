import 'dart:math';
import 'package:flutter/material.dart';

class AlbumRow extends StatelessWidget {
  String thumbnailPath,albumName;

  AlbumRow({required this.thumbnailPath,required this.albumName});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: MediaQuery.of(context).size.width*0.5-16,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.primaries[Random().nextInt(Colors.primaries.length-1)]
        ),
        child: Stack(
          children: [
            Positioned(
                right: -20,
                bottom: 0,
                child: Transform.rotate(
                  angle: 19 * pi/180,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(thumbnailPath)),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 4,
                          blurRadius: 11,
                          color: Colors.black.withOpacity(0.5)
                        )
                      ]
                    ),
                  ),
                )
            ),
            Positioned(
              top: 11,
              left: 11,
              child: Text(albumName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
