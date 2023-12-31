import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:new_pro/screens/tournament/academy/provider.dart';
import 'package:new_pro/utils/constants.dart';
import 'package:new_pro/utils/my_app_theme.dart';
import 'package:new_pro/utils/my_colors.dart';

import 'package:new_pro/utils/my_styles.dart';
import 'package:new_pro/utils/ui_helper/textfields.dart';
import 'package:provider/provider.dart';

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

  var upiIdController= TextEditingController();
  var upiPhoneController= TextEditingController();

  final formGlobalKey = GlobalKey < FormState > ();

  List<dynamic> managingList = [];

  late bool isValueSelected;
  String prevSelectedValue = '';

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) => Provider.of<ProviderTournament>(context,listen: false).fillDataInitially());
  }

  @override
  Widget build(BuildContext context) {
     height=MediaQuery.of(context).size.height;
     width =MediaQuery.of(context).size.width;
    return Consumer<ProviderTournament>(
      builder: (context, provider, child) {
        managingList = provider.managingPaymentInfoList;
        print('managingList----------------->$managingList');
        isValueSelected =provider.isValueSelected;
        return Scaffold(
        backgroundColor: MyAppTheme.bgColor,
        appBar: myAppBar(),
        body: Container(
          margin: const EdgeInsets.all(12.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Title
                  ScreenNameAndOverLapBar(title: paymentInfo,percent: 100),

                  //listView Builder showing dropdown btn
                  Expanded(
                    child: SingleChildScrollView(
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Payment Method Text
                        Text(
                          payMethod,
                          style: MyStyles.white16Regular,
                        ),

                        const SizedBox(
                          height: 5,
                        ),

                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:managingList.length,
                            itemBuilder: (context, index) =>Column(
                              children: [

                                  DropdownButtonHideUnderline(
                                    child: DropdownButton2<String>(
                                      isExpanded: true,
                                      hint: Row(
                                        children: [
                                          Expanded(
                                            child: (managingList.length == provider.paymentInfoList.length)?
                                            (provider.paymentInfoList[index]['selectedType'].isNotEmpty ) ?
                                            Text(
                                                provider.paymentInfoList[index]['selectedType'],
                                              style: MyStyles.grey14Light,
                                              overflow: TextOverflow.ellipsis,
                                            ) : Text(
                                              dropDownDefaultText,
                                              style: MyStyles.grey14Light,
                                              overflow: TextOverflow.ellipsis,
                                            ):Text(
                                          dropDownDefaultText,
                                          style: MyStyles.grey14Light,
                                          overflow: TextOverflow.ellipsis,
                                          ),)
                                        ],
                                      ),
                                      items: items.map((String item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: MyStyles.white14Regular,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )).toList(),
                                      value: managingList[index]['selectedValue'],
                                      onChanged: (String? value) {
                                        provider.call(index);
                                        provider.selectingType(value!, index);
                                      },

                                      // (managingList[index]['selectedValue'] == null) ? (String? value) {
                                      //   provider.selectingType(value!, index);
                                      // } : null,
                                      buttonStyleData: ButtonStyleData(
                                        height: 50,
                                        width: double.infinity,
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
                                    height: 5,
                                  ),

                                  ///UploadQRBtn and Upi details card..
                                  Visibility(
                                      visible: managingList[index]['isQRBtnVisible'],
                                      child: Card(
                                        color: MyAppTheme.cardBorderBgColor,

                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          side: BorderSide(
                                            color: MyAppTheme.cardBgSecColor
                                          )
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Form(
                                            key: formGlobalKey,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                subTitleText(text: 'UPI ID'),
                                                upiIdTextField(controller: upiIdController),

                                                subTitleText(text: 'Enter UPI number'),
                                                phoneNumberTextfield(controller: upiPhoneController),

                                                Center(
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        // Adding Image..
                                                          if(formGlobalKey.currentState!.validate()) {
                                                            formGlobalKey.currentState!.save();
                                                            provider.addPaymentInfo(index: index,
                                                            isValueSelect: isValueSelected,
                                                            upiId: upiIdController.text,
                                                            upiNumber: upiPhoneController.text);
                                                            upiIdController.clear();
                                                            upiPhoneController.clear();
                                                          }
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
                                                      )),
                                                ),
                                              ].map((e) => Padding(padding: const EdgeInsets.symmetric(vertical: 4),child: e,)).toList(),
                                            ),
                                          ),
                                        ),
                                      )),


                                  ///When details added..
                                  (managingList[index]['isQRAdded'] && managingList[index]['isQRBtnVisible'] == false)
                                      ? Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                                    child: DottedBorder(
                                      color: MyAppTheme.whiteColor,
                                      borderType: BorderType.Rect,
                                      dashPattern: const[10],
                                      child: Container(
                                        width: width,
                                        padding: const EdgeInsets.symmetric(vertical: 18),
                                        alignment: Alignment.center,
                                        child: Column(
                                          children: [
                                            subTitleText(text: '$upiId : ${provider.paymentInfoList[index]['upi_id']}'),
                                            subTitleText(text: '$phoneNum  : ${provider.paymentInfoList[index]['upi_number']}'),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Image(image: AssetImage(
                                                  MyImages.qrImg
                                                  //provider.paymentInfoList[index]['img']
                                                ),height: 150,width: 150,),

                                                ///Remove Icon
                                                InkWell(
                                                    onTap: (){
                                                      print('managingList----------------->$managingList');

                                                      provider.deletePaymentInfo(index: index);
                                                    },
                                                    child: Image(image: AssetImage(MyImages.removeIcon),height: 30,width: 30,))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ):
                                  const SizedBox(),
                                ],

                            )
                        ),

                        /// Add More btn
                        if(managingList.length < 4)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: DottedBorder(

                                radius: const Radius.circular(12),
                                borderType: BorderType.RRect,
                                dashPattern: const [16],
                                color: MyAppTheme.MainColor,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      fixedSize: Size(width, 50.0),
                                      backgroundColor: MyAppTheme.documentBgMainColor),
                                  onPressed: () {
                                    print('managingList ------------------> $managingList');
                                    // print('managingListFromProvider ------------------> ${provider.managingPaymentInfoList}');
                                    // print('isSelectedValue ------------------> $isValueSelected');
                                    if(isValueSelected){
                                      Map<String,dynamic> addingOption ={
                                        "selectedValue" : null,
                                        "isQRBtnVisible" : false,
                                        "isQRAdded" : false,
                                        "status" : 1,
                                      };
                                      provider.addToManagingList(addingOption: addingOption);
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
                          ),

                         SizedBox(height: height*0.08,)
                      ],
                    )),
                  ),



                ],
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
                          print('managingList ==================> ${managingList.length}');
                           print('paymentInfoList ==================> ${provider.paymentInfoList.length}');
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
      );
      },
    );
  }

}



