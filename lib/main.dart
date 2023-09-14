import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_pro/locator.dart';
import 'package:new_pro/screens/admin/payment_fee/payment_fee_list.dart';
import 'package:new_pro/screens/admin/payment_fee/payment_fee_provider.dart';
import 'package:new_pro/screens/admin/staff/provider/admin_staff_provider.dart';
import 'package:new_pro/screens/not%20in%20production/test/responsive_text.dart';
import 'package:new_pro/screens/tournament/academy/getting_tournament_list.dart';
import 'package:new_pro/screens/tournament/academy/officials.dart';
import 'package:new_pro/screens/tournament/academy/payment_info.dart';
import 'package:new_pro/screens/tournament/academy/tournament%20filling%20details/tournament_details.dart';
import 'package:new_pro/screens/tournament/academy/tournament%20filling%20details/tournament_details_filling_screen_list_provider.dart';
import 'package:new_pro/screens/not%20in%20production/splash.dart';
import 'package:new_pro/screens/admin/staff/add_staff.dart';
import 'package:new_pro/screens/staff/staff_home/staff_home.dart';
import 'package:new_pro/screens/staff/score_management/score_management.dart';
import 'package:new_pro/screens/admin/staff/staff_members_list.dart';
import 'package:new_pro/screens/staff/staff_provider/staff_provider.dart';
import 'package:new_pro/screens/tournament/academy/tournament_details_screen.dart';
import 'package:new_pro/screens/tournament/player/provider/player_tournament_provider.dart';
import 'package:new_pro/screens/tournament/player/tournament_list.dart';
import 'package:new_pro/screens/tournament/player/tournament_registration.dart';
import 'package:new_pro/screens/tournament/player/tournaments_details.dart';
import 'package:new_pro/utils/constants.dart';
import 'package:new_pro/utils/my_app_theme.dart';
import 'package:new_pro/utils/my_colors.dart';
import 'package:provider/provider.dart';

void main() {
  setUpLocator();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TournamentDetailsFillingScreenListsProvider(),),
        ChangeNotifierProvider(create: (context) => StaffProvider(),),
        ChangeNotifierProvider(create: (context) => AdminStaffProvider(),),
        ChangeNotifierProvider(create: (context) => PaymentFeeProvider(),),
        ChangeNotifierProvider(create: (context) => PlayerTournamentProvider(),),
        //ChangeNotifierProvider(create: (context) => ProviderStaff(),),
      ],
      child :MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final navigatorKey = GlobalKey < NavigatorState > ();
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
      builder: FToastBuilder(),
      home: ScoreManagement(),
      navigatorKey: navigatorKey,

    );
  }
}


