import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class LoginButtonWidget extends StatelessWidget {
  // ignore: non_constant_identifier_names
  const LoginButtonWidget({required this.onPressed, required this.NameText, super.key});
  final VoidCallback onPressed;
  // ignore: non_constant_identifier_names
  final String NameText;

  @override
  Widget build(BuildContext context) => Padding(
        padding: REdgeInsets.symmetric(horizontal: 25.w),
        child: MaterialButton(
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(300.r),
          ),
          color: Colors.red,
          minWidth: double.infinity,
          height: 60.h,
          child: Text(
            NameText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
            ),
          ),
        ),
      );
}
