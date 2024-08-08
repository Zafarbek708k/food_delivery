import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Card(
          margin: REdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14),
                  topRight: Radius.circular(14),
                ),
                child: Image.network(
                  "https://media.express24.uz/r/:w/:h/USkw4zygayqAjhGTgd5qZ.jpg",
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
                      "Tasty bowl",
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
                        const Text(
                          "€1.00",
                          style: TextStyle(color: Colors.orange),
                        ),
                        10.horizontalSpace,
                        const Icon(Icons.access_time, size: 16),
                        const Text("40-50min"),
                        10.horizontalSpace,
                        const Icon(Icons.star, size: 16, color: Colors.orange),
                        const Text("9.2"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

class RestaurantList extends StatelessWidget {
  const RestaurantList({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Restaurants"),
        ),
        body: ListView.builder(
          itemCount: 10, // Bu yerda cardlar sonini belgilashingiz mumkin
          itemBuilder: (context, index) => RestaurantCard(
            onTap: () {
              // Bu yerda card bosilganda bajariladigan ishni yozing
              debugPrint("Card $index bosildi");
            },
          ),
        ),
      );
}
