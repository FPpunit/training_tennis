import 'dart:core';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_pro/utils/constants.dart';
import 'package:new_pro/utils/ui_helper/ui_helper.dart';

import '../../../utils/my_app_theme.dart';

class TournamentDetails extends StatefulWidget {
  const TournamentDetails({Key? key}) : super(key: key);

  @override
  State<TournamentDetails> createState() => _TournamentDetailsState();
}

class _TournamentDetailsState extends State<TournamentDetails> {
  TextEditingController userName = TextEditingController();
  var selectedCategory = "--Select--";
  var selectedAgegroup = "--Select-- Age Group";
  int idx = 0;
  List<String> listCategory = [
    "Men Single",
    "Men Doubles",
    "Women Single",
    "Women Doubles",
    "Mix Double",
  ];
  final List<String> items = [
    'Under 10',
    'Under 12',
    'Under 14',
    'Mains',
    '35+',
    '45+',
    '55+',
    '65+',
    'Open',
  ];
  String? selectedValue;
  List<Map<String, dynamic>> select = [];
  List<String> selectedItems = [];
  var data =[];

  @override
  Widget build(BuildContext context) {
    if(idx != 0){
      data = selectedItems.toList();
    }
    print(data);
    print(select);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: MyAppTheme.bgColor,
      statusBarBrightness: Brightness.light,
    ));
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    print(select.length);

    return Scaffold(
      backgroundColor: MyAppTheme.bgColor,
      appBar: mAppBar(title: tournamentDetails),
      body: Container(
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
                          onTap: () {
                            idx++;
                            setState(() {

                            });
                          },
                          child: Container(
                              height: 35,
                              width: 70,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: MyAppTheme.MainColor,
                                  borderRadius: BorderRadius.circular(8)),
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
                                .map((String item) => DropdownMenuItem<String>(
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
                            value: selectedValue,
                            onChanged: (String? value) {
                              selectedValue = value!;
                              idx++;
                              setState(() {});
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
                                        selectedItems.contains(item);
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (item != 'select') {
                                              isSelected
                                                  ? selectedItems.remove(item)
                                                  : selectedItems.add(item);
                                              setState(() {});
                                              menuSetState(() {});
                                            } else {}
                                          },
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
                                                      color:
                                                          MyAppTheme.whiteColor,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  if (isSelected)
                                                    const Icon(
                                                      Icons.check_box,
                                                      color:
                                                          MyAppTheme.MainColor,
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
                            value: selectedItems.isEmpty
                                ? null
                                : selectedItems.last,
                            onChanged: (value) {

                            },
                            selectedItemBuilder: (context) {
                              return items.map(
                                (item) {
                                  if (idx != 0) {
                                    select
                                        .add({'$selectedValue': selectedItems});
                                  }
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
                                thickness: MaterialStateProperty.all<double>(6),
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

                  const SizedBox(
                    height: 20,
                  ),

                  if (idx != 0) ...[
                    SizedBox(
                        height: height*.5,
                        child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: select.length,
                      itemBuilder: (context, index) {
                      return SizedBox(
                        height: height*.04,
                        child: Row(
                          children: [
                            (selectedContainer(text: selectedValue!)),
                            SizedBox(
                              width: width * .6,

                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: data.length,
                                itemBuilder: (context, index) =>
                                    Container(
                                        alignment: Alignment.center,
                                        height: 30,
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: MyAppTheme.cardBorderBgColor,
                                            border: Border.all(
                                              color: (MyAppTheme.cardBgSecColor),)
                                        ),
                                        child: Text( select[idx][selectedValue][index],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: (MyAppTheme.whiteColor)),
                                        )),
                              ),
                            ),
                            GestureDetector(
                                onTap: (){
                                  select.removeAt(idx);
                                  idx--;
                                  setState(() {

                                  });
                                },
                                child: SvgPicture.asset('assets/images/delete_league.svg'))
                          ],
                        ),
                      );
                    },))
                  ]

                  // Row(
                  //   children: [
                  //     if(index != 0 )...[(selectedContainer(text: selectedValue!)),],
                  //     SizedBox(
                  //       width: width*.7,
                  //       child: ListView.builder(
                  //           physics: const AlwaysScrollableScrollPhysics(),
                  //           primary: false,
                  //           shrinkWrap: true,
                  //           itemCount: 2,
                  //           itemBuilder: (BuildContext context, int index) {
                  //             return Padding(
                  //               padding: const EdgeInsets.only(top: 10.0),
                  //               child: Row(
                  //                 crossAxisAlignment: CrossAxisAlignment.center,
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   Row(
                  //                     crossAxisAlignment: CrossAxisAlignment.start,
                  //                     mainAxisAlignment: MainAxisAlignment.start,
                  //                     children: [
                  //                       Container(
                  //                         height: 40,
                  //                         decoration: BoxDecoration(
                  //                             color: MyAppTheme.progressInactiveColor,
                  //                             border: Border.all(
                  //                               color:  MyAppTheme.MainColor,
                  //                             ),
                  //                             borderRadius: const BorderRadius.all(
                  //                                 Radius.circular(5))
                  //                         ),
                  //                         child: Center(
                  //                           child: Padding(
                  //                             padding:  const EdgeInsets.only(left: 15.0,right: 15.0,top: 5.0,bottom: 5.0),
                  //                             child: Text("Single Men",style:  TextStyle(
                  //                               fontWeight: FontWeight.w700,
                  //                               fontSize: 12,
                  //                               color: MyAppTheme.MainColor,
                  //                               ),),
                  //                           ),
                  //                         ),
                  //                       ),
                  //                       Container(
                  //                         height: 40,
                  //                         width: width * 0.60,
                  //                         alignment: Alignment.center,
                  //                         child:  ListView.builder(
                  //                             scrollDirection: Axis.horizontal,
                  //                             itemCount: 5,
                  //                             itemBuilder: (BuildContext context, int index) {
                  //                               return Container(
                  //                                 margin: const EdgeInsets.only(left: 5.0),
                  //                                 height: 40,
                  //                                 decoration: BoxDecoration(
                  //                                     color: MyAppTheme.CardBgColor,
                  //                                     border: Border.all(
                  //                                       color: MyAppTheme.cardBgColor,
                  //                                     ),
                  //                                     borderRadius: const BorderRadius.all(
                  //                                         Radius.circular(5))
                  //                                 ),
                  //                                 child: Center(
                  //                                   child: Padding(
                  //                                     padding:  const EdgeInsets.only(left: 15.0,right: 15.0,top: 5.0,bottom: 5.0),
                  //                                     child: Text("Mains",style:  TextStyle(
                  //                                       fontWeight: FontWeight.w700,
                  //                                       fontSize: 12,
                  //                                       color: MyAppTheme.whiteColor,
                  //                                       ),),
                  //                                   ),
                  //                                 ),
                  //                               );
                  //                             }),
                  //                       )
                  //                     ],
                  //                   ),
                  //                   SvgPicture.asset(
                  //                     'assets/images/delete_league.svg',
                  //                     allowDrawingOutsideViewBox: true,
                  //                     height: 20,
                  //                     width: 20,
                  //                   ),
                  //                 ],
                  //               ),
                  //             );
                  //           }),
                  //     ),
                  //   ],
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 10.0,bottom: 5.0),
                  //   child: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         tournamentFee,
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.w400,
                  //           fontSize: 16,
                  //           color: MyAppTheme.whiteColor,
                  //
                  //         ),
                  //       ),
                  //       Container(
                  //         height: 35,
                  //         width: 70,
                  //         child: Text(AddMore),
                  //
                  //
                  //       )
                  //     ],
                  //   ),
                  // ),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Expanded(child: Container(
                  //       margin: const EdgeInsets.only(right: 5.0,top: 5.0),
                  //       child: DropdownButtonHideUnderline(
                  //         child: DropdownButton2<String>(
                  //           isExpanded: true,
                  //           hint:  Text(
                  //             '--Select--',
                  //             style: TextStyle(
                  //               fontSize: 14,
                  //               fontWeight: FontWeight.w400,
                  //               color: MyAppTheme.whiteColor,
                  //
                  //             ),
                  //             overflow: TextOverflow.ellipsis,
                  //           ),
                  //           items: items.map((String item) => DropdownMenuItem<String>(
                  //             value: item,
                  //             child: Text(
                  //               item,
                  //               style: const TextStyle(
                  //                 fontSize: 14,
                  //                 fontWeight: FontWeight.w400,
                  //                 color: MyAppTheme.whiteColor,
                  //
                  //               ),
                  //               overflow: TextOverflow.ellipsis,
                  //             ),
                  //           ))
                  //               .toList(),
                  //           value: selectedValue,
                  //           onChanged: (String? value) {
                  //             setState(() {
                  //               selectedValue = value;
                  //             });
                  //           },
                  //           buttonStyleData: ButtonStyleData(
                  //             height: 50,
                  //             padding: const EdgeInsets.only(left: 5, right: 5),
                  //             decoration: BoxDecoration(
                  //                 color: MyAppTheme.cardBorderBgColor,
                  //                 border: Border.all(color: MyAppTheme.cardBgSecColor,),
                  //                 borderRadius: const BorderRadius.all(Radius.circular(5))
                  //             ),
                  //           ),
                  //           iconStyleData: const IconStyleData(
                  //             icon: Icon(
                  //               Icons.arrow_drop_down_sharp,
                  //             ),
                  //             iconSize: 25,
                  //           ),
                  //           dropdownStyleData: DropdownStyleData(
                  //             maxHeight: 200,
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(5),
                  //               color: MyAppTheme.cardBgSecColor,
                  //             ),
                  //             offset: const Offset(0, -5),
                  //             scrollbarTheme: ScrollbarThemeData(
                  //               radius: const Radius.circular(5),
                  //               thickness: MaterialStateProperty.all<double>(6),
                  //               thumbVisibility: MaterialStateProperty.all<bool>(true),
                  //             ),
                  //           ),
                  //           menuItemStyleData: const MenuItemStyleData(
                  //             height: 40,
                  //             padding: EdgeInsets.only(left: 14, right: 14),
                  //           ),
                  //         ),
                  //       ),
                  //     )),
                  //     Expanded(child: Container(
                  //       margin: EdgeInsets.only(left: 5.0,top: 5.0),
                  //       decoration: BoxDecoration(
                  //           color: MyAppTheme.cardBorderBgColor,
                  //           border: Border.all(
                  //             color: MyAppTheme.cardBgSecColor,
                  //           ),
                  //           borderRadius:
                  //           const BorderRadius.all(Radius.circular(5))),
                  //       child: TextFormField(
                  //         textCapitalization: TextCapitalization.words,
                  //         autovalidateMode: AutovalidateMode.onUserInteraction,
                  //         keyboardType: TextInputType.text,
                  //         textAlign: TextAlign.left,
                  //         controller: userName,
                  //         onChanged: (value){
                  //
                  //         },
                  //         style: const TextStyle(
                  //           fontSize: 14,
                  //           fontWeight: FontWeight.w400,
                  //           color: MyAppTheme.whiteColor,
                  //
                  //         ),
                  //         decoration: const InputDecoration(
                  //           border: InputBorder.none,
                  //           contentPadding: EdgeInsets.only(left: 10.0),
                  //         ),
                  //       ),
                  //     )),
                  //
                  //   ],
                  // ),
                  // SizedBox(
                  //   width: width,
                  //   child: ListView.builder(
                  //       physics: const AlwaysScrollableScrollPhysics(),
                  //       primary: false,
                  //       shrinkWrap: true,
                  //       itemCount: 2,
                  //       itemBuilder: (BuildContext context, int index) {
                  //         return Padding(
                  //           padding: const EdgeInsets.only(top: 10.0),
                  //           child: Row(
                  //             crossAxisAlignment: CrossAxisAlignment.center,
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Row(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 mainAxisAlignment: MainAxisAlignment.start,
                  //                 children: [
                  //                   Container(
                  //                     height: 40,
                  //                     decoration: BoxDecoration(
                  //                         color: MyAppTheme.progressInactiveColor,
                  //                         border: Border.all(
                  //                           color:  MyAppTheme.MainColor,
                  //                         ),
                  //                         borderRadius: const BorderRadius.all(
                  //                             Radius.circular(5))
                  //                     ),
                  //                     child: Center(
                  //                       child: Padding(
                  //                         padding:  const EdgeInsets.only(left: 15.0,right: 15.0,top: 5.0,bottom: 5.0),
                  //                         child: Text("Single Men",style:  TextStyle(
                  //                           fontWeight: FontWeight.w700,
                  //                           fontSize: 12,
                  //                           color: MyAppTheme.MainColor,
                  //                           ),),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   Container(
                  //                     height: 40,
                  //                     width: width * 0.60,
                  //                     alignment: Alignment.center,
                  //                     child:  ListView.builder(
                  //                         scrollDirection: Axis.horizontal,
                  //                         itemCount: 5,
                  //                         itemBuilder: (BuildContext context, int index) {
                  //                           return Container(
                  //                             margin: const EdgeInsets.only(left: 5.0),
                  //                             height: 40,
                  //                             decoration: BoxDecoration(
                  //                                 color: MyAppTheme.CardBgColor,
                  //                                 border: Border.all(
                  //                                   color: MyAppTheme.cardBgColor,
                  //                                 ),
                  //                                 borderRadius: const BorderRadius.all(
                  //                                     Radius.circular(5))
                  //                             ),
                  //                             child: Center(
                  //                               child: Padding(
                  //                                 padding:  const EdgeInsets.only(left: 15.0,right: 15.0,top: 5.0,bottom: 5.0),
                  //                                 child: Text("Mains",style:  TextStyle(
                  //                                   fontWeight: FontWeight.w700,
                  //                                   fontSize: 12,
                  //                                   color: MyAppTheme.whiteColor,
                  //                                   ),),
                  //                               ),
                  //                             ),
                  //                           );
                  //                         }),
                  //                   )
                  //                 ],
                  //               ),
                  //               SvgPicture.asset(
                  //                 'assets/images/delete_league.svg',
                  //                 allowDrawingOutsideViewBox: true,
                  //                 height: 20,
                  //                 width: 20,
                  //               ),
                  //             ],
                  //           ),
                  //         );
                  //       }),
                  // ),
                  // const Padding(
                  //   padding: EdgeInsets.only(top: 5.0),
                  //   child: Text(
                  //     tournamentSlots,
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.w400,
                  //       fontSize: 16,
                  //       color: MyAppTheme.whiteColor,
                  //
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   margin: const EdgeInsets.only(right: 5.0,top: 5.0),
                  //   child: DropdownButtonHideUnderline(
                  //     child: DropdownButton2<String>(
                  //       isExpanded: true,
                  //       hint:  Text(
                  //         '--Select--',
                  //         style: TextStyle(
                  //           fontSize: 14,
                  //           fontWeight: FontWeight.w400,
                  //           color: MyAppTheme.whiteColor,
                  //
                  //         ),
                  //         overflow: TextOverflow.ellipsis,
                  //       ),
                  //       items: items.map((String item) => DropdownMenuItem<String>(
                  //         value: item,
                  //         child: Text(
                  //           item,
                  //           style: const TextStyle(
                  //             fontSize: 14,
                  //             fontWeight: FontWeight.w400,
                  //             color: MyAppTheme.whiteColor,
                  //
                  //           ),
                  //           overflow: TextOverflow.ellipsis,
                  //         ),
                  //       ))
                  //           .toList(),
                  //       value: selectedValue,
                  //       onChanged: (String? value) {
                  //         setState(() {
                  //           selectedValue = value;
                  //         });
                  //       },
                  //       buttonStyleData: ButtonStyleData(
                  //         height: 50,
                  //         padding: const EdgeInsets.only(left: 5, right: 5),
                  //         decoration: BoxDecoration(
                  //             color: MyAppTheme.cardBorderBgColor,
                  //             border: Border.all(color: MyAppTheme.cardBgSecColor,),
                  //             borderRadius: const BorderRadius.all(Radius.circular(5))
                  //         ),
                  //       ),
                  //       iconStyleData: const IconStyleData(
                  //         icon: Icon(
                  //           Icons.arrow_drop_down_sharp,
                  //         ),
                  //         iconSize: 25,
                  //       ),
                  //       dropdownStyleData: DropdownStyleData(
                  //         maxHeight: 200,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(5),
                  //           color: MyAppTheme.cardBgSecColor,
                  //         ),
                  //         offset: const Offset(0, -5),
                  //         scrollbarTheme: ScrollbarThemeData(
                  //           radius: const Radius.circular(5),
                  //           thickness: MaterialStateProperty.all<double>(6),
                  //           thumbVisibility: MaterialStateProperty.all<bool>(true),
                  //         ),
                  //       ),
                  //       menuItemStyleData: const MenuItemStyleData(
                  //         height: 40,
                  //         padding: EdgeInsets.only(left: 14, right: 14),
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
