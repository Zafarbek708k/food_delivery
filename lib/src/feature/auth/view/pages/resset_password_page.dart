import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";
import "package:food_delivery/src/core/routes/app_route_name.dart";
import "package:food_delivery/src/core/style/app_colors.dart";
import "package:food_delivery/src/feature/auth/view/widgets/login_button_widget.dart";
import "package:food_delivery/src/feature/auth/view/widgets/resset_password_textfield_widgets.dart";
import "package:go_router/go_router.dart";

class RessetPasswordPage extends StatefulWidget {
  const RessetPasswordPage({super.key});

  @override
  State<RessetPasswordPage> createState() => _RessetPasswordPageState();
}

class _RessetPasswordPageState extends State<RessetPasswordPage> {
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
                      "Reset password",
                      style: context.theme.textTheme.bodyLarge!.copyWith(
                        fontSize: 32.sp,
                        color: AppColors.l111719,
                        fontWeight: FontWeight.w600,
                      ),
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
              const RessetPasswordTextfieldWidgets(),
            
            ],
          ),
        ),
      );
}
