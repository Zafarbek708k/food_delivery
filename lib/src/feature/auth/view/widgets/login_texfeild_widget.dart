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
  bool isEye = true;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding:  REdgeInsets.symmetric(horizontal: 25.w),
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
            height: MediaQuery.of(context).size.height*0.01,
          ),
          Padding(
            padding:  REdgeInsets.symmetric(horizontal: 25.w),
            child: TextField(
              textInputAction: TextInputAction.next,
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
            height: MediaQuery.of(context).size.height*0.03,
          ),
          Padding(
            padding:  REdgeInsets.symmetric(horizontal: 25.w),
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
            height: MediaQuery.of(context).size.height*0.01,
          ),
          Padding(
            padding:  REdgeInsets.symmetric(horizontal: 25.w),
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
                  icon: !isEye? Icon(
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
            padding:  REdgeInsets.only(right: 10.h),
            child: Align(
              alignment: Alignment.centerRight,
              child: MaterialButton(
                onPressed: () {
                  context.go("${AppRouteName.signIn}/${AppRouteName.reSetEmail}");
                },
                child: const  Text(
                  "Forgot password?",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.orange,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
