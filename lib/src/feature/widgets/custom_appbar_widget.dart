import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    required this.appBarText,
    super.key,
    this.actions,
    this.centerTitle,
    this.bcgColor,
    this.iconThemeData,
    this.textColor,
    this.fontSize,
    this.fontWeight,
  });

  final List<Widget>? actions;
  final String appBarText;
  final bool? centerTitle;
  final Color? bcgColor;
  final IconThemeData? iconThemeData;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) => AppBar(
        centerTitle: centerTitle,
        backgroundColor: bcgColor,
        iconTheme: iconThemeData,
        actions: actions,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: DecoratedBox(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.deepOrange,
            ),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: SvgPicture.asset(
                "assets/icons/home_icon.svg",
                colorFilter: const ColorFilter.mode(
                  Colors.orangeAccent,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          appBarText,
          style: TextStyle(color: textColor, fontSize: fontSize, fontWeight: fontWeight),
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
