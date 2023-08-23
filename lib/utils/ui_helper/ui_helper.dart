

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


Widget estimatedContainer({
  required double height,
  String duration = min40,

}){
  return SizedBox(
    height: height,
    child: Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              color: MyAppTheme.cardBgSecColor,
            ),
            child: Row(
                children: [
                  SizedBox(width: 10,),
                  subTitleText(text: estimatedStartTime),

                  SizedBox(width: 10,),
                  hintText(text: duration),

                  SizedBox(width: 10,),
                  hintText(text: qualRnd1),


                ]//.map((e) => Padding(padding: EdgeInsets.only(left: 10))).toList(),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: MyAppTheme.cardBgColor,
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                white12Text(text: player1)
              ],
            ),
          ),
        ),
        Divider(
          height: 1,
          color: MyAppTheme.cardBgSecColor,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
                color: MyAppTheme.cardBgColor
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                white12Text(text: player2)
              ],
            ),
          ),
        ),
      ],
    ),
  );
}