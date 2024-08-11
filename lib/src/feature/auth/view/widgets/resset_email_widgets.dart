import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class RessetEmailWidgets extends StatelessWidget {
  const RessetEmailWidgets({super.key});

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
            keyboardType: TextInputType.emailAddress,
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

              hintText: "Email",
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
