import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/generated/assets.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";
import "package:food_delivery/src/feature/auth/view/widgets/register_texfeild_widgets.dart";
import "package:go_router/go_router.dart";

import "../widgets/auth_social_button_widget.dart";

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  context.localized.singup,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 30.sp,
                  ),
                ),
              ),
            ),
            RegisterTexfeildWidgets(),
            SizedBox(height: screenHeight * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.localized.alreadyhaveanaccaunt,
                  style: context.theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                CupertinoButton(
                  onPressed: () => context.pop(),
                  padding: EdgeInsets.zero,
                  child: Text(
                    context.localized.login,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.orange,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 25.w),
              child: Row(
                children: [
                  const Expanded(
                    child: Divider(
                      thickness: 1.8,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Text(
                    context.localized.signInWith,
                    style: context.theme.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  const Expanded(
                    child: Divider(
                      thickness: 1.8,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Column(
              children: [
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 25.w),
                  child: SocialButton(
                    iconPath: Assets.iconsFacebookIcon,
                    text: context.localized.countinewithfacebook,
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 25.w),
                  child: SocialButton(
                    iconPath: Assets.iconsGoogleIcon,
                    text: context.localized.continuewithgoogle,
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
