import 'package:flutter/material.dart';
import 'package:new_pro/utils/my_colors.dart';
import '../../utils/my_images.dart';
import '../../utils/my_string.dart';
import '../../utils/my_styles.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              width: 350,
              child: Stack(children: [
                Image(
                  image: AssetImage(
                    MyImages.loginBgImg,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                    child: Image(
                  image: AssetImage(
                    MyImages.logo,
                  ),
                  width: 150,
                  height: 70,
                )),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(MyStrings.logIn,style: MyStyles.white30SemiBold,),
                  Text(MyStrings.enterNumText,style: MyStyles.grey16Regular,),
                  TextField(

                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone,color: MyColors.grey,),
                      hintText: 'Enter Your Number',
                      fillColor: MyColors.bgClrSecondary,
                      hintStyle: MyStyles.grey14Light,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: MyColors.white
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),

                    ),

                  ),



                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
