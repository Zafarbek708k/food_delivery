import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";
import "package:food_delivery/src/core/routes/app_route_name.dart";
import "package:food_delivery/src/core/style/app_colors.dart";
import "package:food_delivery/src/core/style/text_style.dart";
import "package:food_delivery/src/feature/auth/widgets/login_button_widget.dart";
import "package:food_delivery/src/feature/auth/widgets/login_texfeild_widget.dart";
import "package:food_delivery/src/feature/home/view/pages/home_page.dart";
import "package:go_router/go_router.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 290),
                child: Text(
                  "Login",
                  style: context.theme.textTheme.bodyLarge!.copyWith(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.l111719,
                  ),
                ),
              ),
              const LoginTexfeildWidget(),
              Column(
                children: [
                  LoginButtonWidget(
                    NameText: "Login",
                    onPressed: () {
                      context.go(AppRouteName.discoveryPage);
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an accaunt? ",
                        style: context.theme.textTheme.bodyLarge!.copyWith(
                          color: AppColors.l111719,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.go("${AppRouteName.signIn}/${AppRouteName.signUp}");
                        },
                        child: Text(
                          "Sing Up",
                          style: TextStyle(fontSize: 16.sp, color: Colors.orange),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: REdgeInsets.symmetric(
                      horizontal: 60,
                    ),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            thickness: 1.8,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Sign in with",
                          style: context.theme.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.l111719,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        const Expanded(
                          child: Divider(
                            thickness: 1.8,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: REdgeInsets.symmetric(horizontal: 30),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r), side: const BorderSide()),
                          height: 40.h,
                          minWidth: double.infinity,
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/facebook_icon.svg",
                                width: 25.w,
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                "Countine with Facebook",
                                style: context.theme.textTheme.bodyLarge!.copyWith(
                                  color: AppColors.l111719,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: REdgeInsets.symmetric(horizontal: 30),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r), side: const BorderSide()),
                          height: 40.h,
                          minWidth: double.infinity,
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/google_icon.svg",
                                width: 25.w,
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                "Continue with Google",
                                style: context.theme.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.l111719,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
