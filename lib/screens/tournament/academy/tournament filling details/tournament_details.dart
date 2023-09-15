import 'dart:core';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_pro/screens/tournament/academy/tournament%20filling%20details/tournament_details_filling_screen_list_provider.dart';
import 'package:new_pro/utils/constants.dart';
import 'package:new_pro/utils/ui_helper/ui_helper.dart';
import 'package:provider/provider.dart';
import '../../../../utils/my_app_theme.dart';
import '../../../../utils/my_styles.dart';



class TournamentDetails extends StatefulWidget {

  List selectedDataForCat;
  List selectedDataForFee;
  String tourSlots;
  String tournamentUUID;

  TournamentDetails({Key? key,
    required this.selectedDataForCat,
    required this.selectedDataForFee,
    required this.tourSlots,
    required this.tournamentUUID,}) : super(key: key);

  @override
  State<TournamentDetails> createState() => _TournamentDetailsState();
}

class _TournamentDetailsState extends State<TournamentDetails> {

  TextEditingController feeController = TextEditingController();
  TextEditingController desController = TextEditingController();

  final List<String> listCategory = ["Men Single", "Men Doubles", "Women Single", "Women Doubles", "Mix Double"];
  final List<String> items = ['Under 10', 'Under 12', 'Under 14', 'Mains', '35+', '45+', '55+', '65+', 'Open'  ];

