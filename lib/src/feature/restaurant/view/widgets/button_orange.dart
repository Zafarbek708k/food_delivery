import "package:flutter/material.dart";
import "package:food_delivery/src/core/style/app_colors.dart";

class OrangeButton extends StatelessWidget {
  const OrangeButton({
    required this.onPressed,
    required this.text,
    super.key,
  });
  final VoidCallback onPressed;
  final String text;

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
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      );
}
