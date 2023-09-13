import 'dart:convert';



import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


import '../../../../utils/apis_name.dart';
import '../repository/admin_staff_repo.dart';

class AdminStaffProvider extends ChangeNotifier{

  List resultList = [];
  List staffList = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;


 getStaffListData({required BuildContext context}) async {
       _isLoading = true;
       notifyListeners();
    var response =  await AdminStaffRepo().fetchStaffList(context);
       resultList = jsonDecode(response.body)['staff list'];

       print('resulList =====================>$resultList');
    _isLoading =false;
    notifyListeners();
    return resultList;

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

  removeStaff({required BuildContext context,required int index}) async {
   AdminStaffRepo().deleteStaffFun(context: context,id: resultList[index]['id']).then((value) {
     // print('value =============================>$value');
     Navigator.pop(context);
     getStaffListData(context: context);
      return value;
    });

  }

}



// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
//
// class AdminStaffProvider extends ChangeNotifier{
//
//
//   List<dynamic> resultList = [];
//   static const String token ='626|KHon3CLdfvbK3ElMQSrXdO7Qpbglewn5Q9aG150z';
//
//   getStaffListData() async {
//
//     final uri =Uri.parse("https://api.tenniskhelo.com/api/academy/staff-list");
//     final response = await http.get(
//         uri,
//         headers: {
//       'Accept' : 'application/json',
//       'Authorization' : 'Bearer $token'
//     });
//     if(response.statusCode == 200){
//       final json = jsonDecode(response.body) as Map;
//       resultList = json['staff list'];
//       print(resultList);
//     }else{
//
//     }
//     notifyListeners();
//   }
//
//   createStaff({required Map body}) async {
//
//     final uri =Uri.parse("https://api.tenniskhelo.com/api/academy/create-staff");
//     final response = await http.post(
//         uri,
//         headers: {
//       'Accept' : 'application/json',
//       'Authorization' : 'Bearer $token'
//     },
//
//     body: body
//     );
//
//     if(response.statusCode == 200){
//       getStaffListData();
//     }else{
//       print('Error ----------------------------------------------------------------------------->');
//     }
//
//   }
//
//   updateStaffDetails({required Map body,required int id}) async {
//     final uri =Uri.parse("https://api.tenniskhelo.com/api/academy/staff-update/$id");
//     final response = await http.post(
//         uri,
//         headers: {
//       'Accept' : 'application/json',
//       'Authorization' : 'Bearer $token'
//     },
//
//     body: body
//     );
//
//     if(response.statusCode == 200){
//       getStaffListData();
//     }else{
//       print('Error ----------------------------------------------------------------------------->');
//     }
//   }
//
//   deleteStaff({required int id}) async {
//
//     final uri =Uri.parse("https://api.tenniskhelo.com/api/academy/staff-delete/$id");
//     final response = await http.post(
//         uri,
//         headers: {
//           'Accept' : 'application/json',
//           'Authorization' : 'Bearer $token'
//         },
//
//     );
//
//     if(response.statusCode == 200){
//       getStaffListData();
//     }else{
//       print('Error ----------------------------------------------------------------------------->');
//     }
//   }
//
//
//   addOrUpdateStaff({required bool isDetails,int? index,required String name,required String phone,required String email,}) {
//     if (isDetails) {
//       resultList[index!]['name'] = name;
//       resultList[index]['phoneNumber'] = phone;
//       resultList[index]['email'] = email;
//       updateStaffDetails(body: {
//         'name': name,
//         'phone': phone,
//         'email': email,
//       }, id: resultList[index]['id']);
//     }
//     else {
//       resultList.add({
//         createStaff(body: {
//           'name': name,
//           'phoneNumber': phone,
//           'phone': phone,
//           'email': email,
//         })
//       });
//     }
//   }
//
//   removeStaff({required int index}) {
//     resultList.removeAt(index);
//     notifyListeners();
//     deleteStaff(id: resultList[index]['id']);
//   }
// }
