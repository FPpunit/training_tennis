import 'package:flutter/material.dart';
import 'package:new_pro/utils/ui_helper/ui_helper.dart';

import '../../utils/constants.dart';
import '../../utils/my_app_theme.dart';
import '../../utils/my_images.dart';
import '../../utils/my_styles.dart';

class TournamentsDetails extends StatefulWidget {
  TournamentsDetails({Key? key}) : super(key: key);

  @override
  State<TournamentsDetails> createState() => _TournamentsDetailsState();
}

class _TournamentsDetailsState extends State<TournamentsDetails> {
  late double height;

  late double width;

  int selectedIdx = 0;

  int index = 0;

  List<String> cat = [all, open, menSingles, womenSingles, mixedDoubles];

  String selectedCat = all;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // SizedBox(
            //   height: height * .22,
            //   child: Stack(
            //     children: [
            //       ClipRRect(
            //         borderRadius: const BorderRadius.vertical(
            //             bottom: Radius.circular(15)),
            //         child: Image(
            //           image: AssetImage(MyImages.summerChamp),
            //           width: width,
            //           fit: BoxFit.fill,
            //         ),
            //       ),
            //       Positioned(
            //         left: 10,
            //         top: 10,
            //         child: Card(
            //           shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(5)),
            //           color: MyAppTheme.cardBgColor,
            //           child: const Padding(
            //             padding: EdgeInsets.all(10.0),
            //             child: Icon(
            //               Icons.arrow_back,
            //               color: MyAppTheme.whiteColor,
            //               size: 22,
            //             ),
            //           ),
            //         ),
            //       ),
            //       Positioned(
            //         bottom: 10,
            //         left: 10,
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.end,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             titleText(text: summerChamp),
            //             Row(
            //               children: [
            //                 subTitleText(text: '20-03-2023/12-04-2023'),
            //               ],
            //             )
            //           ],
            //         ),
            //       )
            //     ],
            //   ),
            // ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    ///Date Container
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: (selectedIdx == index)
                            ? MyAppTheme.documentBgMainColor
                            : MyAppTheme.cardBorderBgColor,
                        border: Border.all(
                            color: (selectedIdx == index)
                                ? MyAppTheme.MainColor
                                : MyAppTheme.cardBgSecColor),
                      ),
                      child: Column(
                        children: [
                          Text('All', style: MyStyles.white14Light),
                          Text('20', style: MyStyles.white30SemiBold)
                        ],
                      ),
                    ),

                    ///Estimated Start time Container
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color:MyAppTheme.cardBgColor,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            height: height*.05,
                            width: width*.24,

                            child: Row(
                              children: [
                                Container(
                                  width: width*.12,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: MyAppTheme.MainColor,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: subTitleText(text: all),
                                ),
                                Container(
                                  width: width*.12,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: MyAppTheme.cardBgColor,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: subTitleText(text: live),
                                ),

                              ],
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            height: double.infinity,
                            width: 2,
                            color: MyAppTheme.cardBgSecColor,
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              height: height * .05,
                              //width: width*.6,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,

                                itemCount: cat.length,
                                itemBuilder: (context, index) => GestureDetector(
                                  onTap: () {
                                    selectedIdx = index;
                                    selectedCat = cat[index].toLowerCase();
                                    setState(() {});
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 8),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: (selectedIdx == index)
                                          ? MyAppTheme.documentBgMainColor
                                          : MyAppTheme.cardBorderBgColor,
                                      border: Border.all(
                                          color: (selectedIdx == index)
                                              ? MyAppTheme.MainColor
                                              : MyAppTheme.cardBgSecColor),
                                    ),
                                    child: Text(cat[index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: (selectedIdx == index)
                                                ? MyAppTheme.MainColor
                                                : MyAppTheme.whiteColor)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            // Container(
            //   height: 50,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(20), color: Colors.red),
            //   child: TabBar(
            //     indicator: BoxDecoration(
            //       color: Colors.red[800],
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //     labelColor: Colors.black,
            //    // dividerColor: Colors.black,
            //     // ignore: prefer_const_literals_to_create_immutables
            //     tabs: [
            //       Tab(
            //         icon: Icon(
            //           Icons.add_box,
            //           color: Colors.black,
            //         ),
            //       ),
            //       Tab(
            //         icon: Icon(
            //           Icons.video_call,
            //           color: Colors.black,
            //         ),
            //       ),
            //
            //     ],
            //   ),
            // ),
            // Expanded(
            //   child: TabBarView(
            //
            //       children: [
            //     Container(
            //       child: Center(
            //         child: Text('1',style: TextStyle(
            //           color: Colors.orange
            //         ),),
            //       ),
            //     ),Container(
            //       child: Center(
            //         child: Text('2',style: TextStyle(
            //             color: Colors.orange
            //         ),),
            //       ),
            //     ),
            //     // MyPostTab(),
            //     // MyReelsTab(),
            //     // MyTagTab(),
            //   ]),
            // ),
          ],
        ),
      ),
    );
  }
}
