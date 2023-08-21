import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:new_pro/custom/qr_image.dart';

import '../utils/constants.dart';
import '../utils/my_colors.dart';
import '../utils/my_styles.dart';

class DropdownAndQRImg extends StatefulWidget {
  const DropdownAndQRImg({Key? key}) : super(key: key);

  @override
  State<DropdownAndQRImg> createState() => _DropdownAndQRImgState();
}

class _DropdownAndQRImgState extends State<DropdownAndQRImg> {
  List<String> items = <String>['Paypal', 'Google Pay', 'Cash', 'Union Pay'];

  String? selectedValue;
  bool isQRBtnVisible =false ;
  bool isQRAdded = false;
  var dropDown = '--Select--';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Row(
              children: [
                Expanded(
                  child: Text(
                    '--Select--',
                    style: MyStyles.grey14Light,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: items.map((String item) => DropdownMenuItem<String>(
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
            value: selectedValue,
            onChanged: (String? value) {
              setState(() {
                selectedValue = value;
                isQRBtnVisible = true;
              });
            },
            buttonStyleData: ButtonStyleData(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: MyColors.bgClrSecondary,
                ),
                color: MyColors.darkBg,
              ),
              elevation: 2,
            ),
            iconStyleData: IconStyleData(
              icon: const Icon(
                Icons.keyboard_arrow_down,
              ),
              iconSize: 24,
              iconEnabledColor: MyColors.white,
              iconDisabledColor: MyColors.white,
            ),
            dropdownStyleData: DropdownStyleData(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              maxHeight: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: MyColors.bgClrSecondary,
              ),
              // offset: const Offset(-20, 0),
              // scrollbarTheme: ScrollbarThemeData(
              //   radius: const Radius.circular(40),
              //   thickness: MaterialStateProperty.all<double>(6),
              //   thumbVisibility: MaterialStateProperty.all<bool>(true),
              // ),
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
        Visibility(
            visible: isQRBtnVisible,
            child: Center(
                child: ElevatedButton(
                    onPressed: () {
                      // Adding Image..
                      // print('pressed');
                      setState(() {
                        isQRAdded = true;
                        isQRBtnVisible = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: MyColors.primary,
                      fixedSize: const Size(200, 50),
                    ),
                    child: Text(
                      uploadQR,
                      style: MyStyles.white16Regular,
                    )))),

        (isQRAdded)? const Padding(
          padding: EdgeInsets.all(8.0),
          child: QRImg(),
        ) : const SizedBox(height: 20,),
      ],
    );
  }
}
