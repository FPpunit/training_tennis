import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_pro/utils/my_images.dart';
import 'package:new_pro/utils/my_styles.dart';
import 'package:new_pro/utils/ui_helper/ui_helper.dart';

import '../../utils/constants.dart';
import '../../utils/my_app_theme.dart';

class TournamentDetailsScreen extends StatelessWidget {
  late double height;
  late double width;
  late double widthForContainer;

  List<String> rules =[
    dummyRule,
    dummyRule,
    dummyRule,
  ];

  TournamentDetailsScreen({Key? key}) : super(key: key);

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
          child: Expanded(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height*.32,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(15)),
                              child: Image(
                                image: AssetImage(MyImages.tennisCourt),
                                width: width,
                                fit: BoxFit.cover,
                              ),
                            ),
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
                            )
                          ],
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
                                  data: 'All Starts Championship'
                                ),
                                detailsScreenColumns (
                                  width: widthForContainer,
                                  subTitle: tourDrawType,
                                  data: 'Knockouts'
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
                                  data: '20-03-2023'
                                ),
                                detailsScreenColumns (
                                  width: widthForContainer,
                                  subTitle: tourEndDate,
                                  data: '12-04-2023'
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
                                  data: 'Rajasthan'
                                ),
                                detailsScreenColumns (
                                  width: widthForContainer,
                                  subTitle: tourCity,
                                  data: 'Jaipur'
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
                                  data: '20-03-2023'
                                ),
                                detailsScreenColumns (
                                  width: widthForContainer,
                                  subTitle: withdrawDeadLine,
                                  data: '12-04-2023'
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
                                  data: '3'
                                ),
                                detailsScreenColumns (
                                  width: widthForContainer,
                                  subTitle: winnerPrize,
                                  data: 'Car'
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
                                  data: 'Cash'
                                ),
                              ],
                            ),


                            ///Tournament Details
                            underLinedSubHeading(text: tournamentDetails),

                            subTitleText(text: tournamentCategories),
                            rowHintText(width1: widthForContainer,width2: widthForContainer, text1: menSingles, text2: '25+,35+,40+,50+'),
                            rowHintText(width1: widthForContainer,width2: widthForContainer, text1: womenSingles, text2: '25+,35+,40+,50+'),
                            rowHintText(width1: widthForContainer,width2: widthForContainer, text1: mixedDoubles, text2: '25+,35+,40+,50+'),
                            hintText(text: open),

                            subTitleText(text: tournamentFeeStructure),
                            rowHintText(width1: widthForContainer, width2: widthForContainer, text1: singles, text2: '$ruppe 2000'),
                            rowHintText(width1: widthForContainer, width2: widthForContainer, text1: doubles, text2: '$ruppe 3000'),


                            detailsScreenColumns (
                                width: width*.47,
                                subTitle: tournamentSlots,
                                data :'32'
                            ),


                            ///Tournament Officials
                            underLinedSubHeading(text: tournamentOfficial),
                            Row(
                              children: [
                                SizedBox(
                                    width : width*.47,
                                    child: subTitleText(text: name)),
                                SizedBox(
                                    width: width*.47,
                                    child: subTitleText(text: phoneNum)),
                              ],
                            ),
                            rowHintText(width1: widthForContainer, width2: widthForContainer, text1: 'John Doe', text2: obscurePhoneNum),
                            rowHintText(width1: widthForContainer, width2: widthForContainer, text1: 'John Doe', text2: obscurePhoneNum),


                            ///Tournament Venue
                            underLinedSubHeading(text: tournamentVenue),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                detailsScreenColumns (
                                    width: width*.47,
                                    subTitle: name,
                                    data: 'Stadium Name'
                                ),
                                detailsScreenColumns (
                                    width: width*.47,
                                    subTitle: phone,
                                    data: obscurePhoneNum
                                ),
                              ],
                            ),
                            subTitleText(text: address),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width : width *.85,
                                  child: hintText(text: dummyAddress),
                                ),
                                SvgPicture.asset(MyImages.addressIcon),

                              ],
                            ),


                            ///otherInformation
                            underLinedSubHeading(text: otherInfo),
                            detailsScreenColumns(width: width, subTitle: additionalInfo, data: dummyInfoPera),
                            subTitleText(text: rulesRegulation),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: rules.length,
                              itemBuilder: (context, index) => Row(
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
                                      width: width*.9,
                                      child: hintText(text: rules[index])),
                                ],
                              ),),

                            SizedBox(
                              height: height*.09,
                            )
                          ],
                        ),
                      )

                    ],
                  ),
                ),
                ///Register Now Btn
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
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
      ),
    );
  }
}
