
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/my_app_theme.dart';
import 'loader/cricular_loading_widget.dart';

class Helpers {

 //  static Future<bool> verifyInternet() async {
 //    var connectivityResult = await (Connectivity().checkConnectivity());
 //    if (connectivityResult == ConnectivityResult.mobile) {
 //      return true;
 //    } else if (connectivityResult == ConnectivityResult.wifi) {
 //      return true;
 //    }
 //    return false;
 //  }
 //  static String DateFormatString(DateTime date) {
 //    try {
 //      var formatter = new DateFormat('dd-MM-yyyy');
 //      String formattedDate = formatter.format(date);
 //      return '$formattedDate';
 //    } catch (e) {
 //      return '';
 //    }
 //  }
 //  static String addWinnerLoser(String winner,String loser) {
 //    try {
 //      int w = int.parse(winner);
 //      int l = int.parse(loser);
 //      int total = int.parse(winner)+int.parse(loser);
 //      return '$total';
 //    } catch (e) {
 //      return '';
 //    }
 //  }
 //  static String noOfCourtsAvible(int hard,int clay,int carpet,int grass) {
 //    String? Hard,Clay,Carpet,Grass;
 //    try {
 //      Hard = hard > 0 ? 'Hard' : '';
 //      Clay =  clay > 0 ? 'Clay' : '';
 //      Carpet =  carpet > 0 ? 'Carpet' : '';
 //      Grass =   grass > 0 ? 'Grass' : '';
 //      return '$Hard $Clay $Carpet $Grass';
 //    } catch (e) {
 //      return '';
 //    }
 //  }
 //  static String formatDateTimeFromUtc(dynamic time){
 //    print('date and time-------------$time');
 //    try {
 //      return DateFormat("hh:mm:a").format(DateTime.parse(time.toString()));
 //    } catch (e){
 //      return DateFormat("hh:mm:ss").format(DateTime.now());
 //    }
 //  }
 //  static String formatDateFromUtc(dynamic time){
 //    print('date and time-------------$time');
 //    try {
 //      return DateFormat("EEE, MMM dd,yyyy").format(DateTime.parse(time.toString()));
 //    } catch (e){
 //      return DateFormat("hh:mm:ss").format(DateTime.now());
 //    }
 //  }
 //  static String firebaseDateFormat(dynamic time){
 //    print('date and time-------------$time');
 //    try {
 //      if(DateFormat("MMM dd,yyyy").format(DateTime.parse(time.toString())) == DateFormat("MMM dd,yyyy").format(DateTime.now())){
 //        return "Today";
 //      }else {
 //        return DateFormat("MMM dd,yyyy").format(DateTime.parse(time.toString()));
 //      }
 //
 //    } catch (e){
 //      return DateFormat("hh:mm:ss").format(DateTime.now());
 //    }
 //  }
 //  static String noOfRoomsAvible(int deluxe,int single) {
 //    String? Deluxe,Single;
 //    try {
 //      Deluxe = deluxe > 0 ? 'Deluxe' : '';
 //      Single = single > 0 ? 'Single' : '';
 //      return '$Deluxe $Single' ;
 //    } catch (e) {
 //      return '';
 //    }
 //  }
 //  static launchURL() async {
 //    const url = 'https://stag.tenniskhelo.com/admin/login';
 //    if (await canLaunchUrl(Uri.parse(url))) {
 //      await launchUrl(Uri.parse(url));
 //    } else {
 //      throw 'Could not launch $url';
 //    }
 //  }
 // static String createRandomCode(int codeLength){
 //    const ch = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
 //    Random r = Random();
 //    return String.fromCharCodes(Iterable.generate(
 //        codeLength, (_) => ch.codeUnitAt(r.nextInt(ch.length))));
 //  }
 //  static String discount(int price, int saleprice) {
 //    try {
 //      double par = ((price - saleprice)/price)*100;
 //      double i = double.parse((par).toStringAsFixed(0));
 //      return '$i %off';
 //    } catch (e) {
 //      return '';
 //    }
 //  }
  static String TotalPrice(String price1, String tax5) {
    try {
      int price = int.parse(price1);
      int tax = int.parse(tax5);
      double tax1 = ((price * tax)/100);
      double i = double.parse((price+tax1).toStringAsFixed(2));
      return '$i';
    } catch (e) {
      return '';
    }
  }
  static String GetTotalPrice(String price1, String tax5) {
    try {
      int price = int.parse(price1);
      int tax = int.parse(tax5);
      double tax1 = ((price * tax)/100);
      double i = double.parse((price-tax1).toStringAsFixed(2));
      return '$i';
    } catch (e) {
      return '';
    }
  }
  static String NormalPrice(int price, int qty) {
    try {
      double tax1 = ((price)/qty);
      double i = double.parse((tax1).toStringAsFixed(2));
      return '$i';
    } catch (e) {
      return '';
    }
  }
  static String ItemsLenth(int lenth) {
    try {
       if(lenth == 1){
         String i = lenth.toString()+' Item';
         return '$i';
       }else{
         String i = lenth.toString()+' Items';
         return '$i';
       }

    } catch (e) {
      return '';
    }
  }
  static String errorString (String errorList){
    var parts = errorList.split('[');
    var prefix = parts[1].trim();
    var pre = prefix.split(']');
    var fix = pre[0].trim();
    print(fix);
    return fix;
  }
//   static String getTimeFromDateAndTime(DateTime dateTime) {
//     try {
//       return DateFormat.jm().format(dateTime).toString(); //5:08 PM
// // String formattedTime = DateFormat.Hms().format(now);
// // String formattedTime = DateFormat.Hm().format(now);   // //17:08  force 24 hour time
//     }
//     catch (e) {
//       return '';
//     }
//   }
  static String chatTimeSplit(String chatTime){
    var parts = chatTime.split(',');
    var prefix = parts[0].trim();
    var pre = chatTime.split(',');
    var fix = pre[0].trim();
    return chatTime;
  }
  static String DynmicString(String dyname,String stname) {
    try {
      if(dyname!=null){
        return '$dyname';
      }else{
        return '$stname';
      }

    } catch (e) {
      return '';
    }
  }
  static Color colorConvert(String color) {
    color = color.replaceAll("#", "");
    var converted;
    if (color.length == 6) {
      converted = Color(int.parse("0xFF" + color));
    } else if (color.length == 8) {
      converted = Color(int.parse("0x" + color));
    }
    else if (color.length == 3) {
      converted = Color(0xFF3670b7);
    }else{
      converted = Color(0xFFf3a25c);
    }
    return converted;
  }
  static String showMatchStatus(String value){
    if(value == "played"){
      return 'Played Through';
    }else if (value == "expired"){
      return 'Court Time Expired';
    }else if (value == "absent"){
      return 'Opponent No Show';
    }else if (value == "forfeited"){
      return 'Opponent Forfeited';
    }else if (value == "injured"){
      return 'Opponent Injured';
    }else {
      return 'Today';
    }
  }
  static String showShowMyChallengeTitle(String value){
    if(value == "pending"){
      return 'Awaiting ';
    }else if (value == "accepted"){
      return 'Not Started';
    }else if (value == "done"){
      return 'Match Summary';
    }else {
      return 'Rejected';
    }
  }
  // static String ChangeFormat(String date){
  //   DateTime tempDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
  //   var formatterTime = DateFormat('hh:mm a');
  //   return formatterTime.format(tempDate);
  //
  // }
  // static String TrackinTime(String time){
  //   var now = DateTime.now();
  //   var formatterDate = DateFormat('MMM dd');
  //   var formatterTime = DateFormat('hh:mm a');
  //   String actualDate = formatterDate.format(now);
  //   String actualTime = formatterTime.format(now);
  //   String todaytime = actualDate+" "+actualTime;
  //   print('today time ${todaytime}');
  //   if(todaytime == time){
  //     return 'Today';
  //   }else{
  //     return time;
  //   }
  //
  // }
  //
  // static String getCurrentDate(){
  //   var now = DateTime.now();
  //   var formatterDate = DateFormat('dd-MMM-yyyy');
  //   return  formatterDate.format(now);
  // }
  static int getDays(String end_date){
    DateTime dateTimeCreatedAt = DateTime.parse(end_date);
    DateTime dateTimeNow = DateTime.now();
    final differenceInDays = dateTimeCreatedAt.difference(dateTimeNow).inDays;
    print('${differenceInDays}');
    print('${dateTimeNow}');
    print('${dateTimeCreatedAt}');
   /* var now = DateTime.now();
    var formatterDate = DateFormat('yyyy-MM-dd');
    int today = int.parse(formatterDate.format(now));
    int endDate = int.parse(end_date);
    int days = endDate-today;
    print('total days'+days.toString());*/
    return differenceInDays;
  }
  static createSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: MyAppTheme.cardBgColor,
      content: Text(
        message,
        style: const TextStyle(
            fontSize: 12.0,
            //fontFamily: Fonts.oswald,
            fontStyle: FontStyle.normal,
            color: MyAppTheme.whiteColor,
            fontWeight: FontWeight.w400),
      ),
    ));
  }
  static createComingSoonSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: MyAppTheme.MainColor,
      content: Text(
        message,
        style: const TextStyle(
            fontSize: 12.0,
            //fontFamily: Fonts.oswald,
            fontStyle: FontStyle.normal,
            color: MyAppTheme.whiteColor,
            fontWeight: FontWeight.w400),
      ),
    ));
  }
  static createErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: MyAppTheme.errorMessageBackgroundColor,
      content: Text(
        message,
        style: const TextStyle(
            fontSize: 12.0,
            //fontFamily: Fonts.oswald,
            fontStyle: FontStyle.normal,
            color: MyAppTheme.errorMessageTextColor,
            fontWeight: FontWeight.w400),
      ),
    ));
  }
  static showValidationSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 1),
      backgroundColor: MyAppTheme.cardBgSecColor,
      content: Text(
        message,
        style:  TextStyle(
            fontSize: 12.0,
            //fontFamily: Fonts.oswald,
            fontStyle: FontStyle.normal,
            color: MyAppTheme.customTitleColor,
            fontWeight: FontWeight.w400),
      ),
    ));
  }
  static createValidationErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.grey,
      content: Text(
        message,
        style: const TextStyle(
            fontSize: 12.0,
            //fontFamily: Fonts.oswald,
            color: MyAppTheme.black_Color,
            fontWeight: FontWeight.w400),
      ),
    ));
  }
  static InternetConnectedSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: MyAppTheme.colorinactiveThumbColor,
      content: Text(
        message,
        style: const TextStyle(
            fontSize: 12.0,
            //fontFamily: Fonts.oswald,
            fontStyle: FontStyle.normal,
            color: MyAppTheme.whiteColor,
            fontWeight: FontWeight.w400),
      ),
    ));
  }
  static InternetNotConnectSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: MyAppTheme.errorMessageTextColor,
      content: Text(
        message,
        style: const TextStyle(
            fontSize: 12.0,
            //fontFamily: Fonts.oswald,
            fontStyle: FontStyle.normal,
            color: MyAppTheme.whiteColor,
            fontWeight: FontWeight.w400),
      ),
    ));
  }

  static OverlayEntry overlayLoader(context) {
    OverlayEntry loader = OverlayEntry(builder: (context) {
      final size = MediaQuery.of(context).size;
      return Positioned(
        height: size.height,
        width: size.width,
        top: 0,
        left: 0,
        child: Material(
          color:  MyAppTheme.whiteColor.withOpacity(0.0),
          child:  /*SizedBox(
            height: 100,
              width: 100,
              child: Lottie.asset('assets/gifs/green_ball_bounc.json')),*/
          CircularLoadingWidget(height: 200),
        ),
      );
    });
    return loader;
  }
  static String formatTime(int seconds) {
    String getParsedTime(String time) {
      if (time.length <= 1) return "0$time";
      return time;
    }

    int min = seconds ~/ 60;
    int sec = seconds % 60;

    String parsedTime =
        getParsedTime(min.toString()) + " : " + getParsedTime(sec.toString());

    return parsedTime;
  }
  static hideLoader(OverlayEntry loader) {
    Timer(const Duration(milliseconds: 100), () {
      try {
        loader.remove();
      } catch (e) {}
    });
  }
  static String getBase64FormateFile(String path) {
    File file = File(path);
    print('File is = ' + file.toString());
    List<int> fileInByte = file.readAsBytesSync();
    String fileInBase64 = base64Encode(fileInByte);
    return fileInBase64;
  }
  // static Future<void> openMap(double latitude, double longitude) async {
  //   String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
  //   if (await canLaunch(googleUrl)) {
  //     await launch(googleUrl);
  //   } else {
  //     throw 'Could not open the map.';
  //   }
  // }
  static bool isValidAadhaarNumber(String str){
    String pan_pattern = "^[2-9]{1}[0-9]{3}\\s[0-9]{4}\\s[0-9]{4}";
    RegExp regex = RegExp(pan_pattern);
    return (regex.hasMatch(str)) ? true : false;
  }
  static bool validatePANcard(String value) {
    String pan_pattern = "(([A-Za-z]{5})([0-9]{4})([a-zA-Z]))";
    RegExp regex = new RegExp(pan_pattern);
    return (regex.hasMatch(value)) ? true : false;
  }
  static bool validateEmail(String value) {
    String pattern =
        r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
    RegExp regex = new RegExp(pattern);
    return (regex.hasMatch(value)) ? false : true;
  }

  static bool isValidGSTNo(String value){
    String pattern = "^[0-9]{2}[A-Z]{5}[0-9]{4}"
        + "[A-Z]{1}[1-9A-Z]{1}"
        + "Z[0-9A-Z]{1}";
    RegExp regex = new RegExp(pattern);
    return (regex.hasMatch(value)) ? true : false;
  }
  // static String date(String value){
  //   var dateformate = DateFormat('yyyy-MM-dd');
  //   var formatter = DateFormat('dd-MMM-yyyy');
  //   print(value);
  //   if(value != "null" && value.isNotEmpty){
  //     String formattedDate = formatter.format(dateformate.parse(value));
  //     return  formattedDate;
  //   }else{
  //     return  "null";
  //   }
  //
  // }
  static String accounttext(String value) {
    var re = RegExp(r'\d(?!\d{0,3}$)'); // keep last 3 digits
    print('123456789'.replaceAll(re, '-')); // ------789
    return value .replaceAll(re, 'X');
  }
  static bool txtFormat(String value) {
    String pattern =
        r'[a-z]';
    RegExp regex = new RegExp(pattern);
    return (regex.hasMatch(value)) ? true : false;
  }
  static messagetoastfalse(BuildContext context, String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 12.0);
  }
  // static messageValidationToast(BuildContext context, String msg) {
  //   Fluttertoast.showToast(
  //       msg: msg,
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: MyAppTheme.cardBgSecColor,
  //       textColor: MyAppTheme.customTitleColor,
  //       fontSize: 12.0);
  // }
  // static messageToastFalseBottom(BuildContext context, String msg) {
  //   Fluttertoast.showToast(
  //       msg: msg,
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       fontSize: 12.0);
  // }
  // static messageToast(String msg) {
  //   Fluttertoast.showToast(
  //       msg: msg,
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       fontSize: 12.0);
  // }

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }
  Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }
}