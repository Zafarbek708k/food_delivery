import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";

class DeliveryCardWidget extends StatelessWidget {
  const DeliveryCardWidget({required this.imageUrl, required this.title, required this.price, required this.time, required this.rating, super.key});

  final String imageUrl;
  final String title;
  final String price;
  final String time;
  final String rating;

  @override
  Widget build(BuildContext context) => Padding(
        padding:  REdgeInsets.all(8),
        child: Container(
          width: 250.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
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
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
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
                  padding:  REdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: context.theme.textTheme.bodyLarge?.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
                      Text("$price  •  $time", style: context.theme.textTheme.bodyLarge?.copyWith(color: Colors.black)),
                      Text("⭐ $rating", style: context.theme.textTheme.bodyLarge?.copyWith(color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
