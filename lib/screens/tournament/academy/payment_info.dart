import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:new_pro/utils/constants.dart';
import 'package:new_pro/utils/my_app_theme.dart';
import 'package:new_pro/utils/my_colors.dart';

import 'package:new_pro/utils/my_styles.dart';

import '../../../custom/screen_name_overlapbar.dart';
import '../../../utils/my_images.dart';
import '../../../utils/ui_helper/ui_helper.dart';





class PaymentInfo extends StatefulWidget {
  const PaymentInfo({Key? key}) : super(key: key);

  @override
  State<PaymentInfo> createState() => _PaymentInfoState();
}

class _PaymentInfoState extends State<PaymentInfo> {
  late double height;
  late double width;
  List<String> items = <String>['Paypal', 'Google Pay', 'Cash', 'Union Pay'];
  List<Map<String,dynamic>> paymentInfoList= [];

  List<Map<String,dynamic>> managingList = [
    {
      "selectedValue" : null,
      "isQRBtnVisible" : false,
      "isQRAdded" : false,
      "status" : 1,
    },
  ];
  bool isValueSelected = false;
  String prevSelectedValue = '';

  @override
  Widget build(BuildContext context) {
     height=MediaQuery.of(context).size.height;
     width =MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyAppTheme.bgColor,
      appBar: myAppBar(),
      body: Container(
        margin: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Title
                ScreenNameAndOverLapBar(title: paymentInfo,percent: 100),

                const SizedBox(
                  height: 10,
                ),

                //Payment Method Text
                Text(
                  payMethod,
                  style: MyStyles.white16Regular,
                ),

                const SizedBox(
                  height: 5,
                ),

                //listView Builder showing dropdown btn
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 510
                  ),
                  child: SingleChildScrollView(
                      child:Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:managingList.length,
                          itemBuilder: (context, index) =>Column(
                            children: [
                              if (managingList[index]['status'] == 1 ) ...[
                                DropdownButtonHideUnderline(
                                  child: DropdownButton2<String>(

                                    isExpanded: true,
                                    hint: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            dropDownDefaultText,
                                            style: MyStyles.grey14Light,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    items: items
                                        .map((String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                        .toList(),
                                    value: managingList[index]['selectedValue'],
                                    onChanged: (managingList[index]['selectedValue'] == null) ? (String? value) {
                                      setState(() {
                                        managingList[index]['selectedValue'] = value;
                                        managingList[index]['isQRBtnVisible'] = true;
                                      }) ;
                                    } : null,
                                    buttonStyleData: ButtonStyleData(
                                      height: 50,
                                      width: double.infinity,
                                      padding: const EdgeInsets.only(left: 14, right: 14),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        border: Border.all(
                                          color: MyAppTheme.cardBgColor,
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
                                      width: double.infinity,
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
                                        thumbVisibility: MaterialStateProperty.all<bool>(true),
                                      ),
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      height: 40,
                                      padding: EdgeInsets.only(left: 14, right: 14),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),

                                //UploadQRBtn()
                                Visibility
                                  (
                                    visible: managingList[index]['isQRBtnVisible'],
                                    child: Center(
                                        child: ElevatedButton(
                                            onPressed: () {
                                              // Adding Image..
                                              // print('pressed');
                                              setState(() {
                                                managingList[index]['isQRAdded'] = true;
                                                managingList[index]['isQRBtnVisible'] = false;
                                                isValueSelected =true;
                                                paymentInfoList.add({
                                                  'paymentType' : managingList[index]['selectedValue'],
                                                  'img' : managingList[index]['img']
                                                });
                                                print(paymentInfoList);
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              backgroundColor: MyAppTheme.MainColor,
                                              fixedSize: const Size(200, 50),
                                            ),
                                            child: Text(
                                              uploadQR,
                                              style: MyStyles.white16Regular,
                                            )))),

                                (managingList[index]['isQRAdded'])
                                    ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image(image: AssetImage(MyImages.qrImg),height: 150,width: 150,),
                                      InkWell(
                                          onTap: (){
                                            if(index == 0) {
                                              managingList[index]['status']= 1;
                                              managingList[index]['isQRAdded']=false;
                                              managingList[index]['selectedValue']=null;
                                              managingList[index]['isQRBtnVisible']=false;
                                            }else{
                                              managingList.removeAt(index);
                                            }
                                            paymentInfoList.removeAt(index);
                                            print(paymentInfoList);
                                            setState(() {

                                            });
                                          },
                                          child: Image(image: AssetImage(MyImages.removeIcon),height: 30,width: 30,))
                                    ],
                                  ),
                                )
                                    : const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ],
                          )
                      ),


                      // Add More btn
                      if(managingList.length < 4)
                        DottedBorder(
                            radius: const Radius.circular(12),
                            borderType: BorderType.RRect,
                            dashPattern: const [16],
                            color: MyAppTheme.MainColor,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  fixedSize:
                                  Size(MediaQuery.of(context).size.width, 50),
                                  backgroundColor: MyAppTheme.documentBgMainColor),
                              onPressed: () {
                                if(isValueSelected){
                                  Map<String,dynamic> addingOption ={
                                    "selectedValue" : null,
                                    "isQRBtnVisible" : false,
                                    "isQRAdded" : false,
                                    "status" : 1,
                                  };
                                  isValueSelected = false;
                                  managingList.add(addingOption);
                                  setState(() {});
                                }
                              },
                              child: const Text(
                                'Add More',
                                style: TextStyle(
                                    color: MyAppTheme.MainColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                            )),
                      const SizedBox(height: 5,)
                    ],
                  )),
                ),

              ],
            ),

            //footer btn
            Padding(
              padding: const EdgeInsets.all(7.0),
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
                          side: const BorderSide(
                            color: MyAppTheme.MainColor,
                            width: 1,
                          ),
                          fixedSize: Size(
                              MediaQuery.of(context).size!.width * .42, 50)),
                      child: const Text(
                        'Back',
                        style: TextStyle(fontSize: 16, color: MyAppTheme.MainColor),
                      )),
                  ElevatedButton(
                      onPressed: () {},
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
            ),
          ],
        ),
      ),
    );
  }

}
