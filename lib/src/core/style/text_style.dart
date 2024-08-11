import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
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

      ); TextStyle? get forProfile =>  TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size16,
        fontFamily: "Rubik",
                        color: AppColors.l111719,

      );


}

@immutable
class FontSize {
 const  FontSize._();

  static  double size6_4 = 6.4.sp;
  static  double size7_8 = 7.8.sp;
  static  double size9_5 = 9.5.sp;
  static  double size10 = 10.sp;
  static  double size10_5 = 10.5.sp;
  static  double size12 = 12.sp;
  static  double size12_5 = 12.5.sp;
  static  double size13 = 13.sp;
  static  double size13_5 = 13.5.sp;
  static  double size14 = 14.sp;
  static  double size14_2 = 14.2.sp;
  static  double size16 = 16.sp;
  static  double size17_3 = 17.3.sp;
  static  double size18 = 18.sp;
  static  double size19_2 = 19.2.sp;
  static  double size20 = 20.sp;
  static  double size21 = 21.sp;
  static  double size22 = 22.sp;
  static  double size23_3 = 23.3.sp;
  static  double size24 = 24.sp;
  static  double size26 = 26.sp;
  static  double size28 = 28.sp;
  static  double size32 = 32.sp;
  static  double size42 = 42.sp;
  static  double size48 = 48.sp;
  static  double size62 = 62.2.sp;
}
