import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/feature/auth/pages/login_page.dart";
import "package:go_router/go_router.dart";
import "../../../../core/routes/app_route_name.dart";
import "../widgets/welcome_page_info_widget.dart";

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) =>
     Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/welcome_bcg_image.png"), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 600.h, // Adjust the height as needed
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.white.withOpacity(0.1),
                      Colors.deepOrange.withOpacity(0.7), // End with the desired color and opacity
                      Colors.deepOrange.withOpacity(0.7), // End with the desired color and opacity
                    ],
                  ),
                ),
              ),
            ),

            /// this is all widgets (buttons, Text nad anything)
            InfoWelcomePageWidgets(
              googleButton: () {},
              facebookButton: () {},
              emailButton: () {
                context.go(AppRouteName.signIn);
              },
              signInButton: () {},
            ),
          ],
        ),
      ),
    );
}
