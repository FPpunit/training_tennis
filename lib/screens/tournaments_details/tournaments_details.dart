import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_pro/custom/estimated_time_and_live_now_container.dart';
import 'package:new_pro/utils/ui_helper/ui_helper.dart';

import '../../utils/constants.dart';
import '../../utils/my_app_theme.dart';
import '../../utils/my_images.dart';
import '../../utils/my_styles.dart';

class TournamentsDetails extends StatefulWidget {
  TournamentsDetails({Key? key}) : super(key: key);

  @override
  State<TournamentsDetails> createState() => _TournamentsDetailsState();
}

class _TournamentsDetailsState extends State<TournamentsDetails> {
  late double height;

  late double width;

  int selectedIdx = 0;

  int index = 0;

  List<String> cat = [all, open, menSingles, womenSingles, mixedDoubles];

  String selectedCat = all;

  bool player1Winner = false;
  bool player2Winner = true;

  List<Map<String, dynamic>> scores = [
    {
      'player1': 8,
      'tiebreaker1': 0,
      'player2': 6,
      'tiebreaker2': 0,
    },
    {
      'player1': 5,
      'tiebreaker1': 0,
      'player2': 7,
      'tiebreaker2': 0,
    },
    {
      'player1': 6,
      'tiebreaker1': 6,
      'player2': 7,
      'tiebreaker2': 8,
    },
  ];

  String date1 = '2023-03-20';
  String date2 = '2023-04-12';

