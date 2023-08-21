import 'package:new_pro/custom/dot_container.dart';
import 'package:new_pro/custom/onbording.dart';
import 'package:flutter/material.dart';
import 'package:new_pro/screens/ofiicials/officials.dart';
import 'package:new_pro/utils/my_images.dart';
import 'package:new_pro/utils/my_string.dart';

import '../../utils/my_colors.dart';
import '../../utils/my_styles.dart';
import '../home.dart';

class OnBoard extends StatefulWidget {
  static List<Map<String,dynamic>> onboard= [
    {
      'titleText': MyStrings.welcomeText,
      'subTitleText' : MyStrings.onboardText1,
      'mainImg': MyImages.onBoarding1,
    },
    {
      'titleText': MyStrings.challengeText,
      'subTitleText' : MyStrings.onboardText2,
      'mainImg': MyImages.onBoarding2,
    },
    {
      'titleText': MyStrings.hostText,
      'subTitleText' : MyStrings.onboardText3,
      'mainImg': MyImages.onBoarding3,
    },
  ];


  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height*.9,
              child: OnBoarding(titleText: OnBoard.onboard[index]['titleText'], subTitleText: OnBoard.onboard[index]['subTitleText'], mainImg: OnBoard.onboard[index]['mainImg'])),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [

                    (index==0) ? const DotSelectedContainer(): const DotUnSelectedContainer(),
                    (index==1) ? const DotSelectedContainer(): const DotUnSelectedContainer(),
                    (index==2) ? const DotSelectedContainer(): const DotUnSelectedContainer(),

                  ],
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.primary,
                      fixedSize: const Size(100, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)
                        )
                    ),
                    onPressed: () {
                      if (index<2) {
                        index++;
                        setState(() {

                        });
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Officials(),
                            ));
                      }
                    },
                    child: Text(
                      'Next',
                      style: MyStyles.white12Light,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

