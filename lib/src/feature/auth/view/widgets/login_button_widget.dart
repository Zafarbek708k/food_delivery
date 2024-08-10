import "package:flutter/material.dart";

class LoginButtonWidget extends StatelessWidget {
  // ignore: non_constant_identifier_names
  const LoginButtonWidget({required this.onPressed, required this.NameText, super.key});
  final VoidCallback onPressed;
  // ignore: non_constant_identifier_names
  final String NameText;

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
          child:  Text(
            NameText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      );
}
