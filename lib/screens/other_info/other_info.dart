import 'package:flutter/material.dart';
import 'package:new_pro/custom/screen_name_overlapbar.dart';
import 'package:new_pro/screens/ofiicials/officials.dart';
import 'package:new_pro/utils/my_string.dart';
import 'package:new_pro/utils/ui_helper/ui_helper.dart';

import '../../utils/my_app_theme.dart';
import '../../utils/my_colors.dart';
import '../../utils/my_styles.dart';

class OtherInformation extends StatefulWidget {
  const OtherInformation({Key? key}) : super(key: key);

  @override
  State<OtherInformation> createState() => _OtherInformationState();
}

class _OtherInformationState extends State<OtherInformation> {
  late double height;
  late double width;

  @override
  Widget build(BuildContext context) {

    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;

    return Scaffold(

      appBar: myAppBar(),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ScreenNameAndOverLapBar(title: MyStrings.otherInfo, percent: 83.0),

                    subTitleText(text: MyStrings.additionalInfo),
                    const SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                      height: 135,
                      child: TextField(
                        //minLines: 3, // Set this
                        maxLines: 6, // and this
                        keyboardType: TextInputType.multiline,
                        cursorColor: MyAppTheme.hintTxtColor,
                        style: MyStyles.white16Regular,
                        //scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 24),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          counter: const SizedBox.shrink(),
                          hintText: MyStrings.tfAdditionalHint,
                          fillColor: MyAppTheme.cardBorderBgColor,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:  MyAppTheme.cardBgColor),
                              borderRadius:
                              BorderRadius.circular(5)),
                          hintStyle: MyStyles.grey14Light,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:  MyAppTheme.cardBgColor),
                              borderRadius:
                              BorderRadius.circular(5)),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    subTitleText(text: MyStrings.rulesRegulation),

                    const SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                      height: 135,
                      child: TextField(
                        //minLines: 3, // Set this
                        maxLines: 6, // and this
                        keyboardType: TextInputType.multiline,
                        cursorColor: MyAppTheme.whiteColor,
                        style: MyStyles.white16Regular,
                        //scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 24),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          counter: const SizedBox.shrink(),
                          hintText: MyStrings.tfRulesHint,
                          fillColor:  MyAppTheme.cardBorderBgColor,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:  MyAppTheme.cardBgColor),
                              borderRadius:
                              BorderRadius.circular(8)),
                          hintStyle: MyStyles.grey14Light,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color:  MyAppTheme.cardBgColor),
                              borderRadius:
                              BorderRadius.circular(8)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: MyColors.darkBg,
                            side: BorderSide(
                              color: MyColors.primary,
                              width: 1,
                            ),
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * .42, 50)),
                        child: Text(
                          'Back',
                          style: TextStyle(fontSize: 16, color: MyColors.primary),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          //Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const Officials(),));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: MyColors.primary,
                            side: BorderSide(
                              color: MyColors.primary,
                              width: 1,
                            ),
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * .4, 50)),
                        child: Text(
                          'Next',
                          style: MyStyles.white12Light,
                        )),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
