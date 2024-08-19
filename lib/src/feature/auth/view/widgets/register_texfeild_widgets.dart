import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/riverpod.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";
import "package:food_delivery/src/feature/auth/view/widgets/regester_button_widget.dart";

class RegisterTexfeildWidgets extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) => Form(
        key: ref.read(authVm).fromKey,
        child: Column(
          children: [
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 25.w),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  context.localized.name,
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
                controller: ref.read(authVm).registerNameController,
                textInputAction: TextInputAction.next,
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
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
                  hintText: context.localized.yourName,
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.3),
                    fontSize: 16.sp,
                  ),
                ),
                validator: (value) => value != null && ref.read(authVm).registerNameController.text.isNotEmpty ? null : context.localized.pleaseenteryourusername,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
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
                textInputAction: TextInputAction.next,
                controller: ref.read(authVm).registerEmailController,
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.emailAddress,
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
                  hintText: context.localized.youremail,
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.3),
                    fontSize: 16.sp,
                  ),
                ),
                validator: (value) =>
                    value != null && value.contains("@gmail.com") ? null : context.localized.pleaseenteryouremailaddress,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
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
                controller: ref.read(authVm).registerPasswordController,
                obscureText: ref.read(authVm).registerEye,
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.visiblePassword,
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
                    onPressed: ref.watch(authVm).singInEyeFunction,
                    icon: !ref.read(authVm).registerEye
                        ? Icon(
                            Icons.visibility_off_rounded,
                            color: Colors.black.withOpacity(0.4),
                          )
                        : const Icon(Icons.visibility_rounded,),
                  ),
                  hintText: "Password",
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.3),
                    fontSize: 16.sp,
                  ),
                ),
                validator: (value) {
                  final regex = RegExp(r"^(?=.*?[a-z])(?=.*?[0-9]).{8,}$");
                  return value != null && value.contains(regex)
                      ? null
                      : context.localized.mustbe;
                },
                // validator: (value) => value != null && value.contains("@gmail.com") ? null : 'please enter your email address Example => (example@gmail.com)',
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            RegesterButtonWidget(
              onPressed: () => ref.watch(authVm).singUpButton(context: context),

              // context.go("${AppRouteName.signIn}/${AppRouteName.signUp}/${AppRouteName.verification}");
            ),
          ],
        ),
      );
}
