import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "avatar_widget.dart";

class ProfileHeader extends StatelessWidget {
  final String name;

  const ProfileHeader({required this.name, super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const SizedBox(child: AvatarWidget()),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
              fontFamily: "Rubik",
              color: Colors.black,
            ),
          ),
          Text(
            "yourEmail@.gmail.com",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              fontFamily: "Rubik",
            ),
          ),
        ],
      );
}
