import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";
import "package:lottie/lottie.dart";
import "package:shimmer/shimmer.dart";

class RestaurantCard extends ConsumerWidget {
  const RestaurantCard({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Padding(
        padding: REdgeInsets.symmetric(vertical: 8, horizontal: 15),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
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
            borderRadius: BorderRadius.circular(14.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14.r),
                    topRight: Radius.circular(14.r),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://t3.ftcdn.net/jpg/02/52/38/80/360_F_252388016_KjPnB9vglSCuUJAumCDNbmMzGdzPAucK.jpg",
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 150.w,
                        color: Colors.white,
                      ),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Lottie.asset("assets/lotties/no_data.json"),
                    ),
                  ),
                ),
                Padding(
                  padding: REdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Evos Lavash",
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                      5.verticalSpace,
                      Text(
                        "Choose from a variety of bowl options and taccccccccccccccccccs...",
                        style: context.theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 14.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      5.verticalSpace,
                      Row(
                        children: [
                          const Icon(Icons.wallet, size: 16, color: Colors.orange),
                          Text(
                            "€1.00",
                            style: context.theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          10.horizontalSpace,
                          const Icon(
                            Icons.access_time,
                            size: 16,
                            color: Colors.orange,
                          ),
                          Text(
                            "40-50min",
                            style: context.theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          10.horizontalSpace,
                          const Icon(Icons.star, size: 16, color: Colors.orange),
                          Text(
                            "9.2",
                            style: context.theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
