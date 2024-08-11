import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class NextbuttonWidgets extends StatelessWidget {
  const NextbuttonWidgets({required this.onPressed, super.key});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Padding(
      padding:  REdgeInsets.symmetric(horizontal: 25.w),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(300.r),
        ),
        color: Colors.red,
        minWidth: double.infinity,
        height: 60.h,
        child:  Text(
          "Next",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
          ),
        ),
      ),
    );
}
