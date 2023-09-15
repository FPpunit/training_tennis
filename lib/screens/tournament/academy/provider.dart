import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:new_pro/screens/tournament/academy/repo/create_tournament_repo.dart';

class ProviderTournament extends ChangeNotifier{

  int times=1;
  List<Map<String,dynamic>> officials = [];

  decreaseTimes(){
    times--;
    notifyListeners();
  }

  addOfficials({required String name, required phone}){
    times++;
    officials.add({
      'name' : name,
      'phone' : phone,
    });
    notifyListeners();
  }

  saveTournamentOfficials({required BuildContext context,required String tournamentUUID,required List<dynamic> officials}){
    CreateTournamentRepo().saveTourOfficials(context, {
      'tournament_uuid' : tournamentUUID,
      'officials' : jsonEncode(officials)
    });
  }
}