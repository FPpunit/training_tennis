import 'package:flutter/cupertino.dart';

class AdminStaffProvider extends ChangeNotifier{

  List<Map<String,dynamic>> contactData = [
    {
      'name' : 'Punit Lohani',
      'phoneNumber' : '9876543210',
      'email': 'punitlohani@gmail.com'
    },{
      'name' : 'Anny H',
      'phoneNumber' : '9876543210',
      'email': 'punitlohani@gmail.com'
    },
    {
      'name' : 'Anny ',
      'phoneNumber' : '9876543210',
      'email': 'punitlohani@gmail.com'
    },
  ];

  addOrUpdateStaff({required bool isDetails,int? index,required String name,required String phone,required String email,}){
    if(isDetails){
      contactData[index!]['name'] = name;
      contactData[index!]['phoneNumber'] = phone;
      contactData[index!]['email'] = email;
    }else{
      contactData.add({
        'name' : name,
        'phoneNumber' : phone,
        'email' : email,
      });
    }
    notifyListeners();
  }

  removeStaff({required int index}){
    contactData.removeAt(index);
    notifyListeners();
  }

}