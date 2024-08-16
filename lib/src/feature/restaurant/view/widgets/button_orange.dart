import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/core/style/app_colors.dart";

class OrangeButton extends StatelessWidget {
  const OrangeButton({
    required this.onPressed,
    this.text,
    this.richText,
    super.key,
  });

  final VoidCallback onPressed;
  final String? text;
  final InlineSpan? richText;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 40,
        child: MaterialButton(
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          color: AppColors.lF83B01,
          minWidth: double.infinity,
          child: text != null
              ? Text(
                  text!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                  ),
                )
              : RichText(
                  text: TextSpan(
                    children: [
                      richText!,
                    ],
                  ),
                ),
        ),
      );
}
