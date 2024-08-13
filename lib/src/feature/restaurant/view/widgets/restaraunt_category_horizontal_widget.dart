import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:go_router/go_router.dart";
import "package:lottie/lottie.dart";
import "package:shimmer/shimmer.dart";

import "../../../../core/routes/app_route_name.dart";

class HorizontalCategories extends ConsumerWidget {
  const HorizontalCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => SingleChildScrollView(
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
                    context.go("${AppRouteName.restaurantPage}/${AppRouteName.restaurantDetailPage}");
                  },
                ),
                if (index < 4) SizedBox(width: 8.w),
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
  final VoidCallback onTap;

  const CategoryCard({
    required this.title,
    required this.places,
    required this.imageUrl,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: REdgeInsets.only(bottom: 10, left: 3),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: CupertinoButton(
            onPressed: onTap,
            padding: EdgeInsets.zero,
            borderRadius: BorderRadius.circular(12.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    width: 135.6.w,
                    height: 182.h,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 135.6.w,
                        height: 182.h,
                        color: Colors.white,
                      ),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Lottie.asset("assets/lotties/no_network.json"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 135.6.w,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
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
                        // SizedBox(height: 4.h),
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
        ),
      );
}
