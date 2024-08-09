import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class HorizontalCategories extends StatelessWidget {
  const HorizontalCategories({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            5,
            (index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: CategoryCard(
                title: "Brunch",
                places: 94,
                imageUrl:
                    "https://freshday.ru/image/cache/catalog/raznye-vidy-italyanskoy-pasty-1152x768.webp",
                onTap: () {
                  // Bu yerda kerakli funksiya yoki navigatsiya qiling
                  log("HorizontalCategories $index bosildi");
                },
              ),
            ),
          ),
        ),
      );
}

class CategoryCard extends StatelessWidget {
  final String title;
  final int places;
  final String imageUrl;
  final VoidCallback onTap; // OnTap funksiyasini qo'shish

  const CategoryCard({
    required this.title,
    required this.places,
    required this.imageUrl,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap, // Bu yerda bosilganda nima sodir bo'lishini belgilaymiz
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageUrl,
                width: 135.6.w,
                height: 182.h,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 135.6.w,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "$places places",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
