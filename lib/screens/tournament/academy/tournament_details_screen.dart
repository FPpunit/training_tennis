import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_pro/utils/my_images.dart';
import 'package:new_pro/utils/my_styles.dart';
import 'package:new_pro/utils/ui_helper/ui_helper.dart';

import '../../../utils/constants.dart';
import '../../../utils/my_app_theme.dart';



class TournamentDetailsScreen extends StatelessWidget {
  late double height;
  late double width;
  late double widthForContainer;
  Map tournamentList;
  String type;


  List<String> rules =[
    dummyRule,
    dummyRule,
    dummyRule,
  ];

  TournamentDetailsScreen({Key? key, required this.tournamentList ,required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    widthForContainer= width*.47;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [


              SingleChildScrollView(
                child: Column(
                  children: [

                    ///Banner
                    SizedBox(
                      height: height*0.32,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(15)),
                        child: Image.network(
                          tournamentList['image_url'],
                          width: width,
                          fit: BoxFit.cover,

                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(left: 8,right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          underLinedSubHeading(text: basicInfo),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              detailsScreenColumns (
                                width: widthForContainer,
                                subTitle: tourName,
                                data: tournamentList['name']
                              ),
                              detailsScreenColumns (
                                width: widthForContainer,
                                subTitle: tourDrawType,
                                data: tournamentList['drawtype']
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              detailsScreenColumns (
                                width: widthForContainer,
                                subTitle: tourStartDate,
                                data: tournamentList['tourstartdate']
                              ),
                              detailsScreenColumns (
                                width: widthForContainer,
                                subTitle: tourEndDate,
                                data: tournamentList['tourenddate']
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              detailsScreenColumns (
                                width: widthForContainer,
                                subTitle: tourState,
                                data: tournamentList['details']['state_name']
                              ),
                              detailsScreenColumns (
                                width: widthForContainer,
                                subTitle: tourCity,
                                data: tournamentList['details']['city_name'].toString()
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              detailsScreenColumns (
                                width: widthForContainer,
                                subTitle: entryDeadline,
                                data: tournamentList['details']['entrydeadline']
                              ),
                              detailsScreenColumns (
                                width: widthForContainer,
                                subTitle: withdrawDeadLine,
                                data: tournamentList['details']['withdrawdeadline']
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              detailsScreenColumns (
                                width: widthForContainer,
                                subTitle: sets,
                                data: tournamentList['sets'].toString()
                              ),
                              detailsScreenColumns (
                                width: widthForContainer,
                                subTitle: winnerPrize,
                                data: tournamentList['winnerprize']
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              detailsScreenColumns (
                                width: widthForContainer,
                                subTitle: runnerUpPrize,
                                data: tournamentList['runnerupprize']
                              ),
                            ],
                          ),


                          ///Tournament Details
                          if(tournamentList['details']['variation_groups'].isNotEmpty)...[
                            underLinedSubHeading(text: tournamentDetails),

                            subTitleText(text: tournamentCategories),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: tournamentList['details']['variation_groups'].length,
                              itemBuilder: (context, index) {
                                final myString = tournamentList['details']['variation_groups'][index]['categories'].toString();
                                final withoutBrackets = myString.replaceAll(RegExp(r'\[|]'), '');
                                return rowHintText(
                                width1: widthForContainer,
                                width2: widthForContainer,
                                text1: tournamentList['details']['variation_groups'][index]['type'],
                                text2: withoutBrackets,);
                              },
                            ),


                            subTitleText(text: tournamentFeeStructure),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: tournamentList['details']['fee'].length,
                              itemBuilder: (context, index) =>  rowHintText(
                                  width1: widthForContainer,
                                  width2: widthForContainer,
                                  text1: '$ruppe ${tournamentList['details']['fee'][index]['type']}',
                                  text2: '$ruppe ${tournamentList['details']['fee'][index]['price']}'),
                            ),


                            detailsScreenColumns (
                                width: widthForContainer,
                                subTitle: tournamentSlots,
                                data : tournamentList['details']['description']
                            ),
                          ],




                          ///Tournament Officials
                          if(tournamentList['details']['official_groups'].isNotEmpty)...[
                            underLinedSubHeading(text: tournamentOfficial),
                            Row(
                              children: [
                                SizedBox(
                                    width : widthForContainer,
                                    child: subTitleText(text: name)),
                                SizedBox(
                                    width: widthForContainer,
                                    child: subTitleText(text: phone)),
                              ],
                            ),

                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: tournamentList['details']['official_groups'].length,
                              itemBuilder: (context, index) =>
                                  rowHintText(
                                      width1: widthForContainer,
                                      width2: widthForContainer,
                                      text1: tournamentList['details']['official_groups'][index]['name'],
                                      text2: tournamentList['details']['official_groups'][index]['phone']),
                            )
                          ],


                          ///Tournament Venue
                          if(tournamentList['details']['venue_groups'].isNotEmpty)...[
                            underLinedSubHeading(text: tournamentVenue),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: tournamentList['details']['venue_groups'].length,
                              itemBuilder: (context, index) =>  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      detailsScreenColumns (
                                          width: widthForContainer,
                                          subTitle: name,
                                          data: tournamentList['details']['venue_groups'][index]['name']
                                      ),
                                      detailsScreenColumns (
                                          width: widthForContainer,
                                          subTitle: phone,
                                          data: tournamentList['details']['venue_groups'][index]['phone']
                                      ),
                                    ],
                                  ),
                                  subTitleText(text: address),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width : width *.85,
                                        child: hintText(text: tournamentList['details']['venue_groups'][index]['address']),
                                      ),
                                      SvgPicture.asset(MyImages.addressIcon),

                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ],



                          ///otherInformation
                          if(tournamentList['details']['additional'] != null || tournamentList['details']['rules'] != null)...[
                            underLinedSubHeading(text: otherInfo),
                            if(tournamentList['details']['additional'] != null)...[
                              detailsScreenColumns
                                (width: width,
                                  subTitle: additionalInfo,
                                  data: tournamentList['details']['additional']),
                            ],

                            if(tournamentList['details']['rules'] != null)...[
                              subTitleText(text: rulesRegulation),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 4,
                                    width: 4,
                                    margin: const EdgeInsets.all(7),
                                    decoration: const BoxDecoration(
                                        color: MyAppTheme.hintTxtColor,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                  SizedBox(
                                      width: width*.8,
                                      child: hintText(text: tournamentList['details']['rules'])),
                                ],
                              ),
                            ],
                          ],

                          SizedBox(
                            height: height*.09,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              ///back btn
              Positioned(
                left: 10,
                top: 15,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: MyAppTheme.cardBgColor,
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.arrow_back,
                      color: MyAppTheme.whiteColor,
                      size: 16,
                    ),
                  ),
                ),
              ),

              ///Register Now Btn
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      backgroundColor: MyAppTheme.MainColor,
                      fixedSize:  Size(width, 50),
                    ), child: Text(
                      registerNow,
                      style: MyStyles.white14Regular,
                    ),

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
