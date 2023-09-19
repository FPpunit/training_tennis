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
  ////////////////////////////////////////////////////////////////////////////
  bool isValueSelected=false;

  List<dynamic> paymentInfoList =[
    {
      'selectedType' : 'PhonePe',
      'upi_id': 'punit@ybl',
      'upi_number': '9799111524',
      'qr_code': MyImages.qrImg,
    },{
      'selectedType' : 'G Pay',
      'upi_id': 'punit@Okiok',
      'upi_number': '9799111524',
      'qr_code': MyImages.qrImg,
    },{
      'selectedType' : 'Pay Pal',
      'upi_id': 'punit@pp',
      'upi_number': '9799111524',
      'qr_code': MyImages.qrImg,
    },
  ];

  List<Map<String,dynamic>> managingPaymentInfoList = [

  ];

  fillDataInitially(){
    if(paymentInfoList.isEmpty){
      managingPaymentInfoList.add({
        "selectedValue" : null,
        "isQRBtnVisible" : false,
        "isQRAdded" : false,
      },);
    }else{
      for(var element in paymentInfoList){
        managingPaymentInfoList.add({
          "selectedValue" : null,
          "isQRBtnVisible" : false,
          "isQRAdded" : true,
        },);
      }
    }
    isValueSelected=true;
    notifyListeners();
  }

  addToManagingList ({required Map<String,dynamic> addingOption}){
    managingPaymentInfoList.add(addingOption);
    isValueSelected = false;
    notifyListeners();
  }

  selectingType(String? value,int index){
    managingPaymentInfoList[index]['selectedValue'] = value;
    managingPaymentInfoList[index]['isQRBtnVisible'] = true;
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
  call(int index){
    managingPaymentInfoList[index]['isQRAdded']=false;
    managingPaymentInfoList[index]['selectedValue']=null;
    managingPaymentInfoList[index]['isQRBtnVisible']=false;
  }

  deletePaymentInfo({required int index}){
    if(index == 0 && managingPaymentInfoList.length==1) {
      // managingPaymentInfoList[index]['status']= 1;
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