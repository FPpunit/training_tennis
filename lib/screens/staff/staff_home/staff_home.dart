import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_pro/custom/estimated_time_and_live_now_container.dart';
import 'package:new_pro/screens/staff/staff_provider/staff_provider.dart';
import 'package:new_pro/utils/constants.dart';
import 'package:new_pro/utils/my_images.dart';
import 'package:new_pro/utils/ui_helper/ui_helper.dart';
import 'package:provider/provider.dart';

import '../../../utils/my_app_theme.dart';

class StaffHomeScreen extends StatelessWidget {
  StaffHomeScreen({Key? key}) : super(key: key);

  late double height;
  late double width;

  List category =[
    ongoing,
    upcoming
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(

        leading: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Transform.scale(
                scale: 0.3, // Adjust the scale factor as needed
                child: SvgPicture.asset(
                  'assets/images/drawer_ic.svg',
                  allowDrawingOutsideViewBox: true,
                ),
              ),
            );
          }
        ),
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


      body: Consumer<StaffProvider>(
        builder: (context, provider, child) => Container(
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
                  child: ListView.builder(
                    //physics: const NeverScrollableScrollPhysics(),
                    itemCount: category.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        provider.selectedIndex(index);
                      },
                      child: (provider.selectedIdxForStaffHome == index) ? selectedContainer(text: category[index],height: 35) :
                       unSelectedContainer(text: category[index],height: 35)
                    ),
                  ),
                ),
                if (provider.selectedIdxForStaffHome == 0) ...[
                  ///Main Court
                  titleText(text: mainCourt),
                  LiveNowContainer(
                      height: height * .2, time: '0 min', roundName: qualRnd1,setList: const [[0,0]],pointList: const ['0','0'],),

                  ///Side Court
                  titleText(text: sideCourt),
                  LiveNowContainer(
                      height: height * .2, time: '0 min', roundName: qualRnd1,setList: const [[0,0]],pointList: const ['0','0'],),
                ],

                if (provider.selectedIdxForStaffHome == 1) ...[
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
              ].map((e) => Padding(padding: const EdgeInsets.only(bottom: 5),
                  child: e,
              )).toList(),
            ),
          ),
        ),
      ),

    );
  }
}
