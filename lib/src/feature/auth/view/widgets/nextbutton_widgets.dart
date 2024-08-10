import "package:flutter/material.dart";

class NextbuttonWidgets extends StatelessWidget {
  const NextbuttonWidgets({required this.onPressed, super.key});
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
          "Next",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
}
