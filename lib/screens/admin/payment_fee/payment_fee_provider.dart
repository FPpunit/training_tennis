import 'package:flutter/cupertino.dart';

import '../../../utils/constants.dart';

class PaymentFeeProvider extends ChangeNotifier{
  int selectedIdxForPaymentFee = 0;
  String selectedCat = all;

  final List<String> cat = [all, open, menSingles, womenSingles, mixedDoubles];

  onTap ({required int index}){
    selectedIdxForPaymentFee = index;
    selectedCat = cat[index].toLowerCase();
    notifyListeners();
  }
}