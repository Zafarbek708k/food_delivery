import 'package:flutter/material.dart';

class RessetPasswordTextfieldWidgets extends StatelessWidget {
  const RessetPasswordTextfieldWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Password",
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.orange,
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.1),
                ),
              ),
              suffixIcon: Icon(
                Icons.remove_red_eye,
                color: Colors.black.withOpacity(0.4),
              ),
              hintText: "Password",
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.3),
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
