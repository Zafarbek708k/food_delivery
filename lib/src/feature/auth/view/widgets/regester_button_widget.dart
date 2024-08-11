import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class RegesterButtonWidget extends StatelessWidget {
  const RegesterButtonWidget({required this.onPressed, super.key});
    final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) => Padding(
      padding:  REdgeInsets.symmetric(horizontal: 25),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(300.r),
        ),
        color: Colors.red,
        minWidth: double.infinity,
        height: 60.h,
        child:  Text(
          "Sing Up",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
          ),
        ),
      ),
    );
}
