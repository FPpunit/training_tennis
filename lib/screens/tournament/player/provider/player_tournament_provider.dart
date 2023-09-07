import 'package:flutter/cupertino.dart';

import '../../../../utils/constants.dart';

class PlayerTournamentProvider extends ChangeNotifier{


  ///Tournament List
  int selectedIdxForTournamentList = 0;
  String selectedCat = 'live';

  List<String> category = ['All','Live', 'Upcoming', 'Joined', 'Completed' ];

  onTap({required int index}){
    selectedIdxForTournamentList = index;
    selectedCat = category[index].toLowerCase();
    notifyListeners();
  }

  ///Tournament Registration
  String? selectedType;
  String? selectedMethod;

  onSelect({required String value}){
    selectedType = value;
    notifyListeners();
  }
  onSelectMethod({required String value}){
    selectedMethod = value;
    notifyListeners();
  }


  ///Tournament Details Screen
  int selectedIdxForTournamentsDetails = 0;
  int selectedIdxForTournamentsDetailsDraw = 0;
  int selectedIdxForTournamentDate = 0;


  bool isSelectedForAllAndLiveBtn = true;

  List<String> cat = [all, open, menSingles, womenSingles, mixedDoubles];


  String selectedCatForTournamentDetails = all;
  String selectedCatForDraw = all;

  onTapOfDateContainer({required int index}){
    selectedIdxForTournamentDate = index;
    notifyListeners();
  }

  onTapOfAll(){
    isSelectedForAllAndLiveBtn = true;
    notifyListeners();
  }

  onTapOfLIve(){
    isSelectedForAllAndLiveBtn = false;
    notifyListeners();
  }

  onTapOfCategoryContainer({required int index}){
    selectedIdxForTournamentsDetails = index;
    selectedCatForTournamentDetails = cat[index].toLowerCase();
    notifyListeners();
  }

  onTapOfDrawCategoryContainer({required int index}){
    selectedIdxForTournamentsDetailsDraw = index;
    selectedCatForDraw = cat[index].toLowerCase();
    notifyListeners();
  }


}