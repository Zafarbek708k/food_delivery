import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";
import "package:food_delivery/src/core/routes/app_route_name.dart";
import "package:food_delivery/src/feature/auth/view/widgets/nextbutton_widgets.dart";
import "package:food_delivery/src/feature/auth/view/widgets/resset_email_widgets.dart";
import "package:go_router/go_router.dart";

class RessetEmail extends StatelessWidget {
  const RessetEmail({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
               SizedBox(
                height: 80.h,
              ),
              Center(
                child: Padding(
                  padding:  REdgeInsets.only(left: 25),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Resset Email",
                      style: context.theme.textTheme.bodyLarge!.copyWith(fontSize: 32.sp,fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
               SizedBox(
                height: 50.h,
              ),
              Center(
                child: Text(
                  "Please enter the verification code that has \nbeen sent to email@gmail.com ",
                  style: context.theme.textTheme.bodyLarge!.copyWith(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
               SizedBox(
                height: 50.h,
              ),
              const RessetEmailWidgets(),
               SizedBox(
                height: 80.h,
              ),
              NextbuttonWidgets(
                onPressed: () {
                  context.go("${AppRouteName.signIn}/${AppRouteName.reSetEmail}/${AppRouteName.reSetVerification}");
                },
              ),
            ],
          ),
        ),
      );
}
