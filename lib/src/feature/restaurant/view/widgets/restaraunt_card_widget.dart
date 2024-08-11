import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
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
                  child: Image.network(
                    "https://t3.ftcdn.net/jpg/02/52/38/80/360_F_252388016_KjPnB9vglSCuUJAumCDNbmMzGdzPAucK.jpg",
                    height: 150.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
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
