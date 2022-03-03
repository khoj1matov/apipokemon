import 'package:flutter/widgets.dart';
import 'package:pok_api/core/constants/color_const.dart';

class MyTextStyle {
  static get elevatedbutonTextStyle => const TextStyle(
        color: Color(0XFF838282),
      );

  static get pokimonNameTextStyle => TextStyle(
        color: ColorConst.kPrimaryWhite,
        fontWeight: FontWeight.bold,
      );

  static get pokimonIdTextStyle => TextStyle(
        color: ColorConst.color1,
        fontWeight: FontWeight.bold,
      );

  static get pokimonName2TextStyle => TextStyle(
        color: ColorConst.kPrimaryBlack,
        fontWeight: FontWeight.bold,
        fontSize: 20
      );

  static get pokimonId2TextStyle => TextStyle(
        color: ColorConst.color1,
        fontWeight: FontWeight.bold,
        fontSize: 20
      );
}
