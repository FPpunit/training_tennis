import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:new_pro/screens/tournament/academy/repo/create_tournament_repo.dart';

import '../../../utils/my_images.dart';

class ProviderTournament extends ChangeNotifier{

  List<dynamic> officials = [];
  int count =1;

  increaseCount(){
    count++;
    notifyListeners();
  }

  deleteOfficials(){
    if(officials.length == 2){
      officials.removeLast();
    }
    count--;
    notifyListeners();
  }

  fillStoredData(List data){
    if(data.isNotEmpty){
      count = data.length;
      officials = data;
      notifyListeners();
    }
  }


  editOfficials(List data){
    officials = data;
    notifyListeners();
  }

  saveTournamentOfficials({required BuildContext context,required String tournamentUUID,required List<dynamic> officials}){
    CreateTournamentRepo().saveTourOfficials(context, {
      'tournament_uuid' : tournamentUUID,
      'officials' : jsonEncode(officials)
    });
  }






  ///Payment Info


  List<dynamic> paymentInfoList =[
  ];

  bool isValueSelected = false;

  List<dynamic> managingPaymentInfoList = [
    {
      "selectedValue" : null,
      "isQRBtnVisible" : false,
      "isQRAdded" : false,
      "status" : 1,
    },
  ];

  onPaymentTypeDropDownChange(String? value,int index){
    managingPaymentInfoList[index]['selectedValue'] = value;
    managingPaymentInfoList[index]['isQRBtnVisible'] = true;
    notifyListeners();
  }

  addToManagingList ({required Map addingOption}){
    managingPaymentInfoList.add(addingOption);
    isValueSelected = false;
    notifyListeners();
  }

  addPaymentInfo({required int index ,required bool isValueSelect ,required String upiId,required String upiNumber}){
    managingPaymentInfoList[index]['isQRAdded'] = true;
    managingPaymentInfoList[index]['isQRBtnVisible'] = false;

    isValueSelected = isValueSelect;
    paymentInfoList.add({
      'paymentType' : managingPaymentInfoList[index]['selectedValue'],
      'upi_id' : upiId,
      'upi_number' : upiNumber,
      'img' : MyImages.qrImg
    });
    isValueSelected =true;

    notifyListeners();
  }

  deletePaymentInfo({required int index}){
    if(index == 0) {
      managingPaymentInfoList[index]['status']= 1;
      managingPaymentInfoList[index]['isQRAdded']=false;
      managingPaymentInfoList[index]['selectedValue']=null;
      managingPaymentInfoList[index]['isQRBtnVisible']=false;
    }else{
      managingPaymentInfoList.removeAt(index);
    }
    paymentInfoList.removeAt(index);
    notifyListeners();
  }
}