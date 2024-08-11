import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";

class NavBarIcon extends StatelessWidget {
  final String assetName;
  final bool isSelected;

  const NavBarIcon({required this.assetName, required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
        assetName,
        height: 30.h,
        width: 30.h,
        colorFilter: ColorFilter.mode(
          isSelected ? Colors.orange : Colors.black,
          BlendMode.srcIn,
        ),
      );
}
