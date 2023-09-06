import 'package:flutter/cupertino.dart';

class AdminStaffProvider extends ChangeNotifier{
  List<Map<String,dynamic>> contactData = [
    {
      'name' : 'Punit Lohani',
      'phoneNumber' : '+919876543210',
      'email': 'punitlohani@gmail.com'
    },{
      'name' : 'Anny',
      'phoneNumber' : '+919876543210',
      'email': 'punitlohani@gmail.com'
    },
    {
      'name' : 'Anny H',
      'phoneNumber' : '+919876543210',
      'email': 'punitlohani@gmail.com'
    },
  ];


  void addStaff ({required String name,required String phoneNumber,required String email,bool isDetails = false}){
    if(isDetails){
      contactData[0]['name'] = name;
      contactData[0]['phoneNumber'] = phoneNumber;
      contactData[0]['email'] = email;
    }else{
      contactData.add({
        'name' : name,
        'phoneNumber' : phoneNumber,
        'email' : name,
      });
    }
    notifyListeners();
  }

  void removeStaff({required int index}){
    contactData.removeAt(index);
  }

}