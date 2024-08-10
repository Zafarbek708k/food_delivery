// ignore: file_names
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/core/routes/app_route_name.dart";
import "package:go_router/go_router.dart";

class LoginTexfeildWidget extends StatefulWidget {
  const LoginTexfeildWidget({super.key});

  @override
  State<LoginTexfeildWidget> createState() => _LoginTexfeildWidgetState();
}

class _LoginTexfeildWidgetState extends State<LoginTexfeildWidget> {
  bool isEye = false;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding:  REdgeInsets.symmetric(horizontal: 20),
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
           SizedBox(
            height: 5.h,
          ),
          Padding(
            padding:  REdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              keyboardAppearance: Brightness.dark,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(
                    color: Colors.orange,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.1),
                  ),
                ),
                hintText: "Your email",
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.3),
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
           SizedBox(
            height: 15.h,
          ),
          Padding(
            padding:  REdgeInsets.symmetric(horizontal: 20),
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
           SizedBox(
            height: 5.h,
          ),
          Padding(
            padding:  REdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              obscureText: isEye,
              keyboardType: TextInputType.visiblePassword,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(
                    color: Colors.orange,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.1),
                  ),
                ),
                suffixIcon:  IconButton(
                  onPressed: () {
                    isEye = !isEye;
                    setState(() {
                      
                    });
                  },
                  icon: isEye? Icon(
                    Icons.visibility_rounded,
                    color: Colors.black.withOpacity(0.4),
                  ): const Icon(Icons.visibility_off_rounded),
                ),
                hintText: "Password",
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.3),
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.centerRight,
              child: MaterialButton(
                onPressed: () {
                  context.go("${AppRouteName.signIn}/${AppRouteName.reSetEmail}");
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
