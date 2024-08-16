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
            SizedBox(height: 35.h),
            Text(
              context.localized.welcome,
              style: context.theme.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold, fontSize: 28, color: Colors.yellow),
            ),
            SizedBox(height: 10.h),
            Text(
              context.localized.fastFood,
              style: context.theme.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w600, fontSize: 24, color: Colors.yellow),
            ),
            SizedBox(height: 20.h),
            Text(
              context.localized.welcomeLastText,
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
                context.localized.startWithEmail,
                style: context.theme.textTheme.bodyLarge
                    ?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                const Expanded(child: Divider(color: Colors.white)),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    context.localized.signInWith,
                    style: context.theme.textTheme.bodyLarge?.copyWith(color: Colors.white),
                  ),
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
                  context.localized.alreadyHaveAnAccount,
                  style: context.theme.textTheme.bodyLarge
                      ?.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                ),
                TextButton(
                  onPressed: signInButton,
                  child: Text(
                    context.localized.signIn,
                    style: context.theme.textTheme.bodyLarge?.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
