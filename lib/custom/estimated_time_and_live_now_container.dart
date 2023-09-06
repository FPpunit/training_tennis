import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/constants.dart';
import '../utils/my_app_theme.dart';
import '../utils/ui_helper/ui_helper.dart';

class EstimatedStartTimeContainer extends StatelessWidget {

  double height;
  String estimatedTime;
  String roundName;


  EstimatedStartTimeContainer ({Key? key,required this.height,required this.estimatedTime,required this.roundName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MyAppTheme.cardBgSecColor,
        ),
        child: Column(
          children: [

            ///title container
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),

                child: Row(children: [
                  subTitleText(text: estimatedStartTime),
                  const SizedBox(
                    width: 10,
                  ),
                  hintText(text: estimatedTime),
                  const SizedBox(
                    width: 10,
                  ),
                  hintText(text: roundName),
                ]
                ),
              ),
            ),

            ///Player 1 container
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                color: MyAppTheme.cardBgColor,
                child: Row(
                  children: [
                    white12Text(text: player1)
                  ],
                ),
              ),
            ),
            Divider(
              height: 1,
              color: MyAppTheme.cardBgSecColor,
            ),

            ///Player 2 container
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
                    color: MyAppTheme.cardBgColor),
                child: Row(
                  children: [
                    white12Text(text: player2)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LiveNowContainer extends StatelessWidget {

  double height;
  String time;
  String roundName;
  List<List<int>>? setList;
  List<String>? pointList;
  bool isServiceByPlayer1;
  bool isServiceByPlayer2;



  LiveNowContainer ({Key? key,
    required this.height,
    required this.time,
    required this.roundName,
    this.pointList ,
    this.isServiceByPlayer1 =false,
    this.isServiceByPlayer2 =false,
    this.setList,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width= MediaQuery.of(context).size.width;

    return SizedBox(
      height: height,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MyAppTheme.cardBgSecColor,
        ),
        child: Column(
          children: [

            ///title container
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),

                child: Row(children: [
                  subTitleText(text: liveNow),
                  const SizedBox(
                    width: 8,
                  ),
                  hintText(text: roundName),
                  const SizedBox(
                    width: 8,
                  ),
                  hintText(text: time),
                ]
                ),
              ),
            ),

            ///Player 1 container
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                color: MyAppTheme.cardBgColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    white12Text(text: player1),
                    Visibility(
                        visible: isServiceByPlayer1,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SvgPicture.asset('assets/images/ball_ic.svg'),
                        )),
                    Expanded(
                      child: Container(
                        height: height*.5,
                        alignment: Alignment.centerRight,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: (setList!.length>3)? 3: setList!.length,
                          itemBuilder:(context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: unSelectedContainer35(text: setList![index][0].toString(),));
                          },),
                      ),
                    ),

                    selectedContainer35(text: pointList![0],isBorderVisible: false)
                  ],
                ),
              ),
            ),
            Divider(
              height: 1,
              color: MyAppTheme.cardBgSecColor,
            ),

            ///Player 2 container
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
                  color: MyAppTheme.cardBgColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    white12Text(text: player2),
                    Visibility(
                        visible: isServiceByPlayer2,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SvgPicture.asset('assets/images/ball_ic.svg'),
                        )),
                    Expanded(
                      child: Container(
                        height: height*.5,
                        alignment: Alignment.centerRight,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: (setList!.length>3)? 3: setList!.length,
                          itemBuilder:(context, index) {
                            return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: unSelectedContainer35(text: setList![index][1].toString(),));
                          },),
                      ),
                    ),

                    selectedContainer35(text: pointList![1],isBorderVisible: false)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
