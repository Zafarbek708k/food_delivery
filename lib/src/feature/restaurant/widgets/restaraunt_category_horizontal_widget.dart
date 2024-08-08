import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";

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
              child: const CategoryCard(
                title: "Brunch",
                places: 94,
                imageUrl:
                    "https://freshday.ru/image/cache/catalog/raznye-vidy-italyanskoy-pasty-1152x768.webp",
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

  const CategoryCard({
    required this.title,
    required this.places,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Card(
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
              width: 150.w,
              height: 120.h,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.all(8.w),
              width: 100.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                  4.horizontalSpace,
                  Text(
                    "$places places",
                    style: context.theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
