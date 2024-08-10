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
            (index) => Row(
              children: [
                CategoryCard(
                  title: "Brunch",
                  places: 94,
                  imageUrl:
                      "https://freshday.ru/image/cache/catalog/raznye-vidy-italyanskoy-pasty-1152x768.webp",
                  onTap: () {
                    // Bu yerda kerakli funksiya yoki navigatsiya qiling
                    log("HorizontalCategories $index bosildi");
                  },
                ),
                if (index < 4) SizedBox(width: 8.w), // Faqat oxirgi karta uchun masofa qo'shilmaydi
              ],
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
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onTap, // Bu yerda bosilganda nima sodir bo'lishini belgilaymiz
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent, // Tushirilgan o'lchamni olib tashlaymiz
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ), // Card rangini belgilaymiz
          elevation: 1, // Card soya darajasini belgilaymiz
          shadowColor: Colors.transparent, // Soya rangini sozlash
        ),
        child: Card(
          color: Colors.white, // Cardning rangini shaffof qilamiz
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          elevation: 1, // Cardning o'zida soya bo'lmasligi
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
