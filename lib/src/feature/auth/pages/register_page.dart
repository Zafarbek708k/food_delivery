import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery/src/core/constants/context_extension.dart';
import 'package:food_delivery/src/feature/auth/widgets/login_button_widget.dart';
import 'package:food_delivery/src/feature/auth/widgets/register_texfeild_widgets.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             SizedBox(
              height: 80,
            ),
             Padding(
              padding: EdgeInsets.only(right: 260),
              child: const Text(
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
                LoginButtonWidget(onPressed: () {  },),
                 SizedBox(
                  height: 25,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 80),
                  child: Row(
                    children: [
                      Text(
                        "Don't have an accaunt? ",
                        style: context.theme.textTheme.bodyLarge,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.orange,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                 SizedBox(
                  height: 25,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(
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
                        style: context.theme.textTheme.bodyLarge,
                      ),
                       SizedBox(
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
                 SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 30),
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
                              style: context.theme.textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 30),
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
                              style: context.theme.textTheme.bodyLarge,
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
