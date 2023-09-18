import 'package:flutter/material.dart';
import 'package:new_pro/screens/tournament/academy/officials.dart';
import 'package:new_pro/screens/tournament/academy/tournament%20filling%20details/tournament_details.dart';
import 'package:new_pro/screens/tournament/academy/tournament%20filling%20details/tournament_details_filling_screen_list_provider.dart';
import 'package:new_pro/screens/tournament/academy/tournament_details_screen.dart';
import 'package:new_pro/utils/ui_helper/ui_helper.dart';
import 'package:provider/provider.dart';

class GettingTournamentList extends StatelessWidget {
  GettingTournamentList({super.key});
  Map resultList={};
  List resultWholeList= [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TournamentDetailsFillingScreenListsProvider>(
        builder: (context, provider, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () async {
              resultWholeList = await provider.getTournamentList(context: context);
              print('resultWholeList============================>$resultWholeList');
              // resultList = resultWholeList[4];
              // print('resultList============================>$resultList');
            }, child: titleText(text: 'FetchList')),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute
                (builder: (context) => TournamentDetailsScreen(tournamentList: resultWholeList[3], type: '',)));
            }, child: titleText(text: 'Next')),
          ],
        ),
      ),
    );
  }
}
