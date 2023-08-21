import 'package:flutter/material.dart';
import 'package:new_pro/utils/my_styles.dart';

import '../utils/constants.dart';
import '../utils/my_colors.dart';



class UploadQRBtn extends StatelessWidget {
  const UploadQRBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {

    },
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: MyColors.primary,
            fixedSize: const Size(200, 50),
        ),
        child: Text(uploadQR,style: MyStyles.white16Regular,));
  }
}
