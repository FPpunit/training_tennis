import 'package:flutter/material.dart';

import '../utils/my_images.dart';

class QRImg extends StatelessWidget {
  const QRImg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: AssetImage(MyImages.qrImg),height: 150,width: 150,),
        InkWell(child: Image(image: AssetImage(MyImages.removeIcon),height: 30,width: 30,))
      ],
    );
  }
}
