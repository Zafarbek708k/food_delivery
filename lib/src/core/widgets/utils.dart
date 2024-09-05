import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

sealed class Utils {
  // FireSnackBar
  static void fireSnackBar(String msg, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.grey.shade400.withOpacity(0.975),
        content: Text(
          msg,
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
          textAlign: TextAlign.center,
        ),
        duration: const Duration(milliseconds: 2500),
        padding: REdgeInsets.symmetric(horizontal: 20.h, vertical: 15.w),
        margin: REdgeInsets.symmetric(vertical: 15.w, horizontal: 50.h),
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        shape: const StadiumBorder(),
      ),
    );
  }
}
