import 'package:flutter/material.dart';
import 'package:new_pro/utils/constants.dart';
import 'package:new_pro/utils/ui_helper/ui_helper.dart';

import '../../utils/my_app_theme.dart';
import '../staff/staff_members_list.dart';

class PaymentFeeList extends StatefulWidget {
  const PaymentFeeList({Key? key}) : super(key: key);

  @override
  State<PaymentFeeList> createState() => _PaymentFeeListState();
}

class _PaymentFeeListState extends State<PaymentFeeList> {
  late double height;
  late double width;
  List<String> cat = [all, open, menSingles, womenSingles, mixedDoubles];
  int selectedIdx = 0;
  String selectedCat = all;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: mAppBar(title: allStarChamp),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: height * .05,
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
                  padding: const EdgeInsets.symmetric(horizontal: 8),
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

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [titleText(text: totalParticipants)],
            ),
          ),

          Container(
            color: MyAppTheme.cardBgSecColor,
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(

                      padding:
                      const EdgeInsets.symmetric(vertical: 15),
                      alignment: Alignment.center,
                      color: MyAppTheme.pointsCardBgSecColor,
                      child: white10Text(text: sno)),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                    alignment: Alignment.centerLeft,
                    child: white10Text(
                        text: participantName, align: TextAlign.left),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                    alignment: Alignment.centerLeft,
                    child: white10Text(text: category, align: TextAlign.left),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                    // margin: const EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    child:
                        white10Text(text: paymentStatus, align: TextAlign.left),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: paymentData.length,
              itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    height: 1,
                    color: MyAppTheme.cardBgSecColor,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    //padding: null,
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                                height: double.infinity,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                //margin: const EdgeInsets.only(left: 10),
                                alignment: Alignment.center,
                                color: MyAppTheme.pointsCardBgSecColor,
                                child: white12Text(text: '${index + 1}')),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 8),
                                alignment: Alignment.centerLeft,
                                height: double.infinity,
                                //margin: const EdgeInsets.only(left: 10),
                                child: white12Text(
                                    text: paymentData[index]['name'])),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                                height: double.infinity,
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 8),
                                // margin: const EdgeInsets.only(left: 10),
                                color: MyAppTheme.pointsCardBgSecColor,
                                child: white12Text(
                                    text: paymentData[index]['category'])),
                          ),
                          Expanded(
                            flex: 3,
                            child : Container(
                              height: double.infinity,
                              padding:
                              const EdgeInsets.symmetric(vertical: 15,horizontal: 8),
                              //margin: const EdgeInsets.only(left: 10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                (paymentData[index]['paymentStatus'] == true) ? 'Paid': 'Unpaid',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: (paymentData[index]['paymentStatus'] == true) ? MyAppTheme.MainColor : MyAppTheme.challengeBtnBgColor,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> paymentData = [
  {'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},{'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
];
