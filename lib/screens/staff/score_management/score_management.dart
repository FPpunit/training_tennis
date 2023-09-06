import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_pro/custom/estimated_time_and_live_now_container.dart';
import 'package:new_pro/utils/constants.dart';
import 'package:new_pro/utils/my_styles.dart';
import 'package:new_pro/utils/ui_helper/ui_helper.dart';
import 'package:provider/provider.dart';

import '../../../utils/my_app_theme.dart';
import '../staff_provider/staff_provider.dart';

class ScoreManagement extends StatelessWidget {
  ScoreManagement({Key? key}) : super(key: key);

  late double height;
  late double width;
  var won = false;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Consumer <StaffProvider>(
      builder: (context, provider, child) => Scaffold(
        appBar: mAppBar(title: scoreManagement),
        body: SingleChildScrollView(
          child: Column(
            //ainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///players photo/////////////////////////////////////////////////////
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: height * .13,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          child: Image.asset(
                            'assets/images/player1.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                            width: width * .3,
                            child: white16Text(
                                text: player1, align: TextAlign.center))
                      ],
                    ),
                    Container(
                      height: height * .13,
                      alignment: Alignment.center,
                      child: Text(
                        vs,
                        style: TextStyle(
                            color: MyAppTheme.challengeBtnBgColor,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: height * .13,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          child: Image.asset(
                            'assets/images/player2.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                            width: width * .3,
                            child: white16Text(
                                text: player2, align: TextAlign.center))
                      ],
                    ),
                  ],
                ),
              ),

