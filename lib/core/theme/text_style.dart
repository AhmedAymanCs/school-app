import 'package:coureses_platform/core/constants/color_manager.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle mains30bold = TextStyle(
    color: ColorManager.maintextColor,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle mains30regular = TextStyle(
    color: ColorManager.maintextColor,
    fontSize: 30,
  );

  static const TextStyle mains20bold = TextStyle(
    color: ColorManager.textColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle mains20regular = TextStyle(
    color: ColorManager.textColor,
    fontSize: 20,
  );

  static const TextStyle s18w600 = TextStyle(
    color: ColorManager.black,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  static const TextStyle s18w400W = TextStyle(
    color: ColorManager.textColor,
    fontWeight: FontWeight.w400,
    fontSize: 18,
  );

  static const TextStyle s15bold = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: ColorManager.black,
  );
  static const TextStyle sbold = TextStyle(
    fontWeight: FontWeight.bold,
    color: ColorManager.primaryColor,
  );

  static const TextStyle coursetitle = TextStyle(
    fontWeight: FontWeight.bold,
    color: ColorManager.primaryColor,
  );

  static const TextStyle courseprice = TextStyle(
    fontWeight: FontWeight.bold,
    color: ColorManager.primaryColor,
  );

  static const TextStyle coursedescription = TextStyle(
    fontWeight: FontWeight.bold,
    color: ColorManager.primaryColor,
  );

  static const TextStyle coursedetails = TextStyle(
    fontWeight: FontWeight.bold,
    color: ColorManager.primaryColor,
  );
}
