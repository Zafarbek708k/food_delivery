import 'package:flutter/material.dart';
import "package:food_delivery/src/core/routes/app_route_name.dart";
import "package:go_router/go_router.dart";

class RegisterTexfeildWidgets extends StatefulWidget {
  const RegisterTexfeildWidgets({super.key});

  @override
  State<RegisterTexfeildWidgets> createState() => _RegisterTexfeildWidgetsState();
}

class _RegisterTexfeildWidgetsState extends State<RegisterTexfeildWidgets> {
  bool isEye = false;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Name",
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
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.name,
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
                hintText: "Your name",
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.3),
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Email",
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
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,
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
                hintText: "Your email",
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.3),
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
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
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.visiblePassword,
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
                    setState(() {});
                  },
                  icon: isEye
                      ? Icon(
                          Icons.visibility_rounded,
                          color: Colors.black.withOpacity(0.4),
                        )
                      : Icon(Icons.visibility_off_rounded),
                ),
                hintText: "Password",
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.3),
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.centerRight,
              child: MaterialButton(
                onPressed: () {
                  context.go(AppRouteName.reSetEmail);
                },
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
