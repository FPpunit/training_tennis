import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_pro/utils/ui_helper/ui_helper.dart';

import '../../utils/my_app_theme.dart';

class TournamentList extends StatefulWidget {
  const TournamentList({Key? key}) : super(key: key);

  @override
  State<TournamentList> createState() => _TournamentListState();
}

class _TournamentListState extends State<TournamentList> {

  late double height;
  late double width;

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    print(tournamentList[0]['status']);
    return Scaffold(
      appBar: myAppBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            subTitleText(text: 'Live Tournament'),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(
                      color: MyAppTheme.MainColor
                    )
                  ),
                  backgroundColor: MyAppTheme.documentBgMainColor),
              onPressed: () {},
              child: const Text(
                'Live',
                style: TextStyle(
                    color: MyAppTheme.MainColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              width: width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: MyAppTheme.cardBgSecColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Visibility(
                    visible : tournamentList[2]['status'].toString() == 'live',
                    child: Container(
                      width : 120,
                      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                      decoration : BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: MyAppTheme.liveBtnFillColor,
                        border: Border.all(color: MyAppTheme.liveBtnBorderColor ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FaIcon(FontAwesomeIcons.towerBroadcast,color: MyAppTheme.liveBtnBorderColor,size: 14,),
                          Text(
                            'Live Now',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: MyAppTheme.liveBtnBorderColor
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  titleText(text: tournamentList[0]['tournamentName']),
                  Row(
                    children: [
                      const Icon(Icons.calendar_month_outlined,color: MyAppTheme.hintTxtColor,size: 18,),
                      hintText(text: '${tournamentList[0]['startDate']}/${tournamentList[0]['endDate']}')
                    ],
                  )
                ],
              ),
            )
          ],
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
];
