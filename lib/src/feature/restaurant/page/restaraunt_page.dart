import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/feature/restaurant/widgets/restaraunt_card_widget.dart";
import "package:food_delivery/src/feature/restaurant/widgets/restaraunt_category_horizontal_widget.dart";

import "../../widgets/custom_appbar_widget.dart";

class RestaurantsPage extends StatefulWidget {
  const RestaurantsPage({super.key});

  @override
  RestaurantsPageState createState() => RestaurantsPageState();
}

class RestaurantsPageState extends State<RestaurantsPage> {
  bool showAllCategories = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBarWidget(
          appBarText: "Xurshid Umarov",
          actions: [
            IconButton(icon: const Icon(Icons.sort), onPressed: () {}),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: REdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Restaurants",
                      style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Categories",
                          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              showAllCategories = !showAllCategories;
                            });
                          },
                          child: Text(showAllCategories ? "Show less" : "See all"),
                        ),
                      ],
                    ),
                    // const SizedBox(height: 10),
                    20.horizontalSpace,
                    const HorizontalCategories(),
                    // _buildHorizontalCategories(),
                    // const SizedBox(height: 20),
                    20.horizontalSpace,
                    Text(
                      "All restaurants",
                      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => const RestaurantCard(),
                childCount: 10, // Adjust the number of restaurants as needed
              ),
            ),
          ],
        ),
      );

  // Widget buildHorizontalCategories() => const SingleChildScrollView(
  //       scrollDirection: Axis.horizontal,
  //       child: Row(
  //         children: [
  //           CategoryCard(
  //             title: "title",
  //             places: 15,
  //             imageUrl: "https://freshday.ru/image/cache/catalog/raznye-vidy-italyanskoy-pasty-1152x768.webp",
  //           ),
  //           CategoryCard(
  //             title: "title",
  //             places: 15,
  //             imageUrl: "https://freshday.ru/image/cache/catalog/raznye-vidy-italyanskoy-pasty-1152x768.webp",
  //           ),
  //           CategoryCard(
  //             title: "title",
  //             places: 15,
  //             imageUrl: "https://freshday.ru/image/cache/catalog/raznye-vidy-italyanskoy-pasty-1152x768.webp",
  //           ),
  //           CategoryCard(
  //             title: "title",
  //             places: 15,
  //             imageUrl: "https://freshday.ru/image/cache/catalog/raznye-vidy-italyanskoy-pasty-1152x768.webp",
  //           ),
  //           CategoryCard(
  //             title: "title",
  //             places: 15,
  //             imageUrl: "https://freshday.ru/image/cache/catalog/raznye-vidy-italyanskoy-pasty-1152x768.webp",
  //           ),
  //         ],
  //       ),
  //     );

  // Widget _buildAllCategories() {
  //   return const SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     child: Row(
  //       children: [
  //         CategoryCard(
  //             title: "Foot",
  //             places: 25,
  //             imageUrl: "https://freshday.ru/image/cache/catalog/raznye-vidy-italyanskoy-pasty-1152x768.webp")
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildCategoryCard(String title, int places, String imageUrl) {
  //   return Card(
  //     margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  //     child: SizedBox(
  //       width: 150,
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           ClipRRect(
  //             borderRadius:
  //                 const BorderRadius.only(topLeft: Radius.circular(14), topRight: Radius.circular(14)),
  //             child: Image.network(
  //               imageUrl,
  //               height: 120,
  //               width: double.infinity,
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //           const SizedBox(height: 10),
  //           Padding(
  //             padding: const EdgeInsets.all(10),
  //             child: Column(
  //               children: [
  //                 Text(
  //                   title,
  //                   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //                 ),
  //                 const SizedBox(height: 5),
  //                 Text('$places places'),
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildRestaurantCard() {
  //   return Card(
  //     margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         ClipRRect(
  //           borderRadius: const BorderRadius.only(
  //             topLeft: Radius.circular(14),
  //             topRight: Radius.circular(14),
  //           ),
  //           child: Image.network(
  //             'https://freshday.ru/image/cache/catalog/raznye-vidy-italyanskoy-pasty-1152x768.webp',
  //             height: 150,
  //             width: double.infinity,
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //         const Padding(
  //           padding: EdgeInsets.all(10),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 'Tasty bowl',
  //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //               ),
  //               SizedBox(height: 5),
  //               Text(
  //                 'Choose from a variety of bowl options and tas...',
  //                 overflow: TextOverflow.ellipsis,
  //               ),
  //               SizedBox(height: 5),
  //               Row(
  //                 children: [
  //                   Text('€1.00', style: TextStyle(color: Colors.orange)),
  //                   SizedBox(width: 10),
  //                   Icon(Icons.access_time, size: 16),
  //                   Text('40-50min'),
  //                   SizedBox(width: 10),
  //                   Icon(Icons.star, size: 16, color: Colors.orange),
  //                   Text('9.2'),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
