import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class RegisterTexfeildWidgets extends StatefulWidget {
  const RegisterTexfeildWidgets({super.key});

  @override
  State<RegisterTexfeildWidgets> createState() => _RegisterTexfeildWidgetsState();
}

class _RegisterTexfeildWidgetsState extends State<RegisterTexfeildWidgets> {
  bool isEye = true;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding:  REdgeInsets.symmetric(horizontal: 25.w),
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
           SizedBox(
            height: MediaQuery.of(context).size.height*0.01,
          ),
          Padding(
            padding:  REdgeInsets.symmetric(horizontal: 25.w),
            child: TextField(
                            textInputAction: TextInputAction.next,

              style: const TextStyle(color: Colors.black),
              keyboardType: TextInputType.name,
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
                hintText: "Your name",
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.3),
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
           SizedBox(
            height: MediaQuery.of(context).size.height*0.01,
          ),
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

              style: const TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,
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
            height: MediaQuery.of(context).size.height*0.01,
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
              style: const TextStyle(color: Colors.black),
              keyboardType: TextInputType.visiblePassword,
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
                suffixIcon: IconButton(
                  onPressed: () {
                    isEye = !isEye;
                    setState(() {});
                  },
                  icon: !isEye
                      ? Icon(
                          Icons.visibility_rounded,
                          color: Colors.black.withOpacity(0.4),
                        )
                      : const Icon(Icons.visibility_off_rounded),
                ),
                hintText: "Password",
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.3),
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        ],
      );
}
