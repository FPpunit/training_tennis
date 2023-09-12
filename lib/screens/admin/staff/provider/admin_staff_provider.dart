import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:new_pro/screens/admin/staff/repositary/admin_staff_repo.dart';

class AdminStaffProvider extends ChangeNotifier{

  List resultList = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;

 getStaffListData({required BuildContext context}) async {
       _isLoading = true;
       notifyListeners();
    var response =  await AdminStaffRepo().fetchStaffList(context);
    final json = jsonDecode(response.body);
       resultList = json['staff list'];
    _isLoading =false;
    notifyListeners();
    print('contactData-------------------------->$resultList');
    notifyListeners();


  }

  addOrUpdateStaff({required BuildContext context,required bool isDetails,int? index,required String name,required String phone,required String email,}) async {
    http.Response resp;
    if(isDetails){
      resp = await AdminStaffRepo().updateStaffDetails(context, resultList[index!]['id'], name, phone, email);

    }else{
      resp = await AdminStaffRepo().addStaff(context, name, phone, email) ;
    }
    getStaffListData(context: context);
  }

  removeStaff({required BuildContext context,required int index}){
    AdminStaffRepo().deleteStaffFun(context: context,id: resultList[index]['id']);
    getStaffListData(context: context);
  }

}