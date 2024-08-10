import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:food_delivery/src/core/routes/app_route_name.dart";
import "package:food_delivery/src/core/style/text_style.dart";
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 80,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 260),
                child: Text(
                  "Sing Up",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                  ),
                ),
              ),
              const RegisterTexfeildWidgets(),
              Column(
                children: [
                  RegesterButtonWidget(
                    onPressed: () {
                      context.go("${AppRouteName.signIn}/${AppRouteName.signUp}/${AppRouteName.verification}");
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: Row(
                      children: [
                        Text(
                          "Don't have an accaunt? ",
                          style: const AppTextStyle().bodyLarge,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.orange,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
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
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Sign in with",
                          style: const AppTextStyle().bodyLarge,
                        ),
                        const SizedBox(
                          width: 10,
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
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), side: const BorderSide()),
                          height: 40,
                          minWidth: double.infinity,
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/facebook_icon.svg",
                                width: 25,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Countine with Facebook",
                                style: const AppTextStyle().bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30), side: const BorderSide()),
                          height: 40,
                          minWidth: double.infinity,
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/google_icon.svg",
                                width: 25,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Countine with Google",
                                style: const AppTextStyle().bodyLarge,
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
