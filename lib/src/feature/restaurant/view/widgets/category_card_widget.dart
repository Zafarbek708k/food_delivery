import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class CategoryCard extends StatelessWidget {
  final String title;
  final int places;
  final String imageUrl;

  const CategoryCard({required this.title, required this.places, required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) => Card(
        margin: REdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: SizedBox(
          width: 150.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.only(topLeft: Radius.circular(14), topRight: Radius.circular(14)),
                child: Image.network(
                  imageUrl,
                  height: 120.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // const SizedBox(height: 10),
              10.horizontalSpace,
              Padding(
                padding: REdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    // const SizedBox(height: 5),
                    5.horizontalSpace,
                    Text("$places places"),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