              ///Timer/////////////////////////////////////////////////////
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(
                    color: MyAppTheme.cardBgSecColor,
                  ),
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: width * .6,
                      child: RichText(
                        text: TextSpan(
                          text: provider.hours,
                          style: MyStyles.white30SemiBold,
                          children: [
                            TextSpan(
                              text: ' hours  ',
                              style: MyStyles.white14Light
                            ),
                            TextSpan(
                              text: provider.min,
                              style: MyStyles.white30SemiBold
                            ),
                            TextSpan(
                              text: ' min  ',
                              style: MyStyles.white14Light
                            ),
                            TextSpan(
                              text: provider.sec,
                              style: MyStyles.white30SemiBold
                            ),TextSpan(
                              text: ' sec ',
                              style: MyStyles.white14Light
                            ),
                          ]
                        ),
                      )
                    ),
                    GestureDetector(
                      onTap: provider.stop,
                      child: Container(
                        height: 45,
                        width: 45,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: MyAppTheme.cardBgColor,
                        ),
                        child: SvgPicture.asset(
                          'assets/images/pause_ic.svg',
                          height: 15,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: provider.start,
                      child: Container(
                        height: 45,
                        width: 45,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: MyAppTheme.MainColor,
                        ),
                        child: SvgPicture.asset(
                          'assets/images/play_ic.svg',
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              ///Toss and Service///////////////////////////////////////////
              Container(
                decoration: BoxDecoration(
                    border: Border.symmetric(
                        horizontal:
                            BorderSide(color: MyAppTheme.cardBgSecColor))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: width * .48,
                      padding: const EdgeInsets.only(left: 6, top: 8, bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          titleText(text: tossWon),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  provider.player1WonToss();
                                },
                                child: (provider.player1Toss)
                                    ? selectedContainer(text: player1,height: 35)
                                    : unSelectedContainer(text: player1,height: 35)
                              ),
                              GestureDetector(
                                onTap: () {
                                  provider.player2WonToss();
                                },
                                child: (provider.player2Toss)
                                    ? selectedContainer(text: player2,height: 35)
                                    : unSelectedContainer(text: player2,height: 35)
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: width * .48,
                      padding: const EdgeInsets.only(left: 6, top: 8, bottom: 8),
                      decoration: BoxDecoration(
                          border: Border(
                        left: BorderSide(
                          color: MyAppTheme.cardBgSecColor,
                        ),
                      )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          titleText(text: service),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  provider.player1DoingService();
                                },
                                child: (provider.player1Service)
                                    ? selectedContainer(text: player1,height: 35)
                                    : unSelectedContainer(text: player1,height: 35)
                              ),
                              GestureDetector(
                                onTap: () {
                                  provider.player2DoingService();
                                },
                                child: (provider.player2Service)
                                    ? selectedContainer(text: player2,height: 35)
                                    : unSelectedContainer(text: player2,height: 35)
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              ///Scores.../// //// /////////////////////////////////////////

              ///Score Text and Undo btn
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    titleText(text: scores),
                    GestureDetector(
                      onTap: provider.reset,
                      child: Row(
                        children: [
                          Text(
                            undo,
                            style: MyStyles.mainClr14Light,
                          ),
                          SizedBox(
                              height: 24,
                              width: 24,
                              child:
                                  SvgPicture.asset('assets/images/undo_ic.svg'))
                        ],
                      ),
                    )
                  ],
                ),
              ),

              ///header of Score
              Container(
                color: MyAppTheme.cardBgSecColor,
                height: height * .04,
                alignment: Alignment.centerRight,
                //padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      white12Text(text: set1, align: TextAlign.center),
                      white12Text(text: set2),
                      white12Text(text: set3),
                      white12Text(text: points),
                    ]
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Align(
                                alignment: Alignment.center,
                                child: e,
                              ),
                            ))
                        .toList()

                    //.map((e) => Padding(padding: const EdgeInsets.only(right: 10),child: e,)).toList(),
                    ),
              ),

              ///player 1
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width * .22,
                            child: Row(
                              children: [
                                subTitleText(text: player1),
                                Visibility(
                                    visible: provider.player1Service,
                                    child: SvgPicture.asset(
                                        'assets/images/ball_ic.svg'))
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if(provider.setScoreForLive.length<=3){
                                provider.pointWonBy(0, provider.idx);
                              }
                            },
                            child: Container(
                              height: 38,
                                width: 38,
                                margin: const EdgeInsets.only(right: 8),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: MyAppTheme.MainColor,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: MyAppTheme.whiteColor,
                                  size: 25,
                                )),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      height: height * .05,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: provider.setScore.length + 1,
                          itemBuilder: (context, index) {
                            if (index == provider.scoresList.length - 1) {
                              return selectedContainer35(
                                  text: provider.getGameScore(index: 0));
                            }
                            return unSelectedContainer35(
                                text: provider.setScore[index][0].toString());
                          }),
                    )
                  ],
                ),
              ),
              Divider(thickness: 1, color: MyAppTheme.cardBgSecColor),

              ///player 2
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width * .22,
                            child: Row(
                              children: [
                                subTitleText(text: player2),
                                Visibility(
                                    visible: provider.player2Service,
                                    child: SvgPicture.asset(
                                        'assets/images/ball_ic.svg'))
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if(provider.setScoreForLive.length<=3){
                                provider.pointWonBy(1, provider.idx);
                              }
                            },
                            child: Container(
                                height: 38,
                                width: 38,
                                margin: const EdgeInsets.only(right: 8),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: MyAppTheme.MainColor,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: MyAppTheme.whiteColor,
                                  size: 25,
                                )),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      height: height * .05,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: provider.setScore.length + 1,
                          itemBuilder: (context, index) {
                            if (index == provider.scoresList.length - 1) {
                              return selectedContainer35(
                                  text: provider.getGameScore(index: 1));
                            }
                            return unSelectedContainer35(
                                text: provider.setScore[index][1].toString());
                          }),
                    )
                  ],
                ),
              ),
              Divider(thickness: 1, color: MyAppTheme.cardBgSecColor),

              ///Score sheet/////////////////////////////////////////////////////
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleText(text: scoreSheet),
                    LiveNowContainer(
                        height: height * .2, time: '0 min', roundName: qualRnd1,setList: provider.setScoreForLive,pointList: [provider.getGameScore(index: 0),provider.getGameScore(index: 1)],)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
