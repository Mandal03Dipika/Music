import 'package:flutter/material.dart';
import 'package:music_app/domain/app_colors.dart';
import 'package:music_app/domain/ui_helper.dart';

class LibraryBottomNavPage extends StatelessWidget {
  const LibraryBottomNavPage({super.key});

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
                mSpacer(),

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
              Text("Your Library",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),
              ),
              Spacer(),
              Icon(Icons.plus_one, size: 30, color: Colors.white,)
            ],
          ),
        ),
      ],
    );
  }
}
