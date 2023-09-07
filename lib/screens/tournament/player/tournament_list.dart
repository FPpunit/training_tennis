import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_pro/screens/tournament/player/provider/player_tournament_provider.dart';
import 'package:new_pro/utils/ui_helper/ui_helper.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants.dart';
import '../../../utils/my_app_theme.dart';
import '../../../utils/my_images.dart';

class TournamentList extends StatelessWidget {
  TournamentList({Key? key}) : super(key: key);

  late double height;

  late double width;

  final List titleAccordingToCat =[
    allTournaments,
    liveTournaments,
    upcomingTournament,
    joinedTournament,
    completedTournament
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: mAppBar(title: tournaments),
      body: Consumer<PlayerTournamentProvider>(
        builder: (context, provider, child) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * .05,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.category.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      provider.onTap(index: index);
                    },
                    child: (provider.selectedIdxForTournamentList == index)
                        ? selectedContainer(text: provider.category[index],height: 35)
                        : unSelectedContainer(text: provider.category[index],height: 35)
                  ),
                ),
              ),

              Padding(
                  padding: const EdgeInsets.only(top: 15,bottom: 10),
                  child: titleText(text: titleAccordingToCat[provider.selectedIdxForTournamentList])),

              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: tournamentList.length,
                  itemBuilder: (context, index) {
                      return Container(
                        width: width,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: MyAppTheme.cardBgSecColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Visibility(
                              visible: tournamentList[index]['status'].toString() == 'live',
                              child: Container(
                                width: 100,
                                margin: const EdgeInsets.only(bottom: 7),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: MyAppTheme.liveBtnFillColor,
                                  border: Border.all(
                                      color: MyAppTheme.liveBtnBorderColor),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    //FaIcon(FontAwesomeIcons.towerBroadcast,color: MyAppTheme.liveBtnBorderColor,size: 14,),

                                    SvgPicture.asset(MyImages.broadcastIc),

                                    Text(
                                      'Live Now',
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12,
                                          color: MyAppTheme.liveBtnBorderColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            titleText(
                                text: tournamentList[index]['tournamentName']),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month_outlined,
                                  color: MyAppTheme.hintTxtColor,
                                  size: 18,
                                ),
                                hintText(
                                    text:
                                        '${tournamentList[index]['startDate']}/${tournamentList[index]['endDate']}')
                              ],
                            )
                          ],
                        ),
                      );

                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> tournamentList = [
  {
    'tournamentName': 'All Star Tournament',
    'startDate': '20-03-2023',
    'endDate': '20-03-2023',
    'status': 'live',
  },
  {
    'tournamentName': 'Summer Championship',
    'startDate': '20-03-2023',
    'endDate': '20-03-2023',
    'status': 'live',
  },
  {
    'tournamentName': 'Winter Championship',
    'startDate': '20-03-2023',
    'endDate': '20-03-2023',
    'status': 'live',
  },
  {
    'tournamentName': 'Genrali Open',
    'startDate': '20-03-2023',
    'endDate': '20-03-2023',
    'status': 'upcoming',
  },
  {
    'tournamentName': 'Verona, Italy',
    'startDate': '20-03-2023',
    'endDate': '20-03-2023',
    'status': 'upcoming',
  },
  {
    'tournamentName': 'Segovia, Spain',
    'startDate': '20-03-2023',
    'endDate': '20-03-2023',
    'status': 'upcoming',
  },
  {
    'tournamentName': 'All Star Tournament',
    'startDate': '20-03-2023',
    'endDate': '20-03-2023',
    'status': 'live',
  },
  {
    'tournamentName': 'Summer Championship',
    'startDate': '20-03-2023',
    'endDate': '20-03-2023',
    'status': 'live',
  },
  {
    'tournamentName': 'Winter Championship',
    'startDate': '20-03-2023',
    'endDate': '20-03-2023',
    'status': 'live',
  },
  {
    'tournamentName': 'Genrali Open',
    'startDate': '20-03-2023',
    'endDate': '20-03-2023',
    'status': 'upcoming',
  },
  {
    'tournamentName': 'Verona, Italy',
    'startDate': '20-03-2023',
    'endDate': '20-03-2023',
    'status': 'upcoming',
  },
  {
    'tournamentName': 'Segovia, Spain',
    'startDate': '20-03-2023',
    'endDate': '20-03-2023',
    'status': 'joined',
  },{
    'tournamentName': 'Segovia, Spain',
    'startDate': '20-03-2023',
    'endDate': '20-03-2023',
    'status': 'joined',
  },
  {
    'tournamentName': 'All Star Tournament',
    'startDate': '20-03-2023',
    'endDate': '20-03-2023',
    'status': 'joined',
  },
  {
    'tournamentName': 'Summer Championship',
    'startDate': '20-03-2023',
    'endDate': '20-03-2023',
    'status': 'completed',
  },
  {
    'tournamentName': 'Winter Championship',
    'startDate': '20-03-2023',
    'endDate': '20-03-2023',
    'status': 'completed',
  },
];
