import 'dart:async';

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

  var idx = 0;

  bool player1Service = false;
  bool player2Service = false;

  bool player1Toss = false;
  bool player2Toss = false;

  List scoresList = [0, 0, 0, 0];

  List<int> _gameScore = [0, 0];
  List<List<int>> _setScore = [
    [0, 0],
    [0, 0],
    [0, 0],
  ];
  List<int> _matchScore = [0, 0];
  bool _tie = false;

  /// Updates the score by giving a point to the specified player.
  /// @param {number} playerNum - The scoring player's number (0 or 1).
  void _pointWonBy(playerNum, index) {
    setState(() {
      // Keep scores simple numeric - "translation" happens in getGameScore.
      _gameScore[playerNum]++;

      // Check for victory condition.
      final int minVictory = _tie ? 7 : 4;
      final int scoreDiff = (_gameScore[1] - _gameScore[0]).abs();
      if (_gameScore[playerNum] >= minVictory && scoreDiff >= 2) {
        _gameWonBy(playerNum, index);
      }
    });
  }

  /// Updates the score by awarding the current game to the specified player.
  /// @param {number} playerNum - The winning player's number (0 or 1).
  void _gameWonBy(playerNum, index) {
    // Update game and set scores.
    _gameScore = [0, 0];
    _setScore[index][playerNum]++;

    // Check for victory condition.
    if (_setScore[index][playerNum] >= 6) {
      final int scoreDiff = (_setScore[index][1] - _setScore[index][0]).abs();
      if (_tie || scoreDiff >= 2) {
        _setWonBy(playerNum, index);
      } else if (scoreDiff == 0) {
        _tie = true;
      }
    }
  }

  /// Updates the score by awarding the current set to the specified player.
  /// @param {number} playerNum - The winning player's number (0 or 1).
  void _setWonBy(playerNum, index) {
    // Update set and match scores, and reset tie flag.
    // Note: This is undefined behaviour according to the assignment.
    //_setScore[index] = [0, 0];
    idx++;
    _tie = false;
  }

  /// Resets the game, set, and match scores.
  void _reset() {
    setState(() {
      _gameScore = [0, 0];
      _setScore = [
        [0, 0],
        [0, 0],
        [0, 0],
      ];
      idx = 0;
      _matchScore = [0, 0];
      _tie = false;
    });
  }

  /// Gets the game's current score, formatted as a string. Special cases for Deuce and Advantage.
  /// @return {string} The current game score.
  _getGameScore({required int index}) {
    // Handle tie special case.
    if (_tie) {
      return _gameScore[index].toString();
    }

    // Handle deuce and advantage state.
    final bool atLeast3 = _gameScore.every((v) => v >= 3);
    if (atLeast3) {
      if (_gameScore[0] == _gameScore[1]) {
        return 'D';
      } else if (_gameScore[0] > _gameScore[1]) {
        if (index == 0) {
          return 'A';
        } else {
          return "-";
        }
      } else {
        if (index == 1) {
          return 'A';
        } else {
          return "-";
        }
      }
    }

    // Default score behaviour, using 0, 15, 30, 40.
    const List<int> scoreMap = [0, 15, 30, 40];
    return scoreMap[_gameScore[index]].toString();
    // return _gameScore.map((v) => scoreMap[v]).join('-');
  }

  /// Timer ///
  ///

  final Stopwatch _stopwatch = Stopwatch();

  // Timer
  late Timer _timer;

  // The result which will be displayed on the screen
  dynamic _result = '00:00:00';

  /// This function will be called when the user presses the Start button
  void _start() {
    /// Timer.periodic() will call the callback function every 100 milliseconds
    _timer = Timer.periodic(const Duration(milliseconds: 30), (Timer t) {
      // Update the UI
      setState(() {
        // result in hh:mm:ss format
        _result =
            '${(_stopwatch.elapsed.inHours % 60).toString().padLeft(2, '0')}:${_stopwatch.elapsed.inMinutes.toString().padLeft(2, '0')}:${(_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0')}';

      });
    });
    // Start the stopwatch
    _stopwatch.start();
  }


  // Widget getTime(){
  //   return RichText(
  //     text: TextSpan(
  //       text: (_stopwatch.elapsed.inHours % 60).toString().padLeft(2, '0'),
  //       style: MyStyles.white30SemiBold,
  //       children: const <TextSpan>[
  //         TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
  //         TextSpan(text: ' world!'),
  //       ],
  //     ),
  //   );
  // }

  /// This function will be called when the user presses the Stop button
  void _stop() {
    _timer.cancel();
    _stopwatch.stop();
  }

  /// This function will be called when the user presses the Reset button
  // void _reset() {
  //   _stop();
  //   _stopwatch.reset();
  //
  //   // Update the UI
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: mAppBar(title: scoreManagement),
      body: SingleChildScrollView(
        child: Column(
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

            ///Timer
            Container(
              padding: EdgeInsets.all(5),
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
                    child: Text(
                      _result,
                      style: const TextStyle(
                          fontSize: 30.0, color: MyAppTheme.whiteColor),
                    ),
                  ),
                  GestureDetector(
                    onTap: _stop,
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
                    onTap: _start,
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

            ///Toss and Service
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
                                player1Toss = !player1Toss;
                                player2Toss = false;
                                setState(() {});
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: (player1Toss)
                                      ? MyAppTheme.documentBgMainColor
                                      : MyAppTheme.cardBorderBgColor,
                                  border: Border.all(
                                      color: (player1Toss)
                                          ? MyAppTheme.MainColor
                                          : MyAppTheme.cardBgSecColor),
                                ),
                                child: Text(player1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: (player1Toss)
                                            ? MyAppTheme.MainColor
                                            : MyAppTheme.whiteColor)),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                player2Toss = !player2Toss;
                                player1Toss = false;
                                setState(() {});
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: (player2Toss)
                                      ? MyAppTheme.documentBgMainColor
                                      : MyAppTheme.cardBorderBgColor,
                                  border: Border.all(
                                      color: (player2Toss)
                                          ? MyAppTheme.MainColor
                                          : MyAppTheme.cardBgSecColor),
                                ),
                                child: Text(player2,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: (player2Toss)
                                            ? MyAppTheme.MainColor
                                            : MyAppTheme.whiteColor)),
                              ),
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
                                player1Service = !player1Service;
                                player2Service = false;
                                setState(() {});
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: (player1Service)
                                      ? MyAppTheme.documentBgMainColor
                                      : MyAppTheme.cardBorderBgColor,
                                  border: Border.all(
                                      color: (player1Service)
                                          ? MyAppTheme.MainColor
                                          : MyAppTheme.cardBgSecColor),
                                ),
                                child: Text(player1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: (player1Service)
                                            ? MyAppTheme.MainColor
                                            : MyAppTheme.whiteColor)),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                player1Service = false;
                                player2Service = !player2Service;
                                setState(() {});
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: (player2Service)
                                      ? MyAppTheme.documentBgMainColor
                                      : MyAppTheme.cardBorderBgColor,
                                  border: Border.all(
                                      color: (player2Service)
                                          ? MyAppTheme.MainColor
                                          : MyAppTheme.cardBgSecColor),
                                ),
                                child: Text(player2,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: (player2Service)
                                            ? MyAppTheme.MainColor
                                            : MyAppTheme.whiteColor)),
                              ),
                            ),
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
                  GestureDetector(
                    onTap: _reset,
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

            Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * .45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * .22,
                          child: Row(
                            children: [
                              subTitleText(text: player1),
                              Visibility(
                                  visible: player1Service,
                                  child: SvgPicture.asset(
                                      'assets/images/ball_ic.svg'))
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _pointWonBy(0, idx);
                          },
                          child: Container(
                            height: 35,
                              width: 35,
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
                    width: width * .5,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: _setScore.length + 1,
                        itemBuilder: (context, index) {
                          if (index == scoresList.length - 1) {
                            return selectedContainer35(
                                text: _getGameScore(index: 0));
                          }
                          return unSelectedContainer35(
                              text: _setScore[index][0].toString());
                        }),
                  )
                ],
              ),
            ),
            Divider(thickness: 1, color: MyAppTheme.cardBgSecColor),

            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * .45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * .22,
                          child: Row(
                            children: [
                              subTitleText(text: player2),
                              Visibility(
                                  visible: player2Service,
                                  child: SvgPicture.asset(
                                      'assets/images/ball_ic.svg'))
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _pointWonBy(1, idx);
                          },
                          child: Container(
                              height: 35,
                              width: 35,
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
                    width: width * .5,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: _setScore.length + 1,
                        itemBuilder: (context, index) {
                          if (index == scoresList.length - 1) {
                            return selectedContainer35(
                                text: _getGameScore(index: 1));
                          }
                          return unSelectedContainer35(
                              text: _setScore[index][1].toString());
                        }),
                  )
                ],
              ),
            ),
            Divider(thickness: 1, color: MyAppTheme.cardBgSecColor),

            ///Score sheet

            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleText(text: scoreSheet),
                  LiveNowContainer(
                      height: height * .2, time: '0 min', roundName: qualRnd1)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
