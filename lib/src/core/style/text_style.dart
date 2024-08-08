import "package:flutter/material.dart";
import "package:food_delivery/src/core/style/app_colors.dart";

@immutable
class AppTextStyle extends TextTheme {
   const AppTextStyle();

  @override
  TextStyle? get bodyLarge =>  TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size18,
        fontFamily: "Rubik",
        color: AppColors.l111719,
      );

  @override
  TextStyle? get bodyMedium =>  TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: FontSize.size14,
        fontFamily: "Rubik",
        color: AppColors.l111719,
      );

  @override
  TextStyle? get bodySmall =>  TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size6_4,
        fontFamily: "Rubik",
        color: AppColors.l111719,
      );

  @override
  TextStyle? get displayLarge =>  TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size62,
        fontFamily: "Rubik",
        color: AppColors.l111719,
      );

  @override
  TextStyle? get displayMedium =>  TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size42,
        fontFamily: "Rubik",
        color: AppColors.l111719,
      );

  @override
  TextStyle? get displaySmall =>  TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size32,
        fontFamily: "Rubik",
        color: AppColors.l111719,
      );

  @override
  TextStyle? get headlineLarge =>  TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size32,
        fontFamily: "Rubik",
        color: AppColors.l111719,
      );

  @override
  TextStyle? get headlineMedium =>  TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size26,
        fontFamily: "Rubik",
        color: AppColors.l111719,
      );

  @override
  TextStyle? get headlineSmall =>  TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size24,
        fontFamily: "Rubik",
        color: AppColors.l111719,
      );

  @override
  TextStyle? get labelMedium =>  TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size14,
        fontFamily: "Rubik",
        color: AppColors.l111719,
      );

  @override
  TextStyle? get labelSmall =>  TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size12,
        fontFamily: "Rubik",
                        color: AppColors.l111719,

      );

  @override
  TextStyle? get titleLarge =>  TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size28,
        fontFamily: "Rubik",
                        color: AppColors.l111719,

      );

  @override
  TextStyle? get titleMedium =>  TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: FontSize.size18,
        fontFamily: "Rubik",
                        color: AppColors.l111719,

      );

  @override
  TextStyle? get titleSmall =>  TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size18,
        fontFamily: "Rubik",
                        color: AppColors.l111719,

      );
}

@immutable
class FontSize {
 const  FontSize._();

  static  double size6_4 = 6.4;
  static  double size7_8 = 7.8;
  static  double size9_5 = 9.5;
  static  double size10 = 10;
  static  double size10_5 = 10.5;
  static  double size12 = 12;
  static  double size12_5 = 12.5;
  static  double size13 = 13;
  static  double size13_5 = 13.5;
  static  double size14 = 14;
  static  double size14_2 = 14.2;
  static  double size16 = 16;
  static  double size17_3 = 17.3;
  static  double size18 = 18;
  static  double size19_2 = 19.2;
  static  double size20 = 20;
  static  double size21 = 21;
  static  double size22 = 22;
  static  double size23_3 = 23.3;
  static  double size24 = 24;
  static  double size26 = 26;
  static  double size28 = 28;
  static  double size32 = 32;
  static  double size42 = 42;
  static  double size48 = 48;
  static  double size62 = 62.2;
}
