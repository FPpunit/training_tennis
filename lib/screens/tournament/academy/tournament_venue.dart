import 'package:flutter/material.dart';
import 'package:new_pro/custom/screen_name_overlapbar.dart';
import 'package:new_pro/utils/my_app_theme.dart';
import 'package:new_pro/utils/my_string.dart';
import 'package:new_pro/utils/ui_helper/textfields.dart';
import 'package:new_pro/utils/ui_helper/ui_helper.dart';

import '../../../utils/constants.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_styles.dart';
import 'other_info.dart';

class TournamentVenue extends StatefulWidget {
  const TournamentVenue({Key? key}) : super(key: key);

  @override
  State<TournamentVenue> createState() => _TournamentVenueState();
}

class _TournamentVenueState extends State<TournamentVenue> {

  var nameController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    double height =MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: myAppBar(),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              SingleChildScrollView(
                //physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ScreenNameAndOverLapBar(title: tournamentVenue,percent: 67),
                    subTitleText(text: MyStrings.venueName),
                    const SizedBox(height: 4,),
                    nameTextfield(controller: nameController),
                    const SizedBox(height: 10,),

                    subTitleText(text: MyStrings.venueAddress),
                    const SizedBox(height: 4,),
                    SizedBox(
                      height: 55,
                      child: TextField(
                        cursorColor: MyAppTheme.whiteColor,
                        style: MyStyles.white16Regular,
                        //scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 24),
                        controller: addressController,
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          counter: const SizedBox.shrink(),
                          suffixIcon: const Icon(
                            Icons.my_location,
                            color: MyAppTheme.hintTxtColor,
                            size: 22,
                          ),
                          hintText: 'Enter venue address',
                          fillColor: MyAppTheme.cardBorderBgColor,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: MyAppTheme.cardBgSecColor),
                              borderRadius:
                              BorderRadius.circular(8)),
                          hintStyle: MyStyles.grey14Light,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: MyAppTheme.cardBgSecColor),
                              borderRadius:
                              BorderRadius.circular(8)),
                      ),),
                    ),

                    const SizedBox(height: 10,),
                    subTitleText(text: MyStrings.venuePhone),
                    const SizedBox(height: 4,),
                    phoneNumberTextfield(controller: phoneController),
                    const SizedBox(height: 10,),


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
                                MediaQuery.of(context).size!.width * .42, 50)),
                        child: Text(
                          'Back',
                          style: TextStyle(fontSize: 16, color: MyColors.primary),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder:(context) => OtherInformation(),));
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
                                MediaQuery.of(context).size!.width * .4, 50)),
                        child: Text(
                          'Next',
                          style: MyStyles.white12Light,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
