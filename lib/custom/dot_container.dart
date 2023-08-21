import 'package:flutter/cupertino.dart';
import 'package:new_pro/utils/my_colors.dart';

class DotSelectedContainer extends StatelessWidget {
  const DotSelectedContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      height: 4,
      width: 40,
      decoration: BoxDecoration(
        color: MyColors.primary,
        borderRadius: BorderRadius.circular(2)
      ),
    );
  }
}
class DotUnSelectedContainer extends StatelessWidget {
  const DotUnSelectedContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      height: 4,
      width: 20,
      decoration: BoxDecoration(
        color: MyColors.grey,
        borderRadius: BorderRadius.circular(2)
      ),
    );
  }
}
