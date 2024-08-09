import "package:flutter/material.dart";

class EditProfileButtonWidget extends StatelessWidget {
  final onPressed;
  final Color color;

  const EditProfileButtonWidget({
    required this.onPressed,  required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: MaterialButton(


          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(300),
          ),
          color:color,
          minWidth: double.infinity,
          height: 60,
          child: const Text(
            "Save",
            style: TextStyle(
              color: Colors.white60,
              fontSize: 18,
            ),
          ),
        ),
      );
}
