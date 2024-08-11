import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/core/style/text_style.dart";
import "package:percent_indicator/circular_percent_indicator.dart";

import "../../../../core/style/app_colors.dart";

class DeliveryBottomWidget extends ConsumerWidget {
  DeliveryBottomWidget({super.key});
  AppTextStyle appTextStyle = const AppTextStyle();

  @override
  Widget build(BuildContext context, WidgetRef ref) => Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: SizedBox(
          height: 380.h,
          width: double.infinity,
          child: DecoratedBox(
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                CircularPercentIndicator(
                  radius: 100,
                  lineWidth: 10.0.w,
                  percent: 0.5,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "17",
                        style: appTextStyle.bodySmall?.copyWith(
                          fontSize: FontSize.size32,
                        ),
                      ),
                      Text(
                        "min",
                        style: appTextStyle.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Text(
                        "delivery time",
                        style: appTextStyle.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                  progressColor: AppColors.lF83B01,
                  backgroundColor: AppColors.lFFE7CC,
                ),
                SizedBox(height: 10.h),
                Text(
                  "La Pasta House",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Your order is being processed",
                  style: appTextStyle.bodyLarge?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 30.h),
                MaterialButton(
                  onPressed: () {},
                  height: 45.h,
                  minWidth: 350.w,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  color: AppColors.lF83B01,
                  shape: const StadiumBorder(),
                  child: Text(
                    "Hide Delivery Status",
                    style: appTextStyle.bodyLarge?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
