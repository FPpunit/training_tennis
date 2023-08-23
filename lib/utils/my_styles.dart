import 'package:flutter/material.dart';

import 'my_app_theme.dart';
import 'my_colors.dart';


class MyFontWeight {
  static FontWeight light = FontWeight.w400;
  static FontWeight regular = FontWeight.w500;
  static FontWeight medium = FontWeight.w600;
  static FontWeight semiBold = FontWeight.bold;
  static FontWeight bold = FontWeight.w800;
  static FontWeight extraBold = FontWeight.w900;
}

class MyStyles {
  static TextStyle black12Light = TextStyle(
    color: MyColors.black,
    fontSize: 12,
    fontWeight: MyFontWeight.regular,
  );
  static TextStyle grey12Light = TextStyle(
    color: MyAppTheme.hintTxtColor,
    fontSize: 12,
    fontWeight: MyFontWeight.light,
  );
  static TextStyle grey14Light = TextStyle(
    color: MyAppTheme.hintTxtColor,
    fontSize: 14,
    fontWeight: MyFontWeight.light,
  );
  static TextStyle grey14Regular = TextStyle(
    color:MyAppTheme.hintTxtColor,
    fontSize: 14,
    fontWeight: MyFontWeight.regular,
  );
  static TextStyle grey12Regular = TextStyle(
    color: MyAppTheme.hintTxtColor,
    fontSize: 12,
    fontWeight: MyFontWeight.regular,
  );
  static TextStyle grey16Regular = TextStyle(
    color: MyAppTheme.hintTxtColor,
    fontSize: 16,
    fontWeight: MyFontWeight.regular,
  );
  static TextStyle grey20Regular = TextStyle(
    color: MyColors.grey,
    fontSize: 20,
    fontWeight: MyFontWeight.regular,
  );
  static TextStyle white14Regular = TextStyle(
    color: MyColors.white,
    fontSize: 14,
    fontWeight: MyFontWeight.regular,
  );
  static TextStyle white14Light = TextStyle(
    color: MyColors.white,
    fontSize: 14,
    fontWeight: MyFontWeight.light,
  );
  static TextStyle white16Regular = TextStyle(
    color: MyColors.white,
    fontSize: 16,
    fontWeight: MyFontWeight.regular,
  );
  static TextStyle white18Regular = TextStyle(
    color: MyColors.white,
    fontSize: 18,
    fontWeight: MyFontWeight.regular,
  );
  static TextStyle black20Regular = TextStyle(
    color: MyColors.black,
    fontSize: 20,
    fontWeight: MyFontWeight.regular,
  );
  static TextStyle white20Normal = TextStyle(
    color: MyColors.white,
    fontSize: 20,
    fontWeight: MyFontWeight.medium,
  );
  static TextStyle white10Light = TextStyle(
    color: MyColors.white,
    fontSize: 10,
    fontWeight: MyFontWeight.light,
  );
  static TextStyle white12Light = TextStyle(
    color: MyColors.white,
    fontSize: 12,
    fontWeight: MyFontWeight.medium,
  );
  static TextStyle white30SemiBold = TextStyle(
    color: MyColors.white,
    fontSize: 30,
    fontWeight: MyFontWeight.semiBold,
  );

  static TextStyle underLineSubHeading = const TextStyle(
      fontSize: 18,
      color: MyAppTheme.MainColor,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.underline,
      decorationColor: MyAppTheme.MainColor
  );

  static TextStyle categoryStyle = const TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 14,
  color: MyAppTheme.MainColor
  );

}
