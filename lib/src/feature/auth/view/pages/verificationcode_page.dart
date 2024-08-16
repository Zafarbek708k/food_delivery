// import "package:flutter/material.dart";
// import "package:flutter/services.dart";
// import "package:flutter_riverpod/flutter_riverpod.dart";
// import "package:flutter_screenutil/flutter_screenutil.dart";
// import "package:food_delivery/riverpod.dart";
// import "package:food_delivery/src/core/constants/context_extension.dart";
// import "package:food_delivery/src/core/routes/app_route_name.dart";
// import "package:food_delivery/src/core/style/app_colors.dart";
// import "package:food_delivery/src/feature/auth/view/widgets/nextbutton_widgets.dart";
// import "package:go_router/go_router.dart";
// import "package:pin_code_fields/pin_code_fields.dart";

// class VerificationcodePage extends ConsumerWidget {
//   const VerificationcodePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) => Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Center(
//           child: SafeArea(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 80.h,
//                 ),
//                 Padding(
//                   padding: REdgeInsets.only(left: 25),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       "Verification Code",
//                       style: context.theme.textTheme.bodyLarge!.copyWith(fontSize: 32.sp, fontWeight: FontWeight.w600, color: AppColors.l111719),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 50.h,
//                 ),
//                 Center(
//                   child: Text(
//                     "Please enter the verification code that has \nbeen sent to email@gmail.com ",
//                     style: context.theme.textTheme.bodyLarge!.copyWith(
//                       color: Colors.black.withOpacity(0.6),
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 50.h,
//                 ),
//                 Padding(
//                   padding: REdgeInsets.symmetric(horizontal: 50),
//                   child: PinCodeTextField(
//                     controller: ref.read(authVm).otp,
//                     animationType: AnimationType.fade,
//                     obscureText: false,
//                     keyboardType: TextInputType.number,
//                     appContext: context,
//                     length: 4,
//                     cursorHeight: 30.h,
//                     textStyle: TextStyle(
//                       fontSize: 20.sp,
//                       fontWeight: FontWeight.normal,
//                       color: Colors.black,
//                     ),
//                     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                     pinTheme: PinTheme(
//                       errorBorderColor: Colors.red,
//                       activeColor: Colors.grey.withOpacity(0.3),
//                       selectedColor: Colors.amber,
//                       shape: PinCodeFieldShape.box,
//                       borderWidth: 1.w,
//                       fieldWidth: 55.w,
//                       fieldHeight: 70.h,
//                       inactiveColor: Colors.grey.withOpacity(0.3),
//                       borderRadius: BorderRadius.circular(10.r),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Haven't received a code? ",
//                       style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
//                     ),
//                     GestureDetector(
//                       onTap: () {},
//                       child: Text(
//                         "Reset",
//                         style: TextStyle(
//                           color: Colors.orange,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 16.sp,
//                           decoration: TextDecoration.underline,
//                           decorationColor: Colors.orange,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 30.h,
//                 ),
//                 NextbuttonWidgets(
//                   onPressed: () {
//                     context.go(AppRouteName.discoveryPage);
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
// }

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/riverpod.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";
import "package:food_delivery/src/core/style/app_colors.dart";
import "package:food_delivery/src/feature/auth/view/widgets/nextbutton_widgets.dart";
import "package:pin_code_fields/pin_code_fields.dart";

class VerificationcodePage extends ConsumerWidget {
  const VerificationcodePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 80.h),
                Padding(
                  padding: REdgeInsets.only(left: 25),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      context.localized.verificationcode,
                      style: context.theme.textTheme.bodyLarge!.copyWith(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.l111719,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50.h),
                Center(
                  child: Text(
                    context.localized.sentemail,
                    style: context.theme.textTheme.bodyLarge!.copyWith(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 50.h),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 50),
                  child: PinCodeTextField(
                    controller: ref.read(authVm).otp,
                    animationType: AnimationType.fade,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    appContext: context,
                    length: 4,
                    cursorHeight: 30.h,
                    textStyle: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    pinTheme: PinTheme(
                      errorBorderColor: Colors.red,
                      activeColor: Colors.grey.withOpacity(0.3),
                      selectedColor: Colors.amber,
                      shape: PinCodeFieldShape.box,
                      borderWidth: 1.w,
                      fieldWidth: 55.w,
                      fieldHeight: 70.h,
                      inactiveColor: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    onChanged: (value) {
                      ref.watch(authVm).otnNullFunction();
                    },
                  ),
                ),
                if (ref.read(authVm).errorMessage != null) ...[
                  SizedBox(height: 10.h),
                  Text(
                    ref.read(authVm).errorMessage!,
                    style: TextStyle(color: Colors.red, fontSize: 14.sp),
                  ),
                ],
                SizedBox(height: 20.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       "Haven't received a code? ",
                //       style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
                //     ),
                //     GestureDetector(
                //       onTap: () {},
                //       child: Text(
                //         "Reset",
                //         style: TextStyle(
                //           color: Colors.orange,
                //           fontWeight: FontWeight.w500,
                //           fontSize: 16.sp,
                //           decoration: TextDecoration.underline,
                //           decorationColor: Colors.orange,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: 30.h),
                NextbuttonWidgets(
                  onPressed: () =>
                      ref.watch(authVm).validateOtp(context: context, otp: ref.read(authVm).otp.text),
                ),
              ],
            ),
          ),
        ),
      );
}
