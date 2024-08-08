import 'package:flutter/material.dart';
import 'package:food_delivery/src/core/constants/context_extension.dart';
import 'package:food_delivery/src/feature/auth/widgets/login_button_widget.dart';
import 'package:food_delivery/src/feature/auth/widgets/resset_password_textfield_widgets.dart';

class RessetPasswordPage extends StatefulWidget {
  const RessetPasswordPage({super.key});

  @override
  State<RessetPasswordPage> createState() => _RessetPasswordPageState();
}

class _RessetPasswordPageState extends State<RessetPasswordPage> {
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
                    "Reset password",
                    style: context.theme.textTheme.bodyLarge!.copyWith(fontSize: 32),
                  ),
                ),
              ),
            ),
             SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  "Please enter the verification code that has \nbeen sent to email@gmail.com ",
                  style: context.theme.textTheme.bodyLarge!.copyWith(
                        color: Colors.black.withOpacity(0.6),
                      ),
                ),
              ),
               SizedBox(height: 50,),
                      const RessetPasswordTextfieldWidgets(),
                       SizedBox(height: 80,),
            LoginButtonWidget(onPressed: () {  },),
          ],
        ),
      ),
    );
  }
}
