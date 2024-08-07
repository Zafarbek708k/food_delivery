import 'package:flutter/material.dart';
import 'package:food_delivery/src/feature/restaurant/widgets/category_card_widget.dart';
import 'package:food_delivery/src/feature/restaurant/widgets/restaraunt_card_widget.dart';

class RestaurantsPage extends StatefulWidget {
  const RestaurantsPage({super.key});

  @override
  RestaurantsPageState createState() => RestaurantsPageState();
}

class RestaurantsPageState extends State<RestaurantsPage> {
  bool showAllCategories = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        centerTitle: true,
        title: const Text(
          "Xurshid Umarov",
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.sort),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Restaurants',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Categories',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            showAllCategories = !showAllCategories;
                          });
                        },
                        child: Text(showAllCategories ? 'Show less' : 'See all'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  showAllCategories ? _buildAllCategories() : _buildHorizontalCategories(),
                  const SizedBox(height: 20),
                  const Text(
                    'All restaurants',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
  }

  Widget _buildHorizontalCategories() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryCard(
              title: "title",
              places: 15,
              imageUrl: "https://media.express24.uz/r/:w/:h/USkw4zygayqAjhGTgd5qZ.jpg")
        ],
      ),
    );
  }

  Widget _buildAllCategories() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryCard(
              title: "Foot",
              places: 25,
              imageUrl: "https://media.express24.uz/r/:w/:h/USkw4zygayqAjhGTgd5qZ.jpg")
        ],
      ),
    );
  }

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
  //             'https://media.express24.uz/r/:w/:h/USkw4zygayqAjhGTgd5qZ.jpg',
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
