import "dart:async";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:food_delivery/src/core/routes/app_route_name.dart";
import "package:go_router/go_router.dart";

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      context.go(AppRouteName.welcomePage);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
     Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [CupertinoColors.activeOrange, Colors.deepOrangeAccent, Colors.deepOrange],
            ),
          ),
          child: Center(
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  "assets/images/logo_removebg_preview.png",
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
          ),
        ),
      ),
    );
}
