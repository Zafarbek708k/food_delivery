import 'package:flutter/material.dart';
import 'package:food_delivery/src/core/style/text_style.dart';
import 'package:food_delivery/src/feature/auth/widgets/login_button_widget.dart';
import 'package:food_delivery/src/feature/auth/widgets/resset_password_textfield_widgets.dart';

class RessetEmail extends StatelessWidget {
  const RessetEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 25),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Reset Email",
                    style: AppTextStyle().bodyLargeBold!.copyWith(fontSize: 32),
                  ),
                ),
              ),
            ),
            const SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  "Please enter the verification code that has \nbeen sent to email@gmail.com ",
                  style: const AppTextStyle().bodyLarge!.copyWith(
                        color: Colors.black.withOpacity(0.6),
                      ),
                ),
              ),
              const SizedBox(height: 50,),
                      const RessetPasswordTextfieldWidgets(),
                      const SizedBox(height: 80,),
            LoginButtonWidget(onPressed: () {  },),
          ],
        ),
      ),
    );
  }
}