import "package:flutter/material.dart";
import "package:food_delivery/src/core/style/app_colors.dart";

@immutable
class AppTextStyle extends TextTheme {
  const AppTextStyle();

  @override
  TextStyle? get bodyLarge => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size18,
        fontFamily: "Rubik",
      );
  @override
  TextStyle? get bodyLargeBannerButton => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size18,
        fontFamily: "Rubik",
      );

  @override
  TextStyle? get ButtonNavigatorBarIconLabel => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size10,
        fontFamily: "Rubik",
      );

  @override
  TextStyle? get bodyLargeBold => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size20,
        fontFamily: "Rubik",
      );

  @override
  TextStyle? get bodyMediumBold => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size14,
        fontFamily: "Rubik",
        color: AppColors.l111719
      );
  @override
  TextStyle? get bodyMedium => const TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: FontSize.size14,
        fontFamily: "Rubik",
      );

  @override
  TextStyle? get ProfileEmail => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size14,
        fontFamily: "Rubik",
      );

  @override
  TextStyle? get bodySmall => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size6_4,
        fontFamily: "Rubik",
      );

  @override
  TextStyle? get displayLarge => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size62,
        fontFamily: "Rubik",
      );

  @override
  TextStyle? get displayMedium => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size42,
        fontFamily: "Rubik",
      );

  @override
  TextStyle? get displaySmall => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size32,
        fontFamily: "Rubik",
      );

  @override
  TextStyle? get headlineLarge => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size32,
        fontFamily: "Rubik",
      );

  @override
  TextStyle? get headlineMedium => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size26,
        fontFamily: "Rubik",
      );

  @override
  TextStyle? get headlineSmall => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size24,
        fontFamily: "Rubik",
      );

  @override
  TextStyle? get CategorysNameLarge => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FontSize.size16,
        fontFamily: "Rubik",
      );

  @override
  TextStyle? get labelMedium => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size14,
        fontFamily: "Rubik",
      );

  @override
  TextStyle? get labelSmall => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size12,
        fontFamily: "Rubik",
      );

  @override
  TextStyle? get titleLarge => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: FontSize.size28,
        fontFamily: "Rubik",
      );

  @override
  TextStyle? get titleMedium => const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: FontSize.size18,
        fontFamily: "Rubik",
      );

  @override
  TextStyle? get titleSmall => const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: FontSize.size18,
        fontFamily: "Rubik",
      );
}

@immutable
class FontSize {
  const FontSize._();

  static const double size6_4 = 6.4;
  static const double size7_8 = 7.8;
  static const double size9_5 = 9.5;
  static const double size10 = 10;
  static const double size10_5 = 10.5;
  static const double size12 = 12;
  static const double size12_5 = 12.5;
  static const double size13 = 13;
  static const double size13_5 = 13.5;
  static const double size14 = 14;
  static const double size14_2 = 14.2;
  static const double size16 = 16;
  static const double size17_3 = 17.3;
  static const double size18 = 18;
  static const double size19_2 = 19.2;
  static const double size20 = 20;
  static const double size21 = 21;
  static const double size22 = 22;
  static const double size23_3 = 23.3;
  static const double size24 = 24;
  static const double size26 = 26;
  static const double size28 = 28;
  static const double size32 = 32;
  static const double size42 = 42;
  static const double size48 = 48;
  static const double size62 = 62.2;
}
