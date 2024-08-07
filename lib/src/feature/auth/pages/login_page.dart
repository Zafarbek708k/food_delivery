import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/src/core/style/text_style.dart';
import 'package:food_delivery/src/feature/auth/widgets/login_button_widget.dart';
import 'package:food_delivery/src/feature/auth/widgets/login_texFeild_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 150,
            ),
            Padding(
              padding: EdgeInsets.only(right: 290),
              child: Text(
                "Login",
                style: AppTextStyle().bodyLargeBold!.copyWith(
                      fontSize: 30,
                    ),
              ),
            ),
            const LoginTexfeildWidget(),
            Column(
              children: [
                const LoginButtonWidget(),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Row(
                    children: [
                      Text(
                        "Don't have an accaunt? ",
                        style: AppTextStyle().bodyLarge,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Sing Up",
                          style: TextStyle(fontSize: 16, color: Colors.orange),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
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
                        style: AppTextStyle().bodyMediumBold,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1.8,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
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
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Countine with Facebook",
                              style: AppTextStyle().bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
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
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Countine with Google",
                              style: AppTextStyle().bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
