import "package:flutter/material.dart";

class RegesterButtonWidget extends StatelessWidget {
  const RegesterButtonWidget({required this.onPressed, super.key});
    final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(300),
        ),
        color: Colors.red,
        minWidth: double.infinity,
        height: 60,
        child: const Text(
          "Sing Up",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
}
