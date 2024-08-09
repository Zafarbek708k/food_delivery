
import "package:flutter/material.dart";

class CustomTextField extends StatelessWidget {
  final String hintText;

   TextEditingController? controller;

   CustomTextField({
    required this.hintText, super.key,
     this.controller,
  });

  @override
  Widget build(BuildContext context) => Material(
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.25),
      borderRadius: BorderRadius.circular(10),
      child:  SizedBox(
        width: MediaQuery.of(context).size.width*0.9,
        height: 60,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.white60,
            ),


            filled: true,
            fillColor: Colors.orangeAccent,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
}