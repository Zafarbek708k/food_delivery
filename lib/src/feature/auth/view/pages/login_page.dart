import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";
import "package:food_delivery/src/core/routes/app_route_name.dart";
import "package:food_delivery/src/core/style/app_colors.dart";
import "package:go_router/go_router.dart";

import "../widgets/login_button_widget.dart";
import "../widgets/login_texfeild_widget.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 25.w),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Login",
                    style: context.theme.textTheme.bodyLarge!.copyWith(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.l111719,
                    ),
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
                   SizedBox(
            height: MediaQuery.of(context).size.height*0.03,
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
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          context.go("${AppRouteName.signIn}/${AppRouteName.signUp}");
                        },
                        child: Text(
                          "Sing Up",
                          style: TextStyle(fontSize: 16.sp, color: Colors.orange,),
                        ),
                      ),
                    ],
                  ),
                   SizedBox(
            height: MediaQuery.of(context).size.height*0.03,
          ),
                  Padding(
                    padding: REdgeInsets.symmetric(
                      horizontal: 25.w,
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
                          width: MediaQuery.of(context).size.width*0.02,
                        ),
                        Text(
                          "Sign in with",
                          style: context.theme.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.l111719,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.02,
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
                    height: MediaQuery.of(context).size.height*0.03,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: REdgeInsets.symmetric(horizontal: 25.w),
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
                                width: MediaQuery.of(context).size.width*0.07,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.07,
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
                                height: MediaQuery.of(context).size.height*0.01,
                      ),
                      Padding(
                        padding: REdgeInsets.symmetric(horizontal: 25.w),
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
                                width: MediaQuery.of(context).size.width*0.07,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.07,
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
