import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AdminStaffProvider extends ChangeNotifier{

  List<dynamic> contactData = [];
  static const String token ='626|KHon3CLdfvbK3ElMQSrXdO7Qpbglewn5Q9aG150z';

  getStaffListData() async {

    final uri =Uri.parse("https://api.tenniskhelo.com/api/academy/staff-list");
    final response = await http.get(
        uri,
        headers: {
      'Accept' : 'application/json',
      'Authorization' : 'Bearer $token'
    });
    if(response.statusCode == 200){
      final json = jsonDecode(response.body) as Map;
      contactData = json['staff list'];
      print(contactData);
    }else{

    }
    notifyListeners();
  }

  createStaff({required Map body}) async {

    final uri =Uri.parse("https://api.tenniskhelo.com/api/academy/create-staff");
    final response = await http.post(
        uri,
        headers: {
      'Accept' : 'application/json',
      'Authorization' : 'Bearer $token'
    },
    body: body
    );

    if(response.statusCode == 200){
      getStaffListData();
    }else{
      print('Error ----------------------------------------------------------------------------->');
    }

  }

  updateStaffDetails({required Map body,required int id}) async {
    final uri =Uri.parse("https://api.tenniskhelo.com/api/academy/staff-update/$id");
    final response = await http.post(
        uri,
        headers: {
      'Accept' : 'application/json',
      'Authorization' : 'Bearer $token'
    },
    body: body
    );

    if(response.statusCode == 200){
      getStaffListData();
    }else{
      print('Error ----------------------------------------------------------------------------->');
    }
  }

  deleteStaff({required int id}) async {

    final uri =Uri.parse("https://api.tenniskhelo.com/api/academy/staff-delete/$id");
    final response = await http.post(
        uri,
        headers: {
          'Accept' : 'application/json',
          'Authorization' : 'Bearer $token'
        },

    );

    if(response.statusCode == 200){
      getStaffListData();
    }else{
      print('Error ----------------------------------------------------------------------------->');
    }
  }
  


  addOrUpdateStaff({required bool isDetails,int? index,required String name,required String phone,required String email,}){
    if(isDetails){
      updateStaffDetails(body: {
        'name' : name,
        'phone' : phone,
        'email' : email,
      }, id: contactData[index!]['id']);
    }else{
      createStaff(body: {
        'name' : name,
        'phone' : phone,
        'email' : email,
      });
    }
  }

  removeStaff({required int index}){
    deleteStaff(id: contactData[index]['id']);
  }

}