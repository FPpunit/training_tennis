import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_pro/custom/estimated_time_and_live_now_container.dart';
import 'package:new_pro/utils/constants.dart';
import 'package:new_pro/utils/my_images.dart';
import 'package:new_pro/utils/ui_helper/ui_helper.dart';

import '../../../utils/my_app_theme.dart';

class StaffHomeScreen extends StatefulWidget {
  const StaffHomeScreen({Key? key}) : super(key: key);

  @override
  State<StaffHomeScreen> createState() => _StaffHomeScreenState();
}

class _StaffHomeScreenState extends State<StaffHomeScreen> {
  late double height;
  late double width;
  var selectedIdx = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(

        leading: IconButton(
        icon: const Icon(Icons.menu,color: Colors.white,),
    onPressed: () => Scaffold.of(context).openDrawer(),),
        backgroundColor: MyAppTheme.bgColor,
        centerTitle: true,
        title: SizedBox(
          width: width * .3,
          child: Image.asset(
            MyImages.logo,
            fit: BoxFit.cover,
          ),
        ),
        actions: [
          InkWell(
            onTap: (){
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                title: const Text('AlertDialog Title'),
                content: const Text('AlertDialog description'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context,),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context,),
                    child: const Text('YES'),
                  ),
                ],
              ),);
            },
            child: Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.all(5),
                // width: width*.1,
                child: SvgPicture.asset(MyImages.logOutIc)),
          )
        ],
      ),

      body: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              white16LightText(text: 'Hello,'),
              white22mediumText(text: 'John Deo'),
              SizedBox(
                height: height * .05,
                // alignment: Alignment.center,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {
                        selectedIdx = 0;
                        setState(() {});
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: (selectedIdx == 0)
                              ? MyAppTheme.documentBgMainColor
                              : MyAppTheme.cardBorderBgColor,
                          border: Border.all(
                              color: (selectedIdx == 0)
                                  ? MyAppTheme.MainColor
                                  : MyAppTheme.cardBgSecColor),
                        ),
                        child: Text(ongoing,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: (selectedIdx == 0)
                                    ? MyAppTheme.MainColor
                                    : MyAppTheme.whiteColor)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        selectedIdx = 1;
                        setState(() {});
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: (selectedIdx == 1)
                              ? MyAppTheme.documentBgMainColor
                              : MyAppTheme.cardBorderBgColor,
                          border: Border.all(
                              color: (selectedIdx == 1)
                                  ? MyAppTheme.MainColor
                                  : MyAppTheme.cardBgSecColor),
                        ),
                        child: Text(upcoming,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: (selectedIdx == 1)
                                    ? MyAppTheme.MainColor
                                    : MyAppTheme.whiteColor)),
                      ),
                    ),
                  ],
                ),
              ),
              if (selectedIdx == 0) ...[
                ///Main Court
                titleText(text: mainCourt),
                LiveNowContainer(
                    height: height * .2, time: '0 min', roundName: qualRnd1),

                ///Side Court
                titleText(text: sideCourt),
                LiveNowContainer(
                    height: height * .2, time: '0 min', roundName: qualRnd1),
              ],

              if (selectedIdx == 1) ...[
                ///Main Court
                titleText(text: mainCourt),
                EstimatedStartTimeContainer(
                    height: height * .2, estimatedTime: '40 min', roundName: qualRnd1),
                EstimatedStartTimeContainer(
                    height: height * .2, estimatedTime: '40 min', roundName: qualRnd1),

                ///Side Court
                titleText(text: sideCourt),
                EstimatedStartTimeContainer(
                    height: height * .2, estimatedTime: '40 min', roundName: qualRnd1),
                EstimatedStartTimeContainer(
                    height: height * .2, estimatedTime: '40 min', roundName: qualRnd1),
              ],
            ].map((e) => Padding(padding: EdgeInsets.only(bottom: 5),
                child: e,
            )).toList(),
          ),
        ),
      ),

      // drawer: Drawer(
      //
      // ),
    );
  }
}
