import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:new_pro/custom/screen_name_overlapbar.dart';
import 'package:new_pro/screens/tournament_venue/tournament_venue.dart';
import 'package:new_pro/utils/ui_helper/textfields.dart';
import '../../utils/my_colors.dart';
import '../../utils/my_string.dart';
import '../../utils/my_styles.dart';
import '../../utils/ui_helper/ui_helper.dart';

class Officials extends StatefulWidget {
  const Officials({Key? key}) : super(key: key);

  @override
  State<Officials> createState() => _OfficialsState();
}

class _OfficialsState extends State<Officials> {
  int times = 1;
  var nameController0 = TextEditingController();
  var phoneController0 = TextEditingController();
  var nameController1 = TextEditingController();
  var phoneController1 = TextEditingController();

  List<Map<String,dynamic>> officials = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: myAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height*.85,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [

                    ScreenNameAndOverLapBar(title: MyStrings.tournamentOfficial,percent: 50),

                    ListView.builder(
                      itemCount: times,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: (index != 0 ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Divider(
                            color: MyColors.bgCardSecondary,
                              ),
                            ),
                          ),

                          /// Name TextFields
                          Row(
                            mainAxisAlignment: (index == 0)
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Name',
                                style: MyStyles.white16Regular,
                              ),

                              (index == 0)
                                  ? const Text(' *',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 14))
                                  : TextButton(
                                      onPressed: () {
                                        times--;
                                        index--;
                                        setState(() {});
                                      },
                                      child: const Text(
                                        'Remove',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 14),
                                      )),
                            ],
                          ),
                          const SizedBox(height: 10),

                          nameTextfield(controller: (index==0)?nameController0 : nameController1),

                          const SizedBox(height: 10),

                          //Phone Number

                          (index == 0)
                              ? RichText(
                                  text: TextSpan(
                                      text: 'Phone Number',
                                      style: MyStyles.white16Regular,
                                      children: const [
                                        TextSpan(
                                            text: ' *',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 14))
                                      ]),
                                )
                              : Text(
                                  'Phone Number',
                                  style: MyStyles.white16Regular,
                                ),
                          const SizedBox(height: 10),

                          phoneNumberTextfield(controller: (index==0)?phoneController0 : phoneController1),

                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: times < 2,
                      child: DottedBorder(
                          radius: const Radius.circular(12),
                          borderType: BorderType.RRect,
                          padding: EdgeInsets.zero,
                          dashPattern: const [18],
                          color: MyColors.primary,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                fixedSize: Size(
                                    MediaQuery.of(context).size.width, 45),
                                backgroundColor: MyColors.primaryLight),
                            onPressed: () {
                              times++;
                              officials.add({
                                'name' : nameController0.text.toString(),
                                'phoneNumber' : phoneController0.text.toString(),
                              });
                              setState(() {});
                            },
                            child: Text(
                              'Add Another Official',
                              style: TextStyle(
                                  color: MyColors.primary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                  ],
                ),
              ),

              //footer btn
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
                          if(times == 2){
                            officials.add({
                              'name' : nameController1.text.toString(),
                              'phoneNumber' : phoneController1.text.toString(),
                            });
                            Navigator.push(context, MaterialPageRoute(builder:(context) => const TournamentVenue(),));
                          }
                          //print(officials);
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

class TournamentOfficials extends StatefulWidget {

  TournamentOfficials({Key? key}) : super(key: key);

  @override
  State<TournamentOfficials> createState() => _TournamentOfficialsState();
}

class _TournamentOfficialsState extends State<TournamentOfficials> {
  int times = 1;

  var nameController0 = TextEditingController();

  var phoneController0 = TextEditingController();

  var nameController1 = TextEditingController();

  var phoneController1 = TextEditingController();

  List<Map<String,dynamic>> officials = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: myAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [

                    ScreenNameAndOverLapBar(title: MyStrings.tournamentOfficial,percent: 50),

                    ListView.builder(
                      itemCount: times,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: (index != 0 ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Divider(
                                color: MyColors.bgCardSecondary,
                              ),
                            ),
                          ),

                          /// Name TextFields
                          Row(
                            mainAxisAlignment: (index == 0)
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Name',
                                style: MyStyles.white16Regular,
                              ),

                              (index == 0)
                                  ? const Text(' *',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 14))
                                  : TextButton(
                                  onPressed: () {
                                    times--;
                                    index--;
                                    setState(() {});
                                  },
                                  child: const Text(
                                    'Remove',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14),
                                  )),
                            ],
                          ),
                          const SizedBox(height: 10),

                          nameTextfield(controller: (index==0)?nameController0 : nameController1),

                          const SizedBox(height: 10),

                          //Phone Number

                          (index == 0)
                              ? RichText(
                            text: TextSpan(
                                text: 'Phone Number',
                                style: MyStyles.white16Regular,
                                children: const [
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 14))
                                ]),
                          )
                              : Text(
                            'Phone Number',
                            style: MyStyles.white16Regular,
                          ),
                          const SizedBox(height: 10),

                          phoneNumberTextfield(controller: (index==0)?phoneController0 : phoneController1),

                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: times < 2,
                      child: DottedBorder(
                          radius: const Radius.circular(12),
                          borderType: BorderType.RRect,
                          padding: EdgeInsets.zero,
                          dashPattern: const [18],
                          color: MyColors.primary,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                fixedSize: Size(
                                    MediaQuery.of(context).size.width, 45),
                                backgroundColor: MyColors.primaryLight),
                            onPressed: () {
                              times++;
                              officials.add({
                                'name' : nameController0.text.toString(),
                                'phoneNumber' : phoneController0.text.toString(),
                              });
                              setState(() {});
                            },
                            child: Text(
                              'Add Another Official',
                              style: TextStyle(
                                  color: MyColors.primary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                          const SizedBox(
                            height: 80,
                          )

                  ],
                ),
              ),

              //footer btn
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
                          if(times == 2){
                            officials.add({
                              'name' : nameController1.text.toString(),
                              'phoneNumber' : phoneController1.text.toString(),
                            });
                            Navigator.push(context, MaterialPageRoute(builder:(context) => const TournamentVenue(),));
                          }
                          //print(officials);
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


