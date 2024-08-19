// ignore: file_names
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/riverpod.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";
import "package:food_delivery/src/core/routes/app_route_name.dart";
import "package:food_delivery/src/feature/auth/view/widgets/login_button_widget.dart";
import "package:go_router/go_router.dart";

class LoginTexfeildWidget extends ConsumerWidget {
  const LoginTexfeildWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Form(
        key: ref.read(authVm).loginFromKey,
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
                controller: ref.read(authVm).loginEmailController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                keyboardAppearance: Brightness.dark,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
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
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: const BorderSide(
                      color: Colors.orange,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                  hintText: context.localized.youremail,
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.3),
                    fontSize: 16.sp,
                  ),
                ),
                validator: (value) => true == value?.endsWith("@gmail.com")
                    ? null
                    : context.localized.youremailisincorrect,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 25.w),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  context.localized.password,
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
                controller: ref.read(authVm).loginPasswordController,
                obscureText: ref.read(authVm).loginEye,
                keyboardType: TextInputType.visiblePassword,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
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
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: const BorderSide(
                      color: Colors.orange,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: ref.watch(authVm).loginEyeFunction,
                    icon: !ref.read(authVm).loginEye
                        ? Icon(
                            Icons.visibility_rounded,
                            color: Colors.black.withOpacity(0.4),
                          )
                        : const Icon(Icons.visibility_off_rounded),
                  ),
                  hintText: context.localized.password,
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.3),
                    fontSize: 16.sp,
                  ),
                ),
                validator: (value) => value != null && value.length > 2
                    ? null
                    : context.localized.yourpasswordisincorrect,
              ),
            ),
            Padding(
              padding: REdgeInsets.only(right: 10.h),
              child: Align(
                alignment: Alignment.centerRight,
                child: MaterialButton(
                  onPressed: () {
                    context.go(
                        "${AppRouteName.signIn}/${AppRouteName.reSetEmail}");
                  },
                  child: Text(
                    context.localized.forgotpassword,
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.orange,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
            ),
            LoginButtonWidget(
              NameText: context.localized.login,
              onPressed: () async {
                final res = await ref.watch(authVm).loginButton();
                if (context.mounted && res) {
                  context.go(AppRouteName.discoveryPage);
                }
              },
            ),
          ],
        ),
      );
}
