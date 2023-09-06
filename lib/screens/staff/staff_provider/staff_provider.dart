import 'dart:async';

import 'package:flutter/cupertino.dart';

class StaffProvider with ChangeNotifier{
  bool player1Service = false;
  bool player2Service = false;

  bool player1Toss = false;
  bool player2Toss = false;

  int idx = 0;
  List scoresList = [0, 0, 0, 0];
  List<List<int>> setScoreForLive =[[0,0]];
  List<int> gameScore = [0, 0];
  List<List<int>> setScore = [[0, 0],[0, 0],[0, 0]];
  bool tie = false;


  var selectedIdxForStaffHome = 0;


  selectedIndex(int index){
    selectedIdxForStaffHome = index;
    notifyListeners();
  }


  /// Resets the game, set, and match scores.
  void reset (){
    gameScore = [0, 0];
    setScore = [
      [0, 0],
      [0, 0],
      [0, 0],
    ];
    setScoreForLive =[[0,0]];
    idx = 0;
    tie = false;
    notifyListeners();
  }

  /// This function will be called when the user presses the Reset button
  // void _reset() {
  //   _stop();
  //   _stopwatch.reset();
  //
  //   // Update the UI
  //   setState(() {});
  // }

  void pointWonBy(playerNum, index) {
    // Keep scores simple numeric - "translation" happens in getGameScore.
    gameScore[playerNum]++;

    // Check for victory condition.
    final int minVictory = tie ? 7 : 4;
    final int scoreDiff = (gameScore[1] - gameScore[0]).abs();
    if (gameScore[playerNum] >= minVictory && scoreDiff >= 2) {
      gameWonBy(playerNum, index);
    }
    notifyListeners();
  }

  /// Updates the score by awarding the current game to the specified player.
  /// @param {number} playerNum - The winning player's number (0 or 1).
  void gameWonBy(playerNum, index) {
    // Update game and set scores.
    gameScore = [0, 0];
    setScore[index][playerNum]++;
    setScoreForLive[idx] = setScore[index];

    // Check for victory condition.
    if (setScore[index][playerNum] >= 6) {
      final int scoreDiff = (setScore[index][1] - setScore[index][0]).abs();
      if (tie || scoreDiff >= 2) {
        setWonBy(playerNum, index);
      } else if (scoreDiff == 0) {
        tie = true;
      }
    }
  }

  /// Updates the score by awarding the current set to the specified player.
  /// @param {number} playerNum - The winning player's number (0 or 1).
  void setWonBy(playerNum, index) {
    idx++;
    setScoreForLive.add([0,0]);
    tie = false;
  }

  /// Gets the game's current score, formatted as a string. Special cases for Deuce and Advantage.
  /// @return {string} The current game score.
  getGameScore({required int index}) {
    // Handle tie special case.
    if (tie) {
      return gameScore[index].toString();
    }

    // Handle deuce and advantage state.
    final bool atLeast3 = gameScore.every((v) => v >= 3);
    if (atLeast3) {
      if (gameScore[0] == gameScore[1]) {
        return 'D';
      } else if (gameScore[0] > gameScore[1]) {
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
    return scoreMap[gameScore[index]].toString();
    // return _gameScore.map((v) => scoreMap[v]).join('-');
  }

  final Stopwatch stopwatch = Stopwatch();

  late Timer timer;

  var hours ='00';
  var min ='00';
  var sec ='00';

  void start() {
    /// Timer.periodic() will call the callback function every 100 milliseconds
    timer = Timer.periodic(const Duration(milliseconds: 30), (Timer t) {

      // result in hh:mm:ss format
      hours = (stopwatch.elapsed.inHours % 60).toString().padLeft(2, '0');
      min=stopwatch.elapsed.inMinutes.toString().padLeft(2, '0');
      sec=  (stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0');
      notifyListeners();
    });
    // Start the stopwatch
    stopwatch.start();


  }

  /// This function will be called when the user presses the Stop button
  void stop() {
    timer.cancel();
    stopwatch.stop();
  }


  void player1WonToss(){
    player1Toss = !player1Toss;
    player2Toss = false;
    notifyListeners();
  }
  void player2WonToss(){
    player2Toss = !player2Toss;
    player1Toss = false;
    notifyListeners();
  }

  void player1DoingService(){
    player1Service = !player1Service;
    player2Service = false;
    notifyListeners();
  }
  void player2DoingService(){
    player1Service = false;
    player2Service = !player2Service;
    notifyListeners();
  }
}