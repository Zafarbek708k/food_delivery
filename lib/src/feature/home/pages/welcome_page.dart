import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:food_delivery/src/feature/auth/pages/login_page.dart';
import 'package:food_delivery/src/feature/auth/pages/register_page.dart';
import '../widgets/welcome_page_info_widget.dart';
import 'home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                height: 600, // Adjust the height as needed
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
                log("MyHomePagega otishi kere");
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
              },
              signInButton: () {},
            ),
          ],
        ),
      ),
    );
  }
}