  @override
  Widget build(BuildContext context) {
    DateTime d1 = DateTime.parse(date1);
    DateTime d2 = DateTime.parse(date2);

    Duration dur = d2.difference(d1);
    print(d1.add(dur));



    String differenceInYears = (dur.inDays).toString();
    print(differenceInYears);

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              SizedBox(
                height: height * .22,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(15)),
                      child: Image(
                        image: AssetImage(MyImages.summerChamp),
                        width: width,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 10,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        color: MyAppTheme.cardBgColor,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.arrow_back,
                            color: MyAppTheme.whiteColor,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          titleText(text: summerChamp),
                          Row(
                            children: [
                              subTitleText(text: '20-03-2023/12-04-2023'),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              ///Date Container
              SizedBox(
                  height: height*.12,
                  child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: dur.inDays+1,
                itemBuilder: (context, index) {
                  DateTime date=d1.add(Duration(days: index));
                  return Container(
                    margin: const EdgeInsets.all(10),
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: (selectedIdx == index)
                          ? MyAppTheme.documentBgMainColor
                          : MyAppTheme.cardBorderBgColor,
                      border: Border.all(
                          color: (selectedIdx == index)
                              ? MyAppTheme.MainColor
                              : MyAppTheme.cardBgSecColor),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text( '${date.month}', style: MyStyles.white14Light),
                        Text('${date.day}', style: MyStyles.white30SemiBold)
                      ],
                    ),
                  );
                },
              )),
              Divider(
                thickness: 2,
                color: MyAppTheme.cardBgSecColor,
              ),

              IntrinsicHeight(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: MyAppTheme.cardBgColor,
                          borderRadius: BorderRadius.circular(8)),
                      height: height * .05,
                      width: width * .24,
                      child: Row(
                        children: [
                          Container(
                            width: width * .12,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: MyAppTheme.MainColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: subTitleText(text: all),
                          ),
                          Container(
                            width: width * .12,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: MyAppTheme.cardBgColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: subTitleText(text: live),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: double.infinity,
                      width: 2,
                      color: MyAppTheme.cardBgSecColor,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        height: height * .05,
                        //width: width*.6,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: cat.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              selectedIdx = index;
                              selectedCat = cat[index].toLowerCase();
                              setState(() {});
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: (selectedIdx == index)
                                    ? MyAppTheme.documentBgMainColor
                                    : MyAppTheme.cardBorderBgColor,
                                border: Border.all(
                                    color: (selectedIdx == index)
                                        ? MyAppTheme.MainColor
                                        : MyAppTheme.cardBgSecColor),
                              ),
                              child: Text(cat[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: (selectedIdx == index)
                                          ? MyAppTheme.MainColor
                                          : MyAppTheme.whiteColor)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///Estimated Start time Container

                        ///Central
                        titleText(text: central),
                        EstimatedStartTimeContainer(
                            height: height * 0.17,
                            estimatedTime: min40,
                            roundName: qualRnd1),

                        /// court 1
                        titleText(text: court1),
                        EstimatedStartTimeContainer(
                            height: height * .17,
                            estimatedTime: min40,
                            roundName: qualRnd1),

                        //Live Now
                        SizedBox(
                          height: height * .17,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: MyAppTheme.cardBgSecColor,
                            ),
                            child: Column(
                              children: [
                                ///title container
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                          children: [
                                        subTitleText(text: liveNow),
                                        hintText(text: qualRnd1),
                                        hintText(text: min20),
                                      ]
                                              .map((e) => Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: e,
                                                  ))
                                              .toList()),

                                      /// Live Streaming Btn
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: MyAppTheme
                                                  .challengeBtnBgColor,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(8))),
                                          height: double.infinity,
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/images/broadcast_ic.svg',
                                                  color: MyAppTheme.whiteColor),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              subTitleText(
                                                  text: watchLiveStream)
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                ///Player 1 container
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    color: MyAppTheme.cardBgColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        white12Text(text: player1),
                                        SizedBox(
                                          height: height * .05,
                                          //width: width*.5,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: 1,
                                            // (setList!.length>3)? 3: setList!.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8),
                                                child: selectedContainer(
                                                    text:
                                                        // setList![index][0].toString()
                                                        '0',
                                                    isBorderVisible: false,
                                                    height: 30,
                                                    width: 28),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  color: MyAppTheme.cardBgSecColor,
                                ),

                                ///Player 2 container
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            const BorderRadius.vertical(
                                                bottom: Radius.circular(10)),
                                        color: MyAppTheme.cardBgColor),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        white12Text(text: player2),
                                        SizedBox(
                                          height: height * .05,
                                          //width: width*.5,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: 1,

                                            // (setList!.length>3)? 3: setList!.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8),
                                                child: selectedContainer(
                                                    text: '0'
                                                    // setList![index][1].toString()
                                                    ,
                                                    isBorderVisible: false,
                                                    height: 30,
                                                    width: 28),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        /// Final Winner container
                        SizedBox(
                          height: height * 0.17,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: MyAppTheme.cardBgSecColor,
                            ),
                            child: Column(
                              children: [
                                ///title container
                                Expanded(
                                  child: Row(
                                      children: [
                                    subTitleText(text: finalText),
                                    hintText(text: qualRnd1),
                                    hintText(text: min40),
                                  ]
                                          .map((e) => Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: e,
                                              ))
                                          .toList()),
                                ),

                                ///Player 1 container
                                Expanded(
                                  child: Container(
                                    color: MyAppTheme.cardBgColor,
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 4, 0, 0),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: width * .3,
                                          color: MyAppTheme.cardBgColor,
                                          child: Row(
                                            children: [
                                              white12Text(text: player1),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              Visibility(
                                                  visible: player1Winner,
                                                  child: SvgPicture.asset(
                                                    'assets/images/cup_ic.svg',
                                                    height: 18,
                                                    width: 18,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                              //height: double.infinity,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8),
                                              alignment: Alignment.centerRight,
                                              //width: width*.6,
                                              child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  shrinkWrap: true,
                                                  itemCount: scores.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    String points =
                                                        scores[index]
                                                                ['tiebreaker1']
                                                            .toString();

                                                    return Container(
                                                      height: 35,
                                                      width: 30,
                                                      alignment:
                                                          Alignment.center,
                                                      child: RichText(
                                                        text:
                                                            TextSpan(children: [
                                                          TextSpan(
                                                              text: scores[
                                                                          index]
                                                                      [
                                                                      'player1']
                                                                  .toString(),
                                                              style: MyStyles
                                                                  .white18Regular),
                                                          if (points !=
                                                              '0') ...[
                                                            WidgetSpan(
                                                              child: Transform
                                                                  .translate(
                                                                offset:
                                                                    const Offset(
                                                                        2, -10),
                                                                child: Text(
                                                                  points,
                                                                  //superscript is usually smaller in size
                                                                  textScaleFactor:
                                                                      0.8,
                                                                  style: const TextStyle(
                                                                      color: MyAppTheme
                                                                          .whiteColor),
                                                                ),
                                                              ),
                                                            )
                                                          ]
                                                        ]),
                                                      ),
                                                    );
                                                  })),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  color: MyAppTheme.cardBgSecColor,
                                ),

                                ///Player 2 container
                                Expanded(
                                  child: Container(
                                    color: MyAppTheme.cardBgColor,
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 4, 0, 0),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: width * .3,
                                          color: MyAppTheme.cardBgColor,
                                          child: Row(
                                            children: [
                                              white12Text(text: player2),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              Visibility(
                                                  visible: player2Winner,
                                                  child: SvgPicture.asset(
                                                    'assets/images/cup_ic.svg',
                                                    height: 18,
                                                    width: 18,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                              //height: double.infinity,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              alignment: Alignment.centerRight,
                                              //width: width*.6,
                                              child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  shrinkWrap: true,
                                                  itemCount: scores.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    String points =
                                                        scores[index]
                                                                ['tiebreaker2']
                                                            .toString();

                                                    return Container(
                                                      height: 35,
                                                      width: 30,
                                                      alignment:
                                                          Alignment.center,
                                                      child: RichText(
                                                        text:
                                                            TextSpan(children: [
                                                          TextSpan(
                                                              text: scores[
                                                                          index]
                                                                      [
                                                                      'player2']
                                                                  .toString(),
                                                              style: MyStyles
                                                                  .white18Regular),
                                                          if (points !=
                                                              '0') ...[
                                                            WidgetSpan(
                                                              child: Transform
                                                                  .translate(
                                                                offset:
                                                                    const Offset(
                                                                        2, -10),
                                                                child: Text(
                                                                  points,
                                                                  //superscript is usually smaller in size
                                                                  textScaleFactor:
                                                                      0.8,
                                                                  style: const TextStyle(
                                                                      color: MyAppTheme
                                                                          .whiteColor),
                                                                ),
                                                              ),
                                                            )
                                                          ]
                                                        ]),
                                                      ),
                                                    );
                                                  })),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
