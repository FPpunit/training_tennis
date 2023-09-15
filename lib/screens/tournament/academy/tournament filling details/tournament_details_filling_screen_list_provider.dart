import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:new_pro/screens/tournament/academy/repo/create_tournament_repo.dart';


class TournamentDetailsFillingScreenListsProvider extends ChangeNotifier{

  int top = -1;
  String? selectedValue;
  List<dynamic> selectedDataForCat = [
    {
      'type': '',
      'categories': [],
    },
  ];
  List<String> selectedItems = [];


  int topForFee = -1;
  String? selectedCatForFee;
  List<dynamic> selectDataForFee = [
    {
      'type': '',
      'price': '',
    },
  ];

  fillByPrevData({required List<dynamic> category,required List fee}){
    if(category.isNotEmpty){
      selectedDataForCat = category;
      top =selectedDataForCat.length-2;
    }if(fee.isNotEmpty){
      selectDataForFee = fee;
      topForFee = selectDataForFee.length-2;
      addMoreForFee();
    }
    notifyListeners();
  }
  saveDetails(
      {required BuildContext context,
        required String tournamentUUId,
        required String description,
        required List selectedCategoriesData,
        required List selectedFeeData}){
    var body = <String, dynamic>{};
    body['tournament_uuid'] = tournamentUUId;
    body['categories'] = jsonEncode(selectedCategoriesData);
    body['fees'] = jsonEncode(selectedFeeData);
    body['description'] = description;


    CreateTournamentRepo().saveTourDetails(
      context, body
    );
  }

  ///Api calling
  getTournamentList({required BuildContext context}) async {
    http.Response response = await CreateTournamentRepo().getTourDetails(context);
    if(response.body.isNotEmpty){
      List responseList = jsonDecode(response.body)['tournaments'];
      return responseList;
    }
  }

  void addMoreForCat(){
    selectedDataForCat.add({'type': '', 'categories': []});
    top++;
    selectedValue = null;
    selectedItems = [];
    notifyListeners();
  }

  void delete (int index){
    if(index == 0){
      selectedDataForCat[index]['type'] = '';
      selectedDataForCat [index]['categories'] = '';
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
    selectedDataForCat[top + 1]['categories'] = selectedItems;
    notifyListeners();
  }

  void selectedValueFromDropDown ({String? value}){
    selectedValue = value!;
    selectedDataForCat[top + 1]['type'] = selectedValue;
    notifyListeners();
  }

  void addingDataForTournamentFee({String? category , String? text}){
    selectDataForFee[topForFee + 1]['type'] =  (category != null) ? category : '';
    selectDataForFee[topForFee + 1]['price'] = (text != null) ? text : '';
    notifyListeners();
  }

  void addMoreForFee () {
    topForFee++;
    selectedCatForFee = null;
    selectDataForFee.add({'type': '', 'price': ''});
    notifyListeners();
  }

  void deleteAddedFee (int index){
    if (index == 0) {
      selectDataForFee[0]['type'] = '';
      selectDataForFee[0]['price'] = '';
      selectedCatForFee = null;
    } else {
      selectDataForFee.removeAt(index);
      selectedCatForFee = null;
      topForFee--;
    }
    notifyListeners();
  }

}