  List selectDataCat = [];
  List selectDataFee = [];
  String tournamentId ='';

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) => fillValues());
  }

  fillValues(){

    Provider.of<TournamentDetailsFillingScreenListsProvider>(context,listen: false).fillByPrevData(
        category: widget.selectedDataForCat, fee: widget.selectedDataForFee);

    if(widget.tourSlots != 'null'){
      desController.text =widget.tourSlots;
    }

    tournamentId = widget.tournamentUUID;

  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: MyAppTheme.bgColor,
      statusBarBrightness: Brightness.light,
    ));

    selectDataFee= Provider.of<TournamentDetailsFillingScreenListsProvider>(context).selectDataForFee;
    selectDataCat= Provider.of<TournamentDetailsFillingScreenListsProvider>(context).selectedDataForCat;
    // print('Selected Category ---------------------------->$selectDataCat');
    // print('Selected Fee ---------------------------->$selectDataFee');
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(

        backgroundColor: MyAppTheme.bgColor,
        appBar: mAppBar(title: tournamentDetails,
           onTap: (){Navigator.pop(context);},
        ),
        body: Consumer<TournamentDetailsFillingScreenListsProvider>(
          builder: (context, provider, child) => Container(
            height: height,
            width: width,
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Stack(
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ///Tournament Details And Overlap Container
                      const Text(tournamentDetails,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: MyAppTheme.whiteColor,
                          )),

                      overLapProgressBar(context: context, percent: 20),

                      ///Tournament Category and Add More btn
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              tournamentCategories,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: MyAppTheme.whiteColor,
                              ),
                            ),
                            GestureDetector(
                              onTap: ((selectDataCat[provider.top + 1]['type'] != '') &&
                                  (selectDataCat[provider.top + 1]['categories'].length != 0))
                                  ? () {provider.addMoreForCat();}
                                  : () {},
                              child: Container(
                                  height: 40,
                                  width: 100,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: MyAppTheme.MainColor,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: white12Text(text: AddMore)),
                            )
                          ],
                        ),
                      ),

                      ///Dropdown For category
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(right: 5.0, top: 5.0),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2<String>(
                                    isExpanded: true,
                                    hint: const Text(
                                      '--Select--',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: MyAppTheme.whiteColor,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    items: listCategory
                                        .map(
                                            (String item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: MyAppTheme.whiteColor,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )).toList(),
                                    value: provider.selectedValue,
                                    onChanged: (String? value) {
                                      provider.selectedValueFromDropDown(value: value!);
                                    },
                                    buttonStyleData: ButtonStyleData(
                                      height: 50,
                                      padding: const EdgeInsets.only(left: 5, right: 5),
                                      decoration: BoxDecoration(
                                          color: MyAppTheme.cardBorderBgColor,
                                          border: Border.all(
                                            color: MyAppTheme.cardBgSecColor,
                                          ),
                                          borderRadius: const BorderRadius.all(Radius.circular(5))),
                                    ),
                                    iconStyleData: const IconStyleData(
                                      icon: Icon(
                                        Icons.arrow_drop_down_sharp,
                                      ),
                                      iconSize: 25,
                                    ),
                                    dropdownStyleData: DropdownStyleData(
                                      maxHeight: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: MyAppTheme.cardBgSecColor,
                                      ),
                                      offset: const Offset(0, -5),
                                      scrollbarTheme: ScrollbarThemeData(
                                        radius: const Radius.circular(5),
                                        thickness:
                                        MaterialStateProperty.all<double>(6),
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
                              )),
                          Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 5.0, top: 5.0),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2<String>(
                                    isExpanded: true,
                                    hint: const Text(
                                      '--Select Age Group--',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: MyAppTheme.whiteColor,
                                      ),
                                    ),
                                    items: items.map((item) {
                                      return DropdownMenuItem(
                                        value: item,
                                        //disable default onTap to avoid closing menu when selecting an item
                                        enabled: false,
                                        child: StatefulBuilder(
                                          builder: (context, menuSetState) {
                                            final isSelected = provider.selectedItems.contains(item);
                                            return Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                  onTap: (selectDataCat[provider.top+1]['type'] != '') ?() {
                                                    if (item != 'select') {
                                                      provider.checkBoxFun(
                                                          item: item,
                                                          isSelected: isSelected);
                                                      menuSetState(() {});
                                                    } else {}
                                                  } : (){},
                                                  child: Padding(
                                                      padding: const EdgeInsets.only(
                                                          left: 10.0, right: 10.0),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Text(
                                                            item,
                                                            style: const TextStyle(
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.w400,
                                                              color: MyAppTheme.whiteColor,
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ),
                                                          if (isSelected)
                                                            const Icon(
                                                              Icons.check_box,
                                                              color: MyAppTheme.MainColor,
                                                            )
                                                          else
                                                            Icon(
                                                              Icons.check_box_outline_blank,
                                                              color: MyAppTheme.customTitleColor,
                                                            ),
                                                        ],
                                                      )),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      );
                                    }).toList(),
                                    //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
                                    value: provider.selectedItems.isEmpty ? null : provider.selectedItems.last,
                                    onChanged: (value) {},
                                    selectedItemBuilder: (context) {
                                      return items.map(
                                            (item) {
                                          return Container(
                                            alignment: Alignment.centerLeft,
                                            child: const Text(
                                              // selectedItems.join(', '),
                                              '--Select Age Group--',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: MyAppTheme.whiteColor,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              maxLines: 1,
                                            ),
                                          );
                                        },
                                      ).toList();
                                    },
                                    buttonStyleData: ButtonStyleData(
                                      height: 50,
                                      padding: const EdgeInsets.only(left: 5, right: 5),
                                      decoration: BoxDecoration(
                                          color: MyAppTheme.cardBorderBgColor,
                                          border: Border.all(
                                            color: MyAppTheme.cardBgSecColor,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5))),
                                    ),
                                    dropdownStyleData: DropdownStyleData(
                                      maxHeight: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: MyAppTheme.cardBgSecColor,
                                      ),
                                      offset: const Offset(0, -5),
                                      scrollbarTheme: ScrollbarThemeData(
                                        radius: const Radius.circular(5),
                                        thickness:
                                        MaterialStateProperty.all<double>(6),
                                        thumbVisibility:
                                        MaterialStateProperty.all<bool>(true),
                                      ),
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      height: 40,
                                      padding: EdgeInsets.zero,
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),

                      if (selectDataCat.isNotEmpty) ...[
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: selectDataCat.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return (selectDataCat[index]['categories'].length != 0 )
                                ? Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: SizedBox(
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: width * 0.8,
                                        child: Row(
                                          children: [
                                            selectedContainer(text: selectDataCat[index]['type']),
                                            Expanded(
                                              child: ListView.builder(
                                                scrollDirection:
                                                Axis.horizontal,
                                                shrinkWrap: true,
                                                physics:
                                                const BouncingScrollPhysics(),
                                                itemCount: selectDataCat[index]['categories'].length,
                                                itemBuilder: (context, idx) =>
                                                    Container(
                                                        alignment: Alignment.center,
                                                        height: 30,
                                                        margin:const EdgeInsets.only(right: 10),
                                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                                        decoration:
                                                        BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: MyAppTheme.cardBorderBgColor,
                                                            border: Border.all(
                                                              color: (MyAppTheme.cardBgSecColor),
                                                            )),
                                                        child: Text(
                                                          selectDataCat[index]['categories'][idx],
                                                          style: const TextStyle(
                                                              fontWeight:FontWeight.w500,
                                                              fontSize: 14,
                                                              color: (MyAppTheme.whiteColor)),
                                                        )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                            onTap: () {
                                              provider.delete(index);
                                            },
                                            child: SvgPicture.asset(
                                              'assets/images/delete_league.svg',
                                              allowDrawingOutsideViewBox:
                                              true,
                                              height: 20,
                                              width: 20,
                                            )),
                                      )
                                    ],
                                  ),
                                ))
                                : Container();
                          },
                        )
                      ],

                      ///Tournament fee and Add More btn
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              tournamentFee,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: MyAppTheme.whiteColor,
                              ),
                            ),
                            GestureDetector(
                              onTap:
                              ((selectDataFee[provider.topForFee + 1]['type'] != '') &&
                                  (selectDataFee[provider.topForFee + 1]['price'] != ''))
                                  ? () {
                                if (selectDataFee.isNotEmpty) {
                                  provider.addMoreForFee();
                                  feeController.clear();
                                }
                              } : () {},
                              child: Container(
                                  height: 40,
                                  width: 100,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: MyAppTheme.MainColor,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: white12Text(text: AddMore)),
                            )
                          ],
                        ),
                      ),

                      ///Dropdown and fee input field.
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(right: 5.0, top: 5.0),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2<String>(
                                    isExpanded: true,
                                    hint: const Text(
                                      '--Select--',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: MyAppTheme.whiteColor,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    items: listCategory.map(
                                            (String item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: MyAppTheme.whiteColor,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                        .toList(),
                                    value: provider.selectedCatForFee,
                                    onChanged: (String? value) {
                                      provider.selectedCatForFee = value!;

                                      provider.addingDataForTournamentFee(
                                          category: value
                                      );
                                    },
                                    buttonStyleData: ButtonStyleData(
                                      height: 50,
                                      padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                      decoration: BoxDecoration(
                                          color: MyAppTheme.cardBorderBgColor,
                                          border: Border.all(
                                            color: MyAppTheme.cardBgSecColor,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5))),
                                    ),
                                    iconStyleData: const IconStyleData(
                                      icon: Icon(
                                        Icons.arrow_drop_down_sharp,
                                      ),
                                      iconSize: 25,
                                    ),
                                    dropdownStyleData: DropdownStyleData(
                                      maxHeight: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: MyAppTheme.cardBgSecColor,
                                      ),
                                      offset: const Offset(0, -5),
                                      scrollbarTheme: ScrollbarThemeData(
                                        radius: const Radius.circular(5),
                                        thickness: MaterialStateProperty.all<double>(6),
                                        thumbVisibility: MaterialStateProperty.all<bool>(true),
                                      ),
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      height: 40,
                                      padding: EdgeInsets.only(left: 14, right: 14),
                                    ),
                                  ),
                                ),
                              )),
                          Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 5.0, top: 5.0),
                                decoration: BoxDecoration(
                                    color: MyAppTheme.cardBorderBgColor,
                                    border: Border.all(
                                      color: MyAppTheme.cardBgSecColor,
                                    ),
                                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                                child: TextFormField(
                                  cursorColor: MyAppTheme.whiteColor,
                                  textCapitalization: TextCapitalization.words,
                                  autovalidateMode:AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.left,
                                  controller: feeController,
                                  enabled: (provider.selectedCatForFee == null) ? false : true,
                                  onEditingComplete: () {
                                    provider.addingDataForTournamentFee(
                                        category: provider.selectedCatForFee.toString(),
                                        text: feeController.text);
                                    FocusManager.instance.primaryFocus?.unfocus();
                                  },
                                  style: MyStyles.white14Regular,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.currency_rupee,
                                      color: MyAppTheme.hintTxtColor,
                                      size: 16,
                                    ),
                                    border: InputBorder.none,

                                  ),
                                ),
                              )),
                        ],
                      ),

                      (selectDataFee.isNotEmpty )
                          ? SizedBox(
                        width: width,
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            primary: false,
                            shrinkWrap: true,
                            itemCount: selectDataFee.length,
                            itemBuilder: (BuildContext context, int index) {
                              return (selectDataFee[index]['price'] != ''
                                  && selectDataFee[index]['price'] != null)
                                  ? Padding(
                                  padding:
                                  const EdgeInsets.only(top: 10.0),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: width * .8,
                                        height: 40,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            selectedContainer(
                                              text: selectDataFee[index]['type'],
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              height: 40,
                                              margin: const EdgeInsets.only(right: 10),
                                              padding: const EdgeInsets.symmetric(horizontal: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  color: MyAppTheme.cardBorderBgColor,
                                                  border: Border.all(
                                                    color: (MyAppTheme.cardBgSecColor),
                                                  )),
                                              child: Text(
                                                  '$ruppe ${selectDataFee[index]['price']}',
                                                  style: MyStyles.white14Regular),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            provider.deleteAddedFee(index);
                                            feeController.clear();
                                          },
                                          child: SvgPicture.asset(
                                            'assets/images/delete_league.svg',
                                            allowDrawingOutsideViewBox: true,
                                            height: 20,
                                            width: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ))
                                  : Container();
                            }),
                      )
                          : Container(),

                      ///Tournament Slots
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          tournamentSlots,
                          style: MyStyles.white16Regular,
                        ),
                      ),
                      TextFormField(
                          scrollPadding:EdgeInsets.only(bottom:height*.09),
                          cursorColor: MyAppTheme.whiteColor,
                          style: MyStyles.white16Regular,
                          enableInteractiveSelection: false,
                          controller: desController,
                          onEditingComplete: (){
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(12),
                            hintText: 'Enter a Description',
                            fillColor: MyAppTheme.cardBorderBgColor,
                            enabledBorder: OutlineInputBorder(
                                borderSide:BorderSide(color: MyAppTheme.cardBgSecColor),
                                borderRadius: BorderRadius.circular(8)),
                            hintStyle: MyStyles.grey14Light,
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: MyAppTheme.cardBgSecColor),
                                borderRadius: BorderRadius.circular(8)),
                          )),
                      SizedBox(
                        height: height*.08,
                      )
                    ],
                  ),
                ),
                //footer btn
                Align (
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
                               backgroundColor: MyAppTheme.bgColor,
                              side: const BorderSide(
                                color: MyAppTheme.MainColor,
                                width: 1,
                              ),
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width * .42, 50)),
                          child: const Text(
                            'Back',
                            style: TextStyle(fontSize: 16, color: MyAppTheme.MainColor),
                          )),
                      ElevatedButton(
                          onPressed: (){
                            var resultCatList = [];
                            var resultFeeList = [];
                            selectDataCat.forEach((element) {
                              if(element['type'] != ''){
                                resultCatList.add(element);
                              }
                            });
                            selectDataFee.forEach((element) {
                              if(element['type'] != ''){
                                resultFeeList.add(element);
                              }
                            });

                            provider.saveDetails(
                                context: context,
                                tournamentUUId: tournamentId,
                                description: desController.text,
                                selectedCategoriesData: resultCatList,
                                selectedFeeData: resultFeeList);
                            // print('SelectedListForCat------------------------->$selectDataCat');
                            // print('SelectedListForFee------------------------->$selectDataFee');
                            // print(desController.text);
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
                              fixedSize: Size(MediaQuery.of(context).size.width * .4, 50)),
                          child: Text('Next',
                            style: MyStyles.white12Light,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


