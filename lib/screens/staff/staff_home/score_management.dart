import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_pro/custom/estimated_time_and_live_now_container.dart';
import 'package:new_pro/utils/constants.dart';
import 'package:new_pro/utils/my_styles.dart';
import 'package:new_pro/utils/ui_helper/ui_helper.dart';

import '../../../utils/my_app_theme.dart';

class ScoreManagement extends StatefulWidget {
  const ScoreManagement({Key? key}) : super(key: key);

  @override
  State<ScoreManagement> createState() => _ScoreManagementState();
}

class _ScoreManagementState extends State<ScoreManagement> {

  late double height;
  late double width;

  List scoresList = [
    0,0,0,0
  ];



  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: mAppBar(title: scoreManagement),
      body: Column(
        //ainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ///players photo
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      height: height*.13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Image.asset('assets/images/player1.png',fit: BoxFit.cover,),
                    ),
                    SizedBox(
                      width: width*.3,
                        child: white16Text(text: player1,align: TextAlign.center))
                  ],
                ),


                Container(
                  height: height*.13,
                  alignment: Alignment.center,
                  child: Text(vs,style: TextStyle(
                    color: MyAppTheme.challengeBtnBgColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w600
                  ),),
                ),


                Column(
                  children: [
                    Container(
                      height: height*.13,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Image.asset('assets/images/player2.png',fit: BoxFit.cover,),
                    ),
                    SizedBox(
                        width: width*.3,
                        child: white16Text(text: player2,align: TextAlign.center))
                  ],
                ),

              ],
            ),
          ),


          ///Toss and Service
          Container(
            decoration: BoxDecoration(
                border: Border.symmetric(horizontal: BorderSide(
                    color: MyAppTheme.cardBgSecColor
                ))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: width*.48,
                  padding: const EdgeInsets.only(left: 6,top: 8,bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titleText(text: tossWon),
                      Row(

                        children: [
                          unSelectedContainer(text: player1),
                          unSelectedContainer(text: player2),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: width*.48,
                  padding: const EdgeInsets.only(left: 6,top: 8,bottom: 8),
                  decoration: BoxDecoration(
                      border: Border(

                        left: BorderSide(
                          color: MyAppTheme.cardBgSecColor,
                        ),

                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titleText(text: service),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: (){
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding:
                              const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: (true)
                                    ? MyAppTheme.documentBgMainColor
                                    : MyAppTheme.cardBorderBgColor,
                                border: Border.all(
                                    color: (true)
                                        ? MyAppTheme.MainColor
                                        : MyAppTheme.cardBgSecColor),
                              ),
                              child: Text(player1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: (true)
                                          ? MyAppTheme.MainColor
                                          : MyAppTheme.whiteColor)),
                            ),
                          ),
                          unSelectedContainer(text: player2),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),


          ///Scores...

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                titleText(text: scores),
                Row(
                  children: [
                    Text(undo,style: MyStyles.mainClr14Light,),
                    SizedBox(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset('assets/images/undo_ic.svg'))
                  ],
                )
              ],
            ),
          ),



          ///Score sheet

          Padding(
            padding: const EdgeInsets.all( 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleText(text: scoreSheet),
                LiveNowContainer(height: height*.2, time: '0 min', roundName: qualRnd1)
              ],
            ),
          ),

          Container(
            color: MyAppTheme.cardBgSecColor,
            height: height*.05,
            alignment: Alignment.centerRight,
            //padding: const EdgeInsets.symmetric(vertical: 7),
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                white12Text(text: set1,align: TextAlign.center),
                white12Text(text: set2),
                white12Text(text: set3),
                white12Text(text: points),
              ].map((e) => Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Align(
                  alignment: Alignment.center,
                  child: e,
                ),
              )).toList()


                  //.map((e) => Padding(padding: const EdgeInsets.only(right: 10),child: e,)).toList(),
            ),
          ),
          Row(
            children: [
              Container(
                width: width*.4,
                child: Row(
                  children: [
                    subTitleText(text: player1),
                    Visibility(
                        visible: true,
                        child: SvgPicture.asset('assets/images/ball_ic.svg'))
                  ],
                ),
              ),
              Container(
                height: height*.05,
                width: width*.6,
                alignment: Alignment.centerRight,
                //padding: const EdgeInsets.symmetric(vertical: 7),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                 itemCount: scoresList.length,
                 itemBuilder: (context, index) =>
                    unSelectedContainer(text: scoresList[index].toString())


                      //.map((e) => Padding(padding: const EdgeInsets.only(right: 10),child: e,)).toList(),
                ),
              ),
            ],
          ),









        ],
      ),
    );
  }
}

///Score list
///
//Container(
//             height: height*.1,
//             width: width,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   width: width*.5,
//                   height: height*.1,
//                   child: titleText( text: player1),
//                 ),
//                 Container(
//                   alignment: Alignment.centerRight,
//                   width: width*.5,
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     scrollDirection: Axis.horizontal,
//                     itemCount: score.length-2,
//                     itemBuilder: (context, index) => unSelectedContainer(text: scores[index]),),
//                 )
//               ],
//             ),
//           ),