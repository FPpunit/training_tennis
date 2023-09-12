import 'dart:convert';

import 'package:flutter/material.dart';

import '../repositary/admin_staff_repo.dart';
class ProviderStaff extends ChangeNotifier{
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

}