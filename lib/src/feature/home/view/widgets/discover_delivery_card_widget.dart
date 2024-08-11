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
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
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


class DeliveryCardWidget1 extends StatelessWidget {
  const DeliveryCardWidget1({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.time,
    required this.rating,
    required this.onPressed,
    required this.description,
    super.key,
  });

  final String imageUrl;
  final String title;
  final String price;
  final String time;
  final String rating;
  final String description;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Padding(
        padding: REdgeInsets.all(8),
        child: InkWell(
          onTap: onPressed,
          child: Container(
            width: 270.w,
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
                    // child: Center(
                    //   child: CachedNetworkImage(
                    //     imageUrl: imageUrl,
                    //      fit: BoxFit.cover,
                    //     progressIndicatorBuilder: (context, url, downloadProgress) =>
                    //         CircularProgressIndicator(value: downloadProgress.progress),
                    //     errorWidget: (context, url, error) => Icon(Icons.error),
                    //   ),
                    // ),
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
                    padding: REdgeInsets.symmetric(vertical: 2, horizontal: 5),
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
        ),
      );
}



