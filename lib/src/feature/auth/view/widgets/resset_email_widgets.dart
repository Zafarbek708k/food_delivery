import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/riverpod.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";
import "package:food_delivery/src/feature/auth/view/widgets/nextbutton_widgets.dart";
import "package:go_router/go_router.dart";

class RessetEmailWidgets extends ConsumerWidget {
  const RessetEmailWidgets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Form(
        key: ref.read(authVm).resetEmailFromKey,
        child: Column(
          children: [
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 25.w),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  context.localized.email,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 25.w),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: const BorderSide(
                      color: Colors.orange,
                      width: 2,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                  hintText: context.localized.email,
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.3),
                    fontSize: 16.sp,
                  ),
                ),
                validator: (value) => value != null && value.contains("@gmail.com")
                    ? null
                    : context.localized.pleaseenteryouremailaddress,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            NextbuttonWidgets(
              onPressed: () async {
                ref.watch(authVm).resetEmailButtonFunction(context: context);
                log("forget password");

                final res = await ref.watch(authVm).forgotPasswordButton(context: context);
                if (res && context.mounted) {
                  log("message from forget password");
                  context.go("");
                }
              },
            ),
          ],
        ),
      );
}
