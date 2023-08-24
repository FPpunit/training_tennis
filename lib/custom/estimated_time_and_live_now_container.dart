import 'package:flutter/material.dart';

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


  LiveNowContainer ({Key? key,required this.height,required this.time,required this.roundName}) : super(key: key);

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
                  subTitleText(text: liveNow),
                  const SizedBox(
                    width: 10,
                  ),
                  hintText(text: roundName),
                  const SizedBox(
                    width: 10,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: selectedContainer(text: '0',isBorderVisible: false),
                    ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    white12Text(text: player2),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: selectedContainer(text: '0',isBorderVisible: false),
                    ),
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
