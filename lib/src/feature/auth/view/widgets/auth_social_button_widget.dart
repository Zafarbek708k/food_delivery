import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";

class SocialButton extends StatelessWidget {
  final String iconPath;
  final String text;
  final VoidCallback onPressed;

  const SocialButton({
    required this.iconPath,
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
        side: const BorderSide(),
      ),
      height: 40.h,
      minWidth: double.infinity,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: screenWidth * 0.07,
          ),
          SizedBox(width: screenWidth * 0.03),
          Text(
            text,
            style: context.theme.textTheme.bodyLarge!.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
