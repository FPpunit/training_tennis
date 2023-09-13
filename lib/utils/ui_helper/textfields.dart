import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_pro/utils/my_app_theme.dart';

import '../../custom/helpers.dart';
import '../my_colors.dart';
import '../my_styles.dart';


Widget nameTextfield ({required TextEditingController controller , IconData? icon}) {
  return TextFormField(
    
      cursorColor: MyAppTheme.whiteColor,
      style: MyStyles.white16Regular,
      //scrollPadding: EdgeInsets.all(12),
      
      controller: controller,
      enableInteractiveSelection: false,
      validator: (name) {
        if (name!.length >= 3) {
          return null;
        } else {
          return 'Name must contain 3 latter';
        }
      },
      decoration: InputDecoration(
        prefixIcon: (icon != null)
            ? Icon(
          icon,
          color: MyColors.grey,
          size: 22,
        ) : null,
        contentPadding: const EdgeInsets.all(12),
        hintText: 'Enter a Name',
        fillColor: MyAppTheme.cardBorderBgColor,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.cardBgSecColor),
            borderRadius: BorderRadius.circular(10)),
        hintStyle: MyStyles.grey14Light,
        errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
      color: MyAppTheme.challengeBtnBgColor),
      borderRadius:
      BorderRadius.circular(10)
  ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.challengeBtnBgColor),
            borderRadius:
            BorderRadius.circular(10)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.cardBgSecColor),
            borderRadius: BorderRadius.circular(10)),
      ));
}

Widget emailTextfield ({required TextEditingController controller,IconData? icon,}) {
  return TextFormField(

      cursorColor: MyAppTheme.whiteColor,
      style: MyStyles.white16Regular,
      //scrollPadding: EdgeInsets.all(12),
      enableInteractiveSelection: false,
      controller: controller,
      validator: (email) {
        if (Helpers().isEmail(email!)) {
          return null;
        } else {
          return 'Enter a valid email address';
        }
      },
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: MyAppTheme.hintTxtColor,
          size: 22,),
        contentPadding: const EdgeInsets.all(12),
        hintText: 'Enter an Email',
        fillColor: MyAppTheme.cardBorderBgColor,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.cardBgSecColor),
            borderRadius: BorderRadius.circular(10)),
        hintStyle: MyStyles.grey14Light,
        errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
      color: MyAppTheme.challengeBtnBgColor),
      borderRadius:
      BorderRadius.circular(10)
  ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.challengeBtnBgColor),
            borderRadius:
            BorderRadius.circular(10)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.cardBgSecColor),
            borderRadius: BorderRadius.circular(10)),
      ));
}

Widget phoneNumberTextfield({required TextEditingController controller,}){
  return TextFormField(
      cursorColor: MyAppTheme.whiteColor,
      style: MyStyles.white16Regular,
      //scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 24),
      controller: controller,
      enableInteractiveSelection: false,
      inputFormatters: [
        LengthLimitingTextInputFormatter(10),
      ],
      keyboardType: TextInputType.number,
      validator: (phone) {
        if(phone!.length == 10){
          return null;
        }else{
          return 'Enter a valid Phone Number';
        }
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        //counter: const Offstage(),
        prefixIcon: const Icon(
          Icons.call,
          color: MyAppTheme.hintTxtColor,
          size: 22,
        ),
        hintText: '+91-XXXXX-XXXXX',
        fillColor:  MyAppTheme.cardBorderBgColor,

        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.challengeBtnBgColor),
            borderRadius:
            BorderRadius.circular(10)
        ),

        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.cardBgSecColor),
            borderRadius:
            BorderRadius.circular(10)),

        hintStyle: MyStyles.grey14Light,
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.challengeBtnBgColor),
            borderRadius:
            BorderRadius.circular(10)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.cardBgSecColor),
            borderRadius:
            BorderRadius.circular(10)),
      ));
}

Widget disableTextfield ({required TextEditingController controller}) {
  return TextFormField(
      enabled: false,
      controller: controller,
      style: TextStyle(
          color: MyAppTheme.tournamentFeeClr,
          fontSize: 14
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        fillColor: MyAppTheme.cardBorderBgColor,

        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: MyAppTheme.cardBgSecColor),
            borderRadius: BorderRadius.circular(10)),
      )
  );
}
