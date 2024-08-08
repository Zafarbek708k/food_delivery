import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:food_delivery/src/core/style/text_style.dart";
import "package:pin_code_fields/pin_code_fields.dart";

class RessetVerficationCodePage extends StatelessWidget {
  const RessetVerficationCodePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
               SizedBox(
                height: 80,
              ),
              Padding(
                padding:  EdgeInsets.only(left: 25),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Verification Code",
                    style: AppTextStyle().bodyLarge!.copyWith(fontSize: 32),
                  ),
                ),
              ),
               SizedBox(
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
              SizedBox(
                height: 50,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 50),
                child: PinCodeTextField(
                  // controller: otp,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  appContext: context,
                  length: 4,
                  cursorHeight: 30,
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  pinTheme: PinTheme(
                    activeColor: Colors.grey.withOpacity(0.3),
                    selectedColor: Colors.amber,
                    shape: PinCodeFieldShape.box,
                    borderWidth: 1,
                    fieldWidth: 55,
                    fieldHeight: 70,
                    inactiveColor: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
}