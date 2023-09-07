import 'package:flutter/material.dart';
import 'package:new_pro/screens/admin/payment_fee/payment_fee_provider.dart';
import 'package:new_pro/utils/constants.dart';
import 'package:new_pro/utils/ui_helper/ui_helper.dart';
import 'package:provider/provider.dart';

import '../../../utils/my_app_theme.dart';


class PaymentFeeList extends StatelessWidget {
  PaymentFeeList({Key? key}) : super(key: key);
  late double height;
  late double width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Consumer<PaymentFeeProvider>(
      builder: (context, provider, child) =>  Scaffold(
        appBar: mAppBar(title: allStarChamp),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              height: height * .05,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: provider.cat.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    provider.onTap(index: index);
                  },
                  child: (provider.selectedIdxForPaymentFee == index)
                      ? selectedContainer(text: provider.cat[index],height: 35)
                      :  unSelectedContainer(text: provider.cat[index],height: 35)
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [titleText(text: '$totalParticipants - ${paymentData.length}')],
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
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.center,
                        color: MyAppTheme.pointsCardBgSecColor,
                        child: white10Text(text: sno)),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
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
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Punit Lohani', 'category': open, 'paymentStatus': true},
  {'name': 'Raman', 'category': menSingles, 'paymentStatus':false},
  {'name': 'Ramanujan', 'category': menSingles, 'paymentStatus':true},
  
];
