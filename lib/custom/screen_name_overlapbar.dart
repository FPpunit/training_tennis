

import 'package:flutter/material.dart';

import '../utils/my_string.dart';
import '../utils/my_styles.dart';
import '../utils/ui_helper/ui_helper.dart';

class ScreenNameAndOverLapBar extends StatelessWidget {

  String title;
  double percent;
  ScreenNameAndOverLapBar({Key? key,
    required this.title,
    required this.percent
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: MyStyles.white20Normal,
        ),
        const SizedBox(
          height: 5,
        ),

        //Overlap Container
        overLapProgressBar(context: context, percent: percent),

        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
