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



class TournamentDetails extends StatelessWidget {
  TournamentDetails({Key? key}) : super(key: key);

  TextEditingController feeController = TextEditingController();
  TextEditingController desController = TextEditingController();

  final List<String> listCategory = ["Men Single", "Men Doubles", "Women Single", "Women Doubles", "Mix Double"];

  final List<String> items = ['Under 10', 'Under 12', 'Under 14', 'Mains', '35+', '45+', '55+', '65+', 'Open'  ];


  @override
  Widget build(BuildContext context) {
    //print('select -------------------------------------------> $select');
    // print(
    //     'select fee -------------------------------------------> $selectDataForFee');

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: MyAppTheme.bgColor,
      statusBarBrightness: Brightness.light,
    ));

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: MyAppTheme.bgColor,
      appBar: mAppBar(title: tournamentDetails),
      body: Consumer<TournamentDetailsFillingScreenListsProvider>(
        builder: (context, provider, child) => Container(
          height: height,
          width: width,
          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Stack(
            children: [
              SingleChildScrollView(
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

                    Container(
                        height: 5,
                        width: width,
                        margin: const EdgeInsets.only(top: 5.0),
                        child: Stack(
                          children: [
                            Container(
                              height: 5,
                              width: width * 0.20,
                              decoration: const BoxDecoration(
                                color: MyAppTheme.MainColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5.0),
                                    bottomRight: Radius.circular(5.0),
                                    topLeft: Radius.circular(5.0),
                                    bottomLeft: Radius.circular(5.0)),
                              ),
                            ),
                            Container(
                              height: 5,
                              width: width,
                              color: MyAppTheme.progressInactiveColor,
                            ),
                          ],
                        )),

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
                            onTap: ((provider.select[provider.top + 1]
                                            ['type'] !=
                                        '') &&
                                    (provider.select[provider.top + 1]
                                                ['category']
                                            .length !=
                                        0))
                                ? () {
                                    provider.add();
                                  }
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
                                          ))
                                  .toList(),
                              value: provider.selectedValue,
                              onChanged: (String? value) {
                                provider.selectedValueFromDropDown(
                                    value: value!);
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
                                      final isSelected =
                                          provider.selectedItems.contains(item);
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: (provider.select[provider.top+1]['type'] != '') ?() {
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
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: MyAppTheme
                                                            .whiteColor,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    if (isSelected)
                                                      const Icon(
                                                        Icons.check_box,
                                                        color: MyAppTheme
                                                            .MainColor,
                                                      )
                                                    else
                                                      Icon(
                                                        Icons
                                                            .check_box_outline_blank,
                                                        color: MyAppTheme
                                                            .customTitleColor,
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
                              value: provider.selectedItems.isEmpty
                                  ? null
                                  : provider.selectedItems.last,
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

                    if (provider.select.isNotEmpty) ...[
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: provider.select.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return (provider.select[index]['category'].length != 0 )
                              ? Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: SizedBox(
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: width * 0.8,
                                          child: Row(
                                            children: [
                                              (selectedContainer(
                                                  text: provider.select[index]
                                                      ['type'])),
                                              Expanded(
                                                child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  shrinkWrap: true,
                                                  physics:
                                                      const BouncingScrollPhysics(),
                                                  itemCount: provider
                                                      .select[index]['category']
                                                      .length,
                                                  itemBuilder: (context, idx) =>
                                                      Container(
                                                          alignment: Alignment
                                                              .center,
                                                          height: 30,
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 10),
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          decoration:
                                                              BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  color: MyAppTheme
                                                                      .cardBorderBgColor,
                                                                  border: Border
                                                                      .all(
                                                                    color: (MyAppTheme
                                                                        .cardBgSecColor),
                                                                  )),
                                                          child: Text(
                                                            provider.select[
                                                                        index]
                                                                    ['category']
                                                                [idx],
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 14,
                                                                color: (MyAppTheme
                                                                    .whiteColor)),
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
                            onTap: ((provider.selectDataForFee[
                                            provider.topForFee + 1]['type'] !=
                                        '') &&
                                    (provider.selectDataForFee[
                                            provider.topForFee + 1]['fee'] !=
                                        ''))
                                ? () {
                                    if (provider.selectDataForFee.isNotEmpty) {
                                      // topForFee++;
                                      // selectedCatForFee = null;
                                      // feeController.clear();
                                      // selectDataForFee
                                      //     .add({'type': '', 'fee': ''});
                                      // setState(() {});
                                      provider.addMoreForFee();
                                      feeController.clear();
                                    }
                                  }
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
                          decoration: BoxDecoration(
                              color: MyAppTheme.cardBorderBgColor,
                              border: Border.all(
                                color: MyAppTheme.cardBgSecColor,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                          child: TextFormField(
                            cursorColor: MyAppTheme.whiteColor,
                            textCapitalization: TextCapitalization.words,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.left,
                            controller: feeController,

                            onEditingComplete: () {
                              // selectDataForFee[topForFee + 1]['type'] =
                              //     selectedCatForFee;
                              // selectDataForFee[topForFee + 1]['fee'] =
                              //     feeController.text;
                              // setState(() {});
                              provider.addingDataForTournamentFee(
                                  category: provider.selectedCatForFee.toString(),
                                  text: feeController.text);
                            },
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: MyAppTheme.whiteColor,
                            ),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.currency_rupee,
                                color: MyAppTheme.hintTxtColor,
                                size: 16,
                              ),
                              border: InputBorder.none,
                              //contentPadding: EdgeInsets.only(left: 10.0),
                            ),
                          ),
                        )),
                      ],
                    ),

                    (provider.selectDataForFee.isNotEmpty )
                        ? SizedBox(
                            width: width,
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                primary: false,
                                shrinkWrap: true,
                                itemCount: provider.selectDataForFee.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return (provider.selectDataForFee[index]
                                              ['fee'] != '' && provider.selectDataForFee[index]
                                  ['fee'] != null)
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
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    selectedContainer(
                                                      text: provider
                                                              .selectDataForFee[
                                                          index]['type'],
                                                    ),
                                                    Container(
                                                        alignment: Alignment
                                                            .center,
                                                        height: 40,
                                                        margin: const EdgeInsets
                                                            .only(right: 10),
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 10),
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: MyAppTheme
                                                                    .cardBorderBgColor,
                                                                border:
                                                                    Border.all(
                                                                  color: (MyAppTheme
                                                                      .cardBgSecColor),
                                                                )),
                                                        child: Text(
                                                          '$ruppe ${provider.selectDataForFee[index]['fee']}',
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 14,
                                                              color: (MyAppTheme
                                                                  .whiteColor)),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // if (index == 0) {
                                                    //   selectDataForFee[0]
                                                    //       ['type'] = '';
                                                    //   selectDataForFee[0]['fee'] =
                                                    //       '';
                                                    //   selectedCatForFee = null;
                                                    //   feeController.clear();
                                                    // } else {
                                                    //   selectDataForFee
                                                    //       .removeAt(index);
                                                    //   selectedCatForFee = null;
                                                    //   feeController.clear();
                                                    //   topForFee--;
                                                    // }
                                                    //
                                                    // setState(() {});

                                                    provider
                                                        .deleteAddedFee(index);
                                                    feeController.clear();
                                                  },
                                                  child: SvgPicture.asset(
                                                    'assets/images/delete_league.svg',
                                                    allowDrawingOutsideViewBox:
                                                        true,
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

                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        tournamentSlots,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: MyAppTheme.whiteColor,
                        ),
                      ),
                    ),

                    TextFormField(
                        cursorColor: MyAppTheme.whiteColor,
                        style: MyStyles.white16Regular,
                        //scrollPadding: EdgeInsets.all(12),
                        enableInteractiveSelection: false,
                        controller: desController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(12),
                          hintText: 'Enter a Description',
                          fillColor: MyAppTheme.cardBorderBgColor,
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: MyAppTheme.cardBgSecColor),
                              borderRadius: BorderRadius.circular(8)),
                          hintStyle: MyStyles.grey14Light,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: MyAppTheme.cardBgSecColor),
                              borderRadius: BorderRadius.circular(8)),
                        ))
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

