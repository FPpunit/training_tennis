import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_pro/screens/tournament/player/provider/player_tournament_provider.dart';
import 'package:new_pro/utils/constants.dart';
import 'package:new_pro/utils/my_images.dart';
import 'package:new_pro/utils/ui_helper/textfields.dart';
import 'package:new_pro/utils/ui_helper/ui_helper.dart';
import 'package:provider/provider.dart';

import '../../../utils/my_app_theme.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_styles.dart';

class TournamentRegistration extends StatefulWidget {
  const TournamentRegistration({Key? key}) : super(key: key);

  @override
  State<TournamentRegistration> createState() => _TournamentRegistrationState();
}

class _TournamentRegistrationState extends State<TournamentRegistration> {
  late double height;

  late double width;

  TextEditingController nameController1 = TextEditingController();

  TextEditingController nameController2 = TextEditingController();

  TextEditingController phoneController1 = TextEditingController();

  TextEditingController phoneController2 = TextEditingController();
  TextEditingController tournamentFeeController = TextEditingController();




  List<String> items = <String>['Singles', 'Doubles'];
  List<String> methods = <String>[];

  var payment =  [
        {
          'type': 'Paypal',
          'qrImg': MyImages.qrImg,
        },
        {
          'type': 'Google Pay',
          'qrImg': MyImages.qrImg,
        },
        {
          'type': 'Union Pay',
          'qrImg': MyImages.qrImg,
        },
  ];

  @override
  void initState() {
    super.initState();
    getPaymentMethods();

  }

  getPaymentMethods(){
    for (var element in payment) {
      element.forEach((key, value) {
        if(key == 'type') {
          methods.add(value);
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    tournamentFeeController.text = '$ruppe 3000';

    return Scaffold(
        appBar: mAppBar(title: tournamentRegistration),
        body: Consumer<PlayerTournamentProvider>(
          builder: (context, provider, child) => Container(
              height: height,
              width: width,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      ///Register for
                      subTitleText(text: registerFor),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Row(
                            children: [
                              Expanded(
                                  child: hint14Text(text: dropDownDefaultText)),
                            ],
                          ),
                          items: items
                              .map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: MyStyles.white14Regular,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                          value: provider.selectedType,
                          onChanged: (String? value) {
                            provider.onSelect(value: value!);
                            tournamentFeeController.text = (provider.selectedType == 'Singles')?'$ruppe 3000':'$ruppe 4000';
                          },
                          buttonStyleData: ButtonStyleData(
                            height: 50,
                            width: width,
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: MyAppTheme.cardBgSecColor,
                              ),
                              color: MyAppTheme.cardBorderBgColor,
                            ),
                            elevation: 2,
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                            ),
                            iconSize: 24,
                            iconEnabledColor: MyAppTheme.whiteColor,
                            iconDisabledColor: MyAppTheme.whiteColor,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            width: width,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            maxHeight: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: MyAppTheme.DropdownBgColor,
                            ),
                            offset: const Offset(0, -5),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(5),
                              thickness: MaterialStateProperty.all<double>(6),
                              thumbVisibility:
                                  MaterialStateProperty.all<bool>(true),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                            padding: EdgeInsets.only(left: 14, right: 14),
                          ),
                        ),
                      ),


                      ///TextFields
                      subTitleText(
                          text:
                              (provider.selectedType == 'Singles' || provider.selectedType == null)
                                  ? participantName
                                  : participantName1),
                      nameTextfield(controller: nameController1),
                      subTitleText(text: phoneNum),
                      phoneNumberTextfield(controller: phoneController1),

                      Visibility(
                          visible: (provider.selectedType == 'Doubles'),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              subTitleText(text: participantName2),
                              nameTextfield(controller: nameController2),
                              subTitleText(text: phoneNum),
                              phoneNumberTextfield(controller: phoneController2),
                            ],
                          )),

                      ///Tournament Fee
                      subTitleText(text: tournamentFee),
                      disableTextfield(controller: tournamentFeeController),

                      ///Selected Payment Method
                      subTitleText(text: selectPaymentMethod),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Row(
                            children: [
                              Expanded(
                                  child: hint14Text(text: dropDownDefaultText)),
                            ],
                          ),
                          items: methods.map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: MyStyles.white14Regular,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                          value: provider.selectedMethod,
                          onChanged: (String? value) {
                            provider.onSelectMethod(value: value!);
                          },
                          buttonStyleData: ButtonStyleData(
                            height: 50,
                            width: width,
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: MyAppTheme.cardBgSecColor,
                              ),
                              color: MyAppTheme.cardBorderBgColor,
                            ),
                            elevation: 2,
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                            ),
                            iconSize: 24,
                            iconEnabledColor: MyAppTheme.whiteColor,
                            iconDisabledColor: MyAppTheme.whiteColor,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            width: width,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            maxHeight: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: MyAppTheme.DropdownBgColor,
                            ),
                            offset: const Offset(0, -5),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(5),
                              thickness: MaterialStateProperty.all<double>(6),
                              thumbVisibility:
                                  MaterialStateProperty.all<bool>(true),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                            padding: EdgeInsets.only(left: 14, right: 14),
                          ),
                        ),
                      ),

                      ///QR Image
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: selectedQRPictureForTournamentFeePage(
                            qrImg: MyImages.qrImg),
                      ),

                      /// Payment Receipt
                      subTitleText(text: paymentReceipt),
                      DottedBorder(
                        color: MyAppTheme.MainColor,
                        dashPattern: const [10],
                        radius: const Radius.circular(8),
                        borderType: BorderType.RRect,
                        child: Container(
                          height: height * 0.104,
                          width: width,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            uploadPhoto,
                            style: MyStyles.categoryStyle,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: height * .08,
                        child: null,
                      ),
                    ].map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: e,
                          ),
                        )
                        .toList(),
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
                                backgroundColor: MyAppTheme.bgColor,
                                side: const BorderSide(
                                  color: MyAppTheme.MainColor,
                                  width: 1,
                                ),
                                fixedSize: Size(
                                    MediaQuery.of(context).size.width * .44, 50)),
                            child: const Text(
                              cancel,
                              style: TextStyle(
                                  fontSize: 16, color: MyAppTheme.MainColor),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              print(nameController1.text);
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                backgroundColor: MyAppTheme.MainColor,
                                side: const BorderSide(
                                  color: MyAppTheme.MainColor,
                                  width: 1,
                                ),
                                fixedSize: Size(
                                    MediaQuery.of(context).size.width * .44, 50)),
                            child: Text(
                              register,
                              style: MyStyles.white12Light,
                            )),
                      ]),
                ),
              ])),
        ));
  }
}
