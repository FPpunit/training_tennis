import 'package:flutter/material.dart';
import 'package:new_pro/screens/login/log_in.dart';
import 'package:new_pro/screens/ofiicials/officials.dart';
import 'package:new_pro/screens/other_info/other_info.dart';
import 'package:new_pro/screens/payment_fee/payment_fee_list.dart';
import 'package:new_pro/screens/payment_info/payment_info.dart';
import 'package:new_pro/screens/splash.dart';
import 'package:new_pro/screens/staff/add_staff.dart';
import 'package:new_pro/screens/staff/staff_home/staff_home.dart';
import 'package:new_pro/screens/staff/staff_home/score_management.dart';
import 'package:new_pro/screens/staff/staff_members_list.dart';
import 'package:new_pro/screens/tournament_details/checkbox_and_dropdown/tournament_details.dart';
import 'package:new_pro/screens/tournament_details/checkbox_and_dropdown/tournament_details_filling_screen_list_provider.dart';
import 'package:new_pro/screens/tournament_details/tournament_details_screen.dart';
import 'package:new_pro/screens/tournament_list/tournament_list.dart';
import 'package:new_pro/screens/tournament_registration/tournament_registration.dart';
import 'package:new_pro/screens/tournament_venue/tournament_venue.dart';
import 'package:new_pro/screens/tournaments_details/tournaments_details.dart';
import 'package:new_pro/utils/constants.dart';
import 'package:new_pro/utils/my_app_theme.dart';
import 'package:new_pro/utils/my_colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: MyAppTheme.bgColor,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => TournamnetDetailsFillingScreenListsProvider(),)
          ],
          child: TournamentsDetails()),
    );
  }
}


