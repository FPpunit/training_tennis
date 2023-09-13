import 'package:flutter/cupertino.dart';
import 'package:new_pro/screens/tournament/academy/repo/create_tournament_repo.dart';


class TournamentDetailsFillingScreenListsProvider extends ChangeNotifier{

  int top = -1;
  String? selectedValue;
  List<Map<String, dynamic>> selectedDataForCat = [
    {
      'type': '',
      'category': [],
    },
  ];
  List<String> selectedItems = [];


  int topForFee = -1;
  String? selectedCatForFee;
  List<Map<String, dynamic>> selectDataForFee = [
    {
      'type': '',
      'fee': '',
    },
  ];

  saveDetails(
      {required BuildContext context,
        required String tournamentId,
        required String description,
        required List selectedCategoriesData,
        required List selectedFeeData}){
    var body = <String, dynamic>{};
    body['tournament_uuid'] = tournamentId;
    body['categories'] = selectedCategoriesData;
    body['fees'] = selectedFeeData;
    body['description'] = description;



    // CreateTournamentRepo().saveTourDetails(
    //   context,
    //   body
    // );
  }

  void addMoreForCat(){
    selectedDataForCat.add({'type': '', 'category': []});
    top++;
    selectedValue = null;
    selectedItems = [];
    notifyListeners();
  }

  void delete (int index){
    if(index == 0){
      selectedDataForCat[index]['type'] = '';
      selectedDataForCat [index]['category'] = '';
      selectedValue = null;
      selectedItems=[];
    }
    else{
      selectedDataForCat.removeAt(index);
      selectedValue = null;
      selectedItems=[];
      top--;
    }
    notifyListeners();
  }

  void checkBoxFun({required String item,required bool isSelected}){
    isSelected ? selectedItems.remove(item) : selectedItems.add(item);

    selectedDataForCat[top + 1]['category'] = selectedItems;

    notifyListeners();
  }

  void selectedValueFromDropDown ({String? value}){
    selectedValue = value!;
    selectedDataForCat[top + 1]['type'] = selectedValue;
    notifyListeners();
  }

  void addMoreForFee () {
    topForFee++;
    selectedCatForFee = null;
    selectDataForFee.add({'type': '', 'fee': ''});
    notifyListeners();
  }

  void addingDataForTournamentFee({String? category , String? text}){
    selectDataForFee[topForFee + 1]['type'] = category;
    selectDataForFee[topForFee + 1]['fee'] = text;
    notifyListeners();
  }

  void deleteAddedFee (int index){
    if (index == 0) {
      selectDataForFee[0]['type'] = '';
      selectDataForFee[0]['fee'] = '';
      selectedCatForFee = null;
      // feeController.clear();
    } else {
      selectDataForFee.removeAt(index);
      selectedCatForFee = null;
      // feeController.clear();
      topForFee--;
    }
    notifyListeners();
  }

}