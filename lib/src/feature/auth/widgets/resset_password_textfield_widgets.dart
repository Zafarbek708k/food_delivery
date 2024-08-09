import 'package:flutter/material.dart';

class RessetPasswordTextfieldWidgets extends StatefulWidget {
  const RessetPasswordTextfieldWidgets({super.key});



  @override
  State<RessetPasswordTextfieldWidgets> createState() => _RessetPasswordTextfieldWidgetsState();
}

class _RessetPasswordTextfieldWidgetsState extends State<RessetPasswordTextfieldWidgets> {

  bool isEye = false;


  @override
  Widget build(BuildContext context) => Column(
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
            obscureText: isEye,
              keyboardType: TextInputType.visiblePassword,
              style: TextStyle(color: Colors.black),
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
              suffixIcon: IconButton(
                  onPressed: () {
                    isEye = !isEye;
                    setState(() {
                      
                    });
                  },
                  icon: isEye? Icon(
                    Icons.visibility_rounded,
                    color: Colors.black.withOpacity(0.4),
                  ):Icon(Icons.visibility_off_rounded),
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
