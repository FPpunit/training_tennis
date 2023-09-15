import 'package:flutter/material.dart';
import 'package:new_pro/screens/tournament/academy/tournament%20filling%20details/tournament_details.dart';
import 'package:new_pro/screens/tournament/academy/tournament%20filling%20details/tournament_details_filling_screen_list_provider.dart';
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
              resultList = resultWholeList[4];
              print('resultList============================>$resultList');
            }, child: titleText(text: 'FetchList')),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute
                (builder: (context) => TournamentDetails(
                  selectedDataForCat: (resultList['details']['variation_groups'] == null) ? [] : resultList['details']['variation_groups'],
                  selectedDataForFee: (resultList['details']['fee'] == null) ? [] : resultList['details']['fee'],
                  tourSlots: resultList['details']['description'].toString(),
                  tournamentUUID: resultList['uuid']),));
            }, child: titleText(text: 'Next')),
          ],
        ),
      ),
    );
  }
}
