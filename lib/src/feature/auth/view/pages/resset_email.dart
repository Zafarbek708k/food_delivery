import "package:flutter/material.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";
import "package:food_delivery/src/core/routes/app_route_name.dart";
import "package:food_delivery/src/core/style/text_style.dart";
import "package:food_delivery/src/feature/auth/view/widgets/nextbutton_widgets.dart";
import "package:food_delivery/src/feature/auth/view/widgets/resset_email_widgets.dart";
import "package:go_router/go_router.dart";

class RessetEmail extends StatelessWidget {
  const RessetEmail({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Reset Email",
                      style: const AppTextStyle().bodyLarge!.copyWith(fontSize: 32),
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
                  style: context.theme.textTheme.bodyLarge!.copyWith(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const RessetEmailWidgets(),
              const SizedBox(
                height: 80,
              ),
              NextbuttonWidgets(
                onPressed: () {
                  context.go("${AppRouteName.signIn}/${AppRouteName.reSetEmail}/${AppRouteName.reSetVerification}");
                },
              ),
            ],
          ),
        ),
      );
}
