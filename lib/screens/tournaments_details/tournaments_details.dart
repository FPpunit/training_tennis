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

class _TournamentsDetailsState extends State<TournamentsDetails> with SingleTickerProviderStateMixin{
  late double height;
  late double width;

  bool isSelected = true;

  int selectedIdx = 0;
  int selectedIdxForDate = 0;

  int index = 0;

  List<String> cat = [all, open, menSingles, womenSingles, mixedDoubles];

  String selectedCat = all;

  bool player1Winner = false;
  bool player2Winner = true;

  List<Map<String, dynamic>> scoresList = [
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

  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'April',
    'May',
    'June',
    'July',
    'Aug',
    'Sept',
    'Oct',
    'Nov',
    'Dec',
  ];

  String date1 = '2023-03-20';
  String date2 = '2023-04-12';
  late DateTime d1;
  late DateTime d2;
  late Duration dur;
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 3, vsync: this);
    d1 = DateTime.parse(date1);
    d2 = DateTime.parse(date2);

    dur = d2.difference(d1);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              /// Banner And Dates
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

              ///TabBar View

              Container(
                height: 45,
                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: MyAppTheme.whiteColor
                    )
                  )
                ),
                child: TabBar(
                  controller: _tabController,
                  // give the indicator a decoration (color and border radius)
                  indicator:BoxDecoration(
                    color: MyAppTheme.bgColor,
                    border: const Border(
                      bottom: BorderSide(
                        color: MyAppTheme.MainColor,
                        width: 3
                      )
                    )
                  ),
                  labelColor: MyAppTheme.MainColor,
                  unselectedLabelColor: MyAppTheme.whiteColor,
                  tabs: const [
                    Tab(
                      text: scores,
                    ),
                    Tab(
                      text: draws,
                    ),
                    Tab(
                      text: players,
                    ),
                  ],
                ),
              ),

              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    scoresTab(),
                    drawsTab(),
                    playerDetailsTab()
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget scoresTab() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ///Date Container
            SizedBox(
                height: height * .12,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: dur.inDays + 1,
                  itemBuilder: (context, index) {
                    DateTime date = d1.add(Duration(days: index));
                    return GestureDetector(
                      onTap: () {
                        selectedIdxForDate = index;
                        setState(() {});
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: (selectedIdxForDate == index)
                              ? MyAppTheme.documentBgMainColor
                              : MyAppTheme.cardBorderBgColor,
                          border: Border.all(
                              color: (selectedIdxForDate == index)
                                  ? MyAppTheme.MainColor
                                  : MyAppTheme.cardBgSecColor),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(months[date.month - 1],
                                style: MyStyles.white12Light),
                            Text(
                                (date.day <= 9)
                                    ? '0${(date.day)}'
                                    : '${(date.day)}',
                                style: MyStyles.white30SemiBold)
                          ],
                        ),
                      ),
                    );
                  },
                )),
            Divider(
              thickness: 2,
              color: MyAppTheme.cardBgSecColor,
            ),

            ///Category List
            IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        color: MyAppTheme.cardBgColor,
                        borderRadius: BorderRadius.circular(8)),
                    height: height * .05,
                    width: width * .26,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            isSelected = true;
                            setState(() {});
                          },
                          child: Container(
                            width: width * .13,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: (isSelected)
                                    ? MyAppTheme.MainColor
                                    : MyAppTheme.cardBgColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: subTitleText(text: all),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            isSelected = false;
                            setState(() {});
                          },
                          child: Container(
                            width: width * .13,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: (!isSelected)
                                    ? MyAppTheme.MainColor
                                    : MyAppTheme.cardBgColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: subTitleText(text: live),
                          ),
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
                            padding: const EdgeInsets.symmetric(horizontal: 8),
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
            const SizedBox(
              height: 5,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Central
                  titleText(text: central),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                    children: [
                                  subTitleText(text: liveNow),
                                  hintText(text: qualRnd1),
                                  hintText(text: min20),
                                ]
                                        .map((e) => Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8),
                                              child: e,
                                            ))
                                        .toList()),

                                /// Live Streaming Btn
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: width * 0.4,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: MyAppTheme.challengeBtnBgColor,
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(8))),
                                    height: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/broadcast_ic.svg',
                                            color: MyAppTheme.whiteColor),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        white12Text(text: watchLiveStream)
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                        return selectedContainer35(
                                          text:
                                              // setList![index][0].toString()
                                              '0',
                                          isBorderVisible: false,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.vertical(
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
                                        return selectedContainer35(
                                          text: '0'
                                          // setList![index][1].toString()
                                          ,
                                          isBorderVisible: false,
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
                  EstimatedStartTimeContainer(
                      height: height * 0.17,
                      estimatedTime: min40,
                      roundName: qualRnd1),

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
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: e,
                                        ))
                                    .toList()),
                          ),

                          ///Player 1 container
                          Expanded(
                            child: Container(
                              color: MyAppTheme.cardBgColor,
                              padding: const EdgeInsets.fromLTRB(8, 4, 0, 0),
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
                                        padding:
                                            const EdgeInsets.symmetric(horizontal: 8),
                                        alignment: Alignment.centerRight,
                                        //width: width*.6,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount: scoresList.length,
                                            itemBuilder: (context, index) {
                                              String points = scoresList[index]
                                                      ['tiebreaker1']
                                                  .toString();

                                              return Container(
                                                height: 35,
                                                width: 30,
                                                alignment: Alignment.center,
                                                child: RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                        text: scoresList[index]
                                                                ['player1']
                                                            .toString(),
                                                        style: MyStyles
                                                            .white18Regular),
                                                    if (points != '0') ...[
                                                      WidgetSpan(
                                                        child:
                                                            Transform.translate(
                                                          offset: const Offset(
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
                              decoration: BoxDecoration(
                                  color: MyAppTheme.cardBgColor,
                                  borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(10))),
                              padding: const EdgeInsets.fromLTRB(8, 4, 0, 0),
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        alignment: Alignment.centerRight,
                                        //width: width*.6,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount: scoresList.length,
                                            itemBuilder: (context, index) {
                                              String points = scoresList[index]
                                                      ['tiebreaker2']
                                                  .toString();

                                              return Container(
                                                height: 35,
                                                width: 30,
                                                alignment: Alignment.center,
                                                child: RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                        text: scoresList[index]
                                                                ['player2']
                                                            .toString(),
                                                        style: MyStyles
                                                            .white18Regular),
                                                    if (points != '0') ...[
                                                      WidgetSpan(
                                                        child:
                                                            Transform.translate(
                                                          offset: const Offset(
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
                  ),

                  /// court 1
                  titleText(text: court1),

                  ///Live Now
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                    children: [
                                  subTitleText(text: liveNow),
                                  hintText(text: qualRnd1),
                                  hintText(text: min20),
                                ]
                                        .map((e) => Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8),
                                              child: e,
                                            ))
                                        .toList()),

                                /// Live Streaming Btn
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: width * 0.4,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: MyAppTheme.challengeBtnBgColor,
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(8))),
                                    height: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/broadcast_ic.svg',
                                            color: MyAppTheme.whiteColor),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        white12Text(text: watchLiveStream)
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                        return selectedContainer35(
                                          text:
                                              // setList![index][0].toString()
                                              '0',
                                          isBorderVisible: false,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.vertical(
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
                                        return selectedContainer35(
                                          text: '0'
                                          // setList![index][1].toString()
                                          ,
                                          isBorderVisible: false,
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
                  EstimatedStartTimeContainer(
                      height: height * .17,
                      estimatedTime: min40,
                      roundName: qualRnd1),
                ]
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: e,
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget drawsTab(){
    return Column(
        children: [
          /// download Pdf Btn
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
            child: ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: MyAppTheme.MainColor
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/download_ic.svg',
                      height: 16,
                      width: 16,
                      allowDrawingOutsideViewBox: true,
                      color: MyAppTheme.whiteColor,
                    ),
                    const SizedBox(width: 5,),
                    subTitleText(text: downloadPDF)
                  ],
                )),
          ),

          ///Category List
          Container(
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
                  padding: const EdgeInsets.symmetric(horizontal: 8),
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

          ///Web View Page

        ],
      );
  }

  Widget playerDetailsTab() {
    return Column(
      children: [
        Container(
          color: MyAppTheme.cardBgSecColor,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(left: 10),
                  child: white10Text(text: sno),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  //margin: const EdgeInsets.only(left: 10),
                  child: white10Text(text: name),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  // margin: const EdgeInsets.only(left: 10),
                  child: white10Text(text: phoneNum),
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: ListView.builder(
            itemCount: contactData.length,
            itemBuilder: (context, index) => Column(
              children: [
                Container(
                  height: 1,color: MyAppTheme.cardBgSecColor,
                ),

                Container(
                  margin: const EdgeInsets.only(left: 10),
                  //padding: null,
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                              height: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              //margin: const EdgeInsets.only(left: 10),
                              alignment: Alignment.center,
                              color: MyAppTheme.pointsCardBgSecColor,
                              child: white12Text(text: '${index + 1}')
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 5),
                              alignment: Alignment.centerLeft,
                              height: double.infinity,
                              //margin: const EdgeInsets.only(left: 10),
                              child: white12Text(text: contactData[index]['name'])
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                              height: double.infinity,
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 5),
                              // margin: const EdgeInsets.only(left: 10),
                              color: MyAppTheme.pointsCardBgSecColor,
                              child: white12Text(text: contactData[index]['phoneNumber'])
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: GestureDetector(onTap: (){


                          }, child: const Text(viewProfile,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                color: MyAppTheme.MainColor,
                                fontWeight: FontWeight.w500
                            ),)),)
                      ],
                    ),
                  ),
                ),

              ],
            ),),
        )
      ],
    );
  }


  List<Map<String,dynamic>> contactData = [
    {
      'name' : 'Punit Lohani',
      'phoneNumber' : '+919876543210',
      'email': 'punitlohani@gmail.com'
    },{
      'name' : 'Anny ',
      'phoneNumber' : '+919876543210',
      'email': 'punitlohani@gmail.com'
    },
    {
      'name' : 'Anny ',
      'phoneNumber' : '+919876543210',
      'email': 'punitlohani@gmail.com'
    },
  ];
}
