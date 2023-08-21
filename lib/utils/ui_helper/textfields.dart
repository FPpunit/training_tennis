import 'package:flutter/material.dart';
import 'package:new_pro/utils/my_app_theme.dart';

import '../my_colors.dart';
import '../my_styles.dart';


Widget nameTextfield ({required TextEditingController controller}) {
  return SizedBox(
    height: 50,
    child: TextField(
        cursorColor: MyAppTheme.whiteColor,
        style: MyStyles.white16Regular,
        //scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 24),
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Enter a Name',
          fillColor: MyAppTheme.cardBorderBgColor,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: MyAppTheme.cardBgSecColor),
              borderRadius: BorderRadius.circular(10)),
          hintStyle: MyStyles.grey14Light,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: MyAppTheme.cardBgSecColor),
              borderRadius: BorderRadius.circular(10)),
        )),
  );
}

Widget phoneNumberTextfield({required TextEditingController controller}){
  return SizedBox(
    height: 55,
    child: TextField(
        cursorColor: MyColors.white,
        style: MyStyles.white16Regular,
        //scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 24),
        controller: controller,
        maxLength: 10,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counter: const SizedBox.shrink(),
          prefixIcon: Icon(
            Icons.call,
            color: MyColors.grey,
            size: 22,
          ),
          hintText: '+91-XXXXX-XXXXX',
          fillColor:  MyAppTheme.cardBorderBgColor,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: MyAppTheme.cardBgSecColor),
              borderRadius:
              BorderRadius.circular(10)),
          hintStyle: MyStyles.grey14Light,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: MyAppTheme.cardBgSecColor),
              borderRadius:
              BorderRadius.circular(10)),
        )),
  );
}
