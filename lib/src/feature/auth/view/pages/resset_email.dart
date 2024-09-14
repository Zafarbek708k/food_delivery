import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";
import "package:food_delivery/src/feature/auth/view/widgets/resset_email_widgets.dart";

class RessetEmail extends StatelessWidget {
  const RessetEmail({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              Center(
                child: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 25.w),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      context.localized.ressetEmail,
                      style: context.theme.textTheme.bodyLarge!
                          .copyWith(fontSize: 32.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 25.w),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    context.localized.sentemail,
                    style: context.theme.textTheme.bodyLarge!.copyWith(
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              const RessetEmailWidgets(),
            ],
          ),
        ),
      );
}
