import 'package:flutter/cupertino.dart';


class TournamentDetailsFillingScreenListsProvider extends ChangeNotifier{

  int top = -1;
  String? selectedValue;
  List<Map<String, dynamic>> select = [
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

  void add(){
    select.add({'type': '', 'category': []});
    top++;
    selectedValue = null;
    selectedItems = [];
    notifyListeners();
  }

  void delete (int index){
    if(index == 0){
      select[index]['type'] = '';
      select [index]['category'] = '';
      selectedValue = null;
      selectedItems=[];
    }
    else{
      select.removeAt(index);
      selectedValue = null;
      selectedItems=[];
      top--;
    }
    notifyListeners();
  }

  void checkBoxFun({required String item,required bool isSelected}){
    isSelected
        ? selectedItems.remove(item)
        : selectedItems.add(item);

    select[top + 1]['category'] = selectedItems;

    notifyListeners();
  }

  void selectedValueFromDropDown ({String? value}){
    selectedValue = value!;
    select[top + 1]['type'] = selectedValue;

    notifyListeners();
  }

  void addMoreForFee () {
    topForFee++;
    selectedCatForFee = null;
    selectDataForFee
        .add({'type': '', 'fee': ''});
    notifyListeners();
  }

  void addingDataForTournamentFee({String? category , String? text}){
    selectDataForFee[topForFee + 1]['type'] =
        category;
    selectDataForFee[topForFee + 1]['fee'] = text;
    notifyListeners();
  }

  void deleteAddedFee (int index){
    if (index == 0) {
      selectDataForFee[0]
      ['type'] = '';
      selectDataForFee[0]['fee'] =
      '';
      selectedCatForFee = null;
      // feeController.clear();
    } else {
      selectDataForFee
          .removeAt(index);
      selectedCatForFee = null;
      // feeController.clear();
      topForFee--;
    }
    notifyListeners();
  }

}