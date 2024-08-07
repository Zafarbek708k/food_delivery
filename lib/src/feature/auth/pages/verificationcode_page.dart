import 'package:flutter/material.dart';
import 'package:food_delivery/src/core/style/text_style.dart';

class VerificationcodePage extends StatelessWidget {
  const VerificationcodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Verification Code",
                    style: const AppTextStyle().bodyLargeBold!.copyWith(fontSize: 32),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
