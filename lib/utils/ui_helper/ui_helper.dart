

import 'package:flutter/material.dart';
import 'package:new_pro/utils/my_app_theme.dart';

import '../../screens/tournament_list/tournament_list.dart';
import '../constants.dart';
import '../my_colors.dart';
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
    backgroundColor: MyAppTheme.transparent,
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

Text subTitleText ({required String text}){
  return Text(
    text,
    style: MyStyles.white14Regular,
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

// Widget tournamentContainer(){
//   return Container(
//     width: width,
//     margin: const EdgeInsets.symmetric(vertical: 5),
//     padding: const EdgeInsets.all(10),
//     decoration: BoxDecoration(
//       color: MyAppTheme.cardBgSecColor,
//       borderRadius: BorderRadius.circular(8),
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Visibility(
//           visible: tournamentList[index]['status'].toString() ==
//               'live',
//           child: Container(
//             width: 100,
//             margin: const EdgeInsets.only(bottom: 5),
//             padding: const EdgeInsets.symmetric(
//                 vertical: 4, horizontal: 8),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(5),
//               color: MyAppTheme.liveBtnFillColor,
//               border: Border.all(
//                   color: MyAppTheme.liveBtnBorderColor),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 //FaIcon(FontAwesomeIcons.towerBroadcast,color: MyAppTheme.liveBtnBorderColor,size: 14,),
//
//                 SvgPicture.asset(MyImages.broadcastIc),
//
//                 Text(
//                   'Live Now',
//                   style: TextStyle(
//                       fontWeight: FontWeight.normal,
//                       fontSize: 12,
//                       color: MyAppTheme.liveBtnBorderColor),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         titleText(
//             text: tournamentList[index]['tournamentName']),
//         Row(
//           children: [
//             const Icon(
//               Icons.calendar_month_outlined,
//               color: MyAppTheme.hintTxtColor,
//               size: 18,
//             ),
//             hintText(
//                 text:
//                 '${tournamentList[index]['startDate']}/${tournamentList[index]['endDate']}')
//           ],
//         )
//       ],
//     ),
//   );
// }