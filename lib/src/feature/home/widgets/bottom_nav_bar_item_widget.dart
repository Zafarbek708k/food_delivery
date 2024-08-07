import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBarIcon extends StatelessWidget {
  final String assetName;
  final bool isSelected;

  const NavBarIcon({
    super.key,
    required this.assetName,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      colorFilter: ColorFilter.mode(
        isSelected ? Colors.orange : Colors.black,
        BlendMode.srcIn,
      ),
    );
  }
}