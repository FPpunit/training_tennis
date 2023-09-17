import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:new_pro/custom/screen_name_overlapbar.dart';
import 'package:new_pro/screens/tournament/academy/provider.dart';
import 'package:new_pro/screens/tournament/academy/tournament_venue.dart';
import 'package:new_pro/utils/my_app_theme.dart';
import 'package:new_pro/utils/ui_helper/textfields.dart';
import 'package:provider/provider.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_string.dart';
import '../../../utils/my_styles.dart';
import '../../../utils/ui_helper/ui_helper.dart';

class Officials extends StatefulWidget {
  String type;
  int index;
  List tournamentList;
  Officials({Key? key,required this.index,required this.tournamentList,required this.type}) : super(key: key);

  @override
  State<Officials> createState() => _OfficialsState();
}

class _OfficialsState extends State<Officials> {

  List officialsList =[];
  var nameController0 = TextEditingController();
  var phoneController0 = TextEditingController();
  var nameController1 = TextEditingController();
  var phoneController1 = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) => fillStoreData());
  }

  fillStoreData(){
    Provider.of<ProviderTournament>(context,listen: false).fillStoredData(widget.tournamentList[widget.index]['details']['official_groups']);
  }


  @override
  Widget build(BuildContext context) {
    officialsList = Provider.of<ProviderTournament>(context).officials;

    final formGlobalKey =GlobalKey < FormState > ();
    return Scaffold(
      appBar: myAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Consumer<ProviderTournament>(
          builder: (context, provider, child) {
            if(officialsList.isNotEmpty){
              nameController0.text = provider.officials[0]['name'];
              phoneController0.text = provider.officials[0]['phone'];
              if(officialsList.length ==2){
                nameController1.text = officialsList[1]['name'];
                phoneController1.text = officialsList[1]['phone'];
              }
            }
            return SizedBox(
              height: MediaQuery.of(context).size.height*.85,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: formGlobalKey,
                      child: Column(
                        children: [

                          ScreenNameAndOverLapBar(title: MyStrings.tournamentOfficial,percent: 34),

                          ListView.builder(
                            itemCount: (provider.count <= 2) ? provider.count : 2,
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
                                        ?  Text(' *',
                                        style: TextStyle(
                                            color : MyAppTheme.challengeBtnBgColor, fontSize: 14))
                                        : TextButton(
                                        onPressed: () {
                                          provider.deleteOfficials();

                                          nameController1.clear();
                                          phoneController1.clear();
                                        },
                                        child:  Text(
                                          'Remove',
                                          style: TextStyle(
                                              color:  MyAppTheme.challengeBtnBgColor,
                                              fontSize: 14),
                                        )),
                                  ],
                                ),
                                const SizedBox(height: 10),

                                nameTextfield(controller: (index==0)?nameController0 : nameController1,
                                    scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*.09)),


                                const SizedBox(height: 10),

                                //Phone Number

                                (index == 0)
                                    ? RichText(
                                  text: TextSpan(
                                      text: 'Phone Number',
                                      style: MyStyles.white16Regular,
                                      children:  [
                                        TextSpan(
                                            text: ' *',
                                            style: TextStyle(
                                                color: MyAppTheme.challengeBtnBgColor,
                                                fontSize: 14))
                                      ]),
                                )
                                    : Text(
                                  'Phone Number',
                                  style: MyStyles.white16Regular,
                                ),
                                const SizedBox(height: 10),

                                phoneNumberTextfield(controller: (index==0)?phoneController0 : phoneController1,
                                    scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*.09)),

                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: provider.count < 2,
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
                                    if(formGlobalKey.currentState!.validate()){
                                      formGlobalKey.currentState!.save();
                                      provider.increaseCount();
                                    }

                                  },
                                  child: Text(
                                    'Add Another Official',
                                    style: MyStyles.mainClr14Regular,
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.08,
                          )
                        ],
                      ),
                    ),
                  ),

                  //footer btn
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
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
                              if(formGlobalKey.currentState!.validate()){
                                formGlobalKey.currentState!.save();
                                var resultOfficialsList = [];
                                var data = [
                                   {
                                     'name': nameController0.text.toString(),
                                     'phone': phoneController0.text.toString(),
                                   },{
                                     'name': nameController1.text.toString(),
                                     'phone': phoneController1.text.toString(),
                                   }
                                ];
                                provider.editOfficials(data);
                                provider.officials.forEach((element) {
                                  if(element['name'] != ''){
                                    resultOfficialsList.add(element);
                                  }
                                });
                                 provider.saveTournamentOfficials(context: context, tournamentUUID: widget.tournamentList[widget.index]['uuid'], officials: resultOfficialsList);
                                  //Navigator.push(context, MaterialPageRoute(builder:(context) => const TournamentVenue(),));
                              }
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
            );
          },
        ),
      ),
    );
  }
}
