import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart'as http;

import '../../../../custom/helpers.dart';
import '../../../../utils/apis_name.dart';

class CreateTournamentRepo{

  Future saveTourDetails(BuildContext context, Map body) async {
    OverlayEntry loader = Helpers.overlayLoader(context);
    Overlay.of(context)!.insert(loader);
    Uri url;
    url = Uri.parse('$baseUrl$saveTournamentDetails');
    var headers = {
      "Accept": "application/json",
      'Authorization': 'Bearer $token'
    };

    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    if (response.statusCode == 200) {
      Helpers.hideLoader(loader);
      bool status;
      status = json.decode(response.body)['status'];
      if (status == true) {
        print('Save Details Successfully--------------------------');
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

  Future saveTourOfficials(BuildContext context, Map body) async {
    OverlayEntry loader = Helpers.overlayLoader(context);
    Overlay.of(context)!.insert(loader);
    Uri url;
    url = Uri.parse('$baseUrl$saveTournamentOfficial');
    var headers = {
      "Accept": "application/json",
      'Authorization': 'Bearer $token'
    };

    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    if (response.statusCode == 200) {
      Helpers.hideLoader(loader);
      bool status;
      status = json.decode(response.body)['status'];
      if (status == true) {
        print('Save Officials Successfully--------------------------');
        Helpers.hideLoader(loader);
        Helpers.messagetoastfalse(context, 'Officials Save Successfully');
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

  Future getTourDetails(BuildContext context) async {
    OverlayEntry loader = Helpers.overlayLoader(context);
    Overlay.of(context)!.insert(loader);
    Uri url;
    url = Uri.parse('$baseUrl$getTournamentDetails');
    var headers = {
      "Accept": "application/json",
      'Authorization': 'Bearer $token'
    };

    http.Response response = await http.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      Helpers.hideLoader(loader);
      bool status;
      status = json.decode(response.body)['status'];
      if (status == true) {
        print('get Details List Successfully--------------------------');
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
}