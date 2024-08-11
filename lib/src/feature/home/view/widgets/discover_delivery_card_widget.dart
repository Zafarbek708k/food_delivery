import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";
// import 'package:cached_network_image/cached_network_image.dart';

class DeliveryCardWidget extends StatelessWidget {
  const DeliveryCardWidget({required this.imageUrl, required this.title, required this.price, required this.time, required this.rating, required this.description, required this.onPressed, super.key});

  final String imageUrl;
  final String title;
  final String price;
  final String time;
  final String rating;
  final String description;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) =>
     CupertinoButton(
      onPressed: onPressed,
      child: Container(
        width: 290.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7.r,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  imageUrl,
                  height: 150.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding:  REdgeInsets.only(top: 4, left: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: context.theme.textTheme.bodyLarge?.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
                    Text(description, style: context.theme.textTheme.bodyLarge?.copyWith(color: Colors.black)),
                    Text("$price  •  $time  • ⭐ $rating", style: context.theme.textTheme.bodyLarge?.copyWith(color: Colors.black)),
                    ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
}
