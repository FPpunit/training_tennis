import 'package:flutter/material.dart';
import '../../utils/my_app_theme.dart';

  class Progressbar extends StatelessWidget {
  const Progressbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: MyAppTheme.DarkBgColor,
      body: Center(
        child:
         CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(MyAppTheme.errorMessageTextColor)),
      ),
    );
  }
}
