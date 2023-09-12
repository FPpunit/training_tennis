import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../../../custom/helpers.dart';
import '../../../../utils/apis_name.dart';

class AdminStaffRepo {
  Future addStaff(
      BuildContext context, String name, String phone, String email) async {
    OverlayEntry loader = Helpers.overlayLoader(context);
    Overlay.of(context).insert(loader);
    Uri url;
    url = Uri.parse('$baseUrl$createStaff');
    var headers = {
      'Content-Type': 'application/json',
      "Accept": "application/json",
      'Authorization': 'Bearer $token'
    };
    var map = <String, dynamic>{};
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    http.Response response = await http.post(
      url,
      headers: headers,
      body: json.encode(map),
    );
    if (response.statusCode == 200) {
      Helpers.hideLoader(loader);
      bool status;
      status = json.decode(response.body)['status'];
      if (status == true) {
        return response;
      } else {
        return response;
      }
    } else if (response.statusCode == 403) {
      Helpers.hideLoader(loader);
      Helpers.messagetoastfalse(context, json.decode(response.body)['message']);
    } else if (response.statusCode == 422) {
      Helpers.hideLoader(loader);
      Helpers.messagetoastfalse(
          context, json.decode(response.body)['errors']['role'].toString());
    } else if (response.statusCode == 500) {
      Helpers.hideLoader(loader);
      Helpers.messagetoastfalse(context, json.decode(response.body)['message']);
    } else {
      Helpers.hideLoader(loader);
      if (kDebugMode) {
        print(response.statusCode);
      }
    }
  }

  Future updateStaffDetails(BuildContext context, int id, String name,
      String phone, String email) async {
    OverlayEntry loader = Helpers.overlayLoader(context);
    Overlay.of(context).insert(loader);
    Uri url;
    url = Uri.parse('$baseUrl$updateStaff$id');
    var headers = {
      'Content-Type': 'application/json',
      "Accept": "application/json",
      'Authorization': 'Bearer $token'
    };
    var map = <String, dynamic>{};
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    http.Response response = await http.post(
      url,
      headers: headers,
      body: json.encode(map),
    );
    if (response.statusCode == 200) {
      Helpers.hideLoader(loader);
      bool status;
      status = json.decode(response.body)['status'];
      if (status == true) {
        return response;
      } else {
        return response;
      }
    } else if (response.statusCode == 403) {
      Helpers.hideLoader(loader);
      Helpers.messagetoastfalse(context, json.decode(response.body)['message']);
    } else if (response.statusCode == 422) {
      Helpers.hideLoader(loader);
      Helpers.messagetoastfalse(
          context, json.decode(response.body)['errors']['role'].toString());
    } else if (response.statusCode == 500) {
      Helpers.hideLoader(loader);
      Helpers.messagetoastfalse(context, json.decode(response.body)['message']);
    } else {
      Helpers.hideLoader(loader);
      if (kDebugMode) {
        print(response.statusCode);
      }
    }
  }


  Future deleteStaffFun(
      {required BuildContext context, required int id}) async {
    OverlayEntry loader = Helpers.overlayLoader(context);
    Overlay.of(context).insert(loader);
    Uri url;
    url = Uri.parse('$baseUrl$deleteStaff$id');
    var headers = {
      'Content-Type': 'application/json',
      "Accept": "application/json",
      'Authorization': 'Bearer $token'
    };

    http.Response response = await http.post(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Helpers.hideLoader(loader);
      bool status;
      status = json.decode(response.body)['status'];
      if (status == true) {
        return response;
      } else {
        return response;
      }
    } else if (response.statusCode == 403) {
      Helpers.hideLoader(loader);
      Helpers.messagetoastfalse(context, json.decode(response.body)['message']);
    } else if (response.statusCode == 422) {
      Helpers.hideLoader(loader);
      Helpers.messagetoastfalse(
          context, json.decode(response.body)['errors']['role'].toString());
    } else if (response.statusCode == 500) {
      Helpers.hideLoader(loader);
      Helpers.messagetoastfalse(context, json.decode(response.body)['message']);
    } else {
      Helpers.hideLoader(loader);
      if (kDebugMode) {
        print(response.statusCode);
      }
    }
  }

  Future fetchStaffList(BuildContext context) async {
    // OverlayEntry loader = Helpers.overlayLoader(context);
    // Overlay.of(context).insert(loader);
    Uri url;
    url = Uri.parse('$baseUrl$staffList');
    var headers = {
      "Accept": "application/json",
      'Authorization': 'Bearer $token'
    };

    http.Response response = await http.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      // Helpers.hideLoader(loader);
      bool status;
      status = json.decode(response.body)['status'];
      if (status == true) {
        return response;
      } else {
        return response;
      }
    } else if (response.statusCode == 403) {
      // Helpers.hideLoader(loader);
      Helpers.messagetoastfalse(context, json.decode(response.body)['message']);
    } else if (response.statusCode == 422) {
      // Helpers.hideLoader(loader);
      Helpers.messagetoastfalse(
          context, json.decode(response.body)['errors']['role'].toString());
    } else if (response.statusCode == 500) {
      // Helpers.hideLoader(loader);
      Helpers.messagetoastfalse(context, json.decode(response.body)['message']);
    } else {
      // Helpers.hideLoader(loader);
      if (kDebugMode) {
        print(response.statusCode);
      }
    }
  }
}
