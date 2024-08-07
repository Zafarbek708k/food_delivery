import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;

   TextEditingController? controller;

   CustomTextField({
    super.key,
    required this.labelText,
     this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0, // Add shadow
      shadowColor: Colors.black.withOpacity(0.25), // Shadow color
      borderRadius: BorderRadius.circular(10), // Border radius for shadow
      child:  SizedBox(
        width: MediaQuery.of(context).size.width*0.9,
        height: 60,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,

            filled: true,
            fillColor: Colors.white,
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
}