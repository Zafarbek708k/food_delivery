import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";
import "package:food_delivery/src/core/routes/app_route_name.dart";
import "package:food_delivery/src/feature/auth/view/widgets/regester_button_widget.dart";
import "package:food_delivery/src/feature/auth/view/widgets/register_texfeild_widgets.dart";
import "package:go_router/go_router.dart";

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Sing Up",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 30.sp,
                    ),
                  ),
                ),
              ),
               RegisterTexfeildWidgets(),
              
              Column(
                children: [
                  
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an accaunt? ",
                        style: context.theme.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      CupertinoButton(
                        onPressed: () {
                          context.pop();
                        },
                        padding: EdgeInsets.zero,
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.orange,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
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
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Text(
                          "Sign in with",
                          style: context.theme.textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
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
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: REdgeInsets.symmetric(horizontal: 25.w),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                            side: const BorderSide(),
                          ),
                          height: 40.h,
                          minWidth: double.infinity,
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/facebook_icon.svg",
                                width: MediaQuery.of(context).size.width * 0.07,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.03,
                              ),
                              Text(
                                "Countine with Facebook",
                                style: context.theme.textTheme.bodyLarge!.copyWith(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Padding(
                        padding: REdgeInsets.symmetric(horizontal: 25.w),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                            side: const BorderSide(),
                          ),
                          height: 40.h,
                          minWidth: double.infinity,
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/google_icon.svg",
                    width: MediaQuery.of(context).size.width * 0.07,
                  
                              ),
                              SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                              Text(
                                "Countine with Google",
                                style: context.theme.textTheme.bodyLarge!.copyWith(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
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
