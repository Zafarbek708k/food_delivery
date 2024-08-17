import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";

import "../../../../core/style/app_colors.dart";

class LogOutButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LogOutButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MaterialButton(
            height: 50.h,
            minWidth: 120.w,
            shape: const StadiumBorder(
              side: BorderSide(
                color: AppColors.lF96234,
              ),
            ),
            onPressed: onPressed,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  "assets/icons/log_out_icon.svg",
                  height: 30.h,
                  width: 60.w,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                Text(
                  context.localized.logOut,
                  style: const TextStyle(color: AppColors.lF83B01),
                ),
              ],
            ),
          ),
        ],
      );
}
