import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:percent_indicator/circular_percent_indicator.dart";

import "../../../../core/style/app_colors.dart";
import "../../../../core/style/text_style.dart";
import "../../view_model/restaurant_vm.dart";

class DeliveryBottomWidget extends ConsumerWidget {
  DeliveryBottomWidget({required this.time, super.key});

  final AppTextStyle appTextStyle = const AppTextStyle();
  final controller = DraggableScrollableController();
  final String time;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deliveryTimeState = ref.watch(deliveryTimeProvider);

    return DraggableScrollableSheet(
      controller: controller,
      initialChildSize: 0.5,
      minChildSize: 0.1,
      maxChildSize: 0.5,
      builder: (BuildContext context, ScrollController scrollController) => SizedBox(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Column(
                children: [
                  SizedBox(
                    height: 8.h,
                    width: 59.w,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CircularPercentIndicator(
                    radius: 100,
                    lineWidth: 10.0.w,
                    percent: deliveryTimeState.percentCompleted,
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          time,
                          style: appTextStyle.bodySmall?.copyWith(
                            fontSize: FontSize.size32,
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
                    onPressed: () {
                      controller.animateTo(
                        0.1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
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
        ),
      ),
    );
  }
}
