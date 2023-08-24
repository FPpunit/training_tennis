

import 'package:flutter/material.dart';
import 'package:new_pro/utils/my_app_theme.dart';

import '../../screens/tournament_list/tournament_list.dart';
import '../constants.dart';
import '../my_colors.dart';
import '../my_images.dart';
import '../my_string.dart';
import '../my_styles.dart';

Widget overLapProgressBar ({required BuildContext context , required double percent}){
  return SizedBox(
    height: 8,
    child: Stack(
      children: [
        Container(
          height: 4,
          width: double.infinity,
          color: MyAppTheme.documentBgMainColor,
        ),
        Container(
          height: 4,
          width:  MediaQuery.of(context).size.width * (percent/100),
          color: MyAppTheme.MainColor,
        ),
      ],
    ),
  );
}

AppBar myAppBar(){
  return AppBar(
    centerTitle: true,
    title: Text(
      addTournament,
      style: MyStyles.white20Normal,
    ),
    leading: Padding(
      padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4),
      child: Card(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: MyAppTheme.cardBgColor,
        child: const Icon(
          Icons.arrow_back,
          color: MyAppTheme.whiteColor,
        ),
      ),
    ),
    backgroundColor: MyAppTheme.bgColor,
    elevation: 0,
  );
}
AppBar mAppBar({required String title}){
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: MyStyles.white20Normal,
    ),
    leading: Padding(
      padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4),
      child: Card(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: MyAppTheme.cardBgColor,
        child: const Icon(
          Icons.arrow_back,
          size: 22,
          color: MyAppTheme.whiteColor,
        ),
      ),
    ),
    backgroundColor: MyAppTheme.bgColor,
    elevation: 0,
  );
}

Text titleText ({required String text}){
  return Text(
    text,
    style: MyStyles.white18Regular,
  );
}

Text subTitleText ({required String text,TextAlign? align}){
  return Text(
    text,
    textAlign: align,
    style: MyStyles.white14Regular,
  );
}


Text white10Text ({required String text,TextAlign? align}){
  return Text(
    text,
    textAlign: align,
    style: MyStyles.white10Light,
  );
}

Text white12Text ({required String text,TextAlign? align}){
  return Text(
    text,
    textAlign: align,
    style: MyStyles.white12Light,
  );
}

Text white16Text ({required String text,TextAlign? align}){
  return Text(
    text,
    textAlign: align,
    style: MyStyles.white16Regular,
  );
}

Text white16LightText ({required String text,TextAlign? align}){
  return Text(
    text,
    textAlign: align,
    style: MyStyles.white14Light,
  );
}


Text white22mediumText ({required String text,TextAlign? align}){
  return Text(
    text,
    textAlign: align,
    style: MyStyles.white22Medium,
  );
}

Text underLinedSubHeading({required String text}){
  return Text(
    text,
    style: MyStyles.underLineSubHeading
  );
}

Text hintText({required String text}){
  return Text(
    text,
    style: MyStyles.grey12Regular
  );
}

Text hint14Text({required String text}){
  return Text(
    text,
    style: MyStyles.grey14Regular
  );
}

Widget detailsScreenColumns ({
  required double width,
  required String subTitle,
  required String data,
}) {
  return SizedBox(
    width: width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        subTitleText(text: subTitle),
        hintText(text: data)
      ],
    ),
  );
}

Widget rowHintText ({required double width1,required double width2, required String text1,required String text2}){
  return Row(
    children: [
      SizedBox(
        width: width1,
        child: hintText(text: text1),
      ),
      SizedBox(
        width: width2,
        child: hintText(text: text2),
      ),
    ],
  );
}

Widget selectedQRPictureForTournamentFeePage ({required String qrImg}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
          alignment :Alignment.center,
          child: Image.asset(qrImg)),
      subTitleText(text: qrCodeToPayAndRegister,
          align: TextAlign.center)
    ],
  );
}


Widget selectedContainer ({ required String text , bool isBorderVisible = true}) {
  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.only(right: 10),
    padding: const EdgeInsets.symmetric(
        vertical: 4, horizontal: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: MyAppTheme.documentBgMainColor,
      border: (isBorderVisible) ?Border.all(
          color:  MyAppTheme.MainColor) : null,
    ),
    child: Text(text,
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: MyAppTheme.MainColor
                )),
  );
}

Widget unSelectedContainer ({required String text}){
  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.only(right: 10),
    padding: const EdgeInsets.symmetric(
        vertical: 4, horizontal: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: MyAppTheme.cardBorderBgColor,
      border: Border.all(
          color: (MyAppTheme.cardBgSecColor),)
    ),
    child: Text( text,
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: (MyAppTheme.whiteColor)),
  ));
}