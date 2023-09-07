import 'package:flutter/material.dart';
import 'package:new_pro/screens/tournament/academy/officials.dart';

import '../../utils/my_colors.dart';
import '../../utils/my_images.dart';
import '../../utils/my_styles.dart';
import '../screens/home.dart';

class OnBoarding extends StatelessWidget {
  String mainImg;
  String titleText;
  String subTitleText;

  OnBoarding(
      {super.key,
      required this.titleText,
      required this.subTitleText,
      required this.mainImg,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: Stack(
              children: [
                SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image(image: AssetImage(mainImg),fit: BoxFit.cover,)),
                Positioned(
                    right: 5,
                    top: 20,
                    child: TextButton(
                      child: Text('Skip',style: MyStyles.white12Light,),
                      onPressed: () {
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const Officials(),
                        //     ));
                      },
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  titleText,
                  style: MyStyles.white30SemiBold,
                ),
                Text(
                  subTitleText,
                  style: MyStyles.grey20Regular,
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
