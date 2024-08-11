import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";
import "package:food_delivery/src/core/style/app_images.dart";

class InfoWelcomePageWidgets extends StatelessWidget {
  const InfoWelcomePageWidgets({
    required this.googleButton,
    required this.facebookButton,
    required this.emailButton,
    required this.signInButton,
    super.key,
  });

  final VoidCallback googleButton;
  final VoidCallback facebookButton;
  final VoidCallback emailButton;
  final VoidCallback signInButton;

  @override
  Widget build(BuildContext context) => Padding(
        padding: REdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16.h),
            Text("Welcome to", style: context.theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, fontSize: 24)),
            Text("Fast Food", style: context.theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600, color: Colors.deepOrange)),
            SizedBox(height: 16.h),
            Text(
              "Get your favourite meals delivered quickly right to your doorstep",
              textAlign: TextAlign.center,
              style: context.theme.textTheme.bodyLarge?.copyWith(color: Colors.white),
            ),
            const Spacer(),
            MaterialButton(
              onPressed: emailButton,
              height: 50,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.black,
              child: Text(
                "Start with email",
                style: context.theme.textTheme.bodyLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                const Expanded(child: Divider(color: Colors.white)),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 18),
                  child: Text("Sign In With", style: context.theme.textTheme.bodyLarge?.copyWith(color: Colors.white)),
                ),
                const Expanded(child: Divider(color: Colors.white)),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: googleButton,
                    height: 55,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    color: context.theme.primaryColor,
                    child: SizedBox(height: 40.h, width: 50.w, child: AppImages.iconGoogle),
                  ),
                ),
                const SizedBox(width: 65),
                Expanded(
                  child: MaterialButton(
                    onPressed: facebookButton,
                    height: 55,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    color: context.theme.primaryColor,
                    child: SizedBox(height: 40.h, width: 50.w, child: AppImages.iconFacebook),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: context.theme.textTheme.bodyLarge?.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                ),
                TextButton(
                  onPressed: signInButton,
                  child: Text(
                    "Sign In",
                    style: context.theme.textTheme.bodyLarge?.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
