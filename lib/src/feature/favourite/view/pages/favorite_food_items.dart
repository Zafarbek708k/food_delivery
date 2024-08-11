import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class FoodItemsPage extends StatefulWidget {
  @override
  _FoodItemsPageState createState() => _FoodItemsPageState();
}

class _FoodItemsPageState extends State<FoodItemsPage> {
  List<CardItem> items = [
    CardItem(
      isFavorited: true,
      imageUrl: "https://ecommercephotographyindia.com/assets/img/gallery/burger-photography.jpg",
      title: "Cheeseburger",
      description: "Classic cheeseburger",
      restaurant: "Burger King",
      price: "180",
      time: "20-50min",
      rating: "9.7",
    ),
    CardItem(
      isFavorited: true,
      imageUrl:
          "https://res.cloudinary.com/hksqkdlah/image/upload/SFS_south_carolina_shrimp_burger_016_wqvsr6.jpg",
      title: "Shrimp burger",
      description: "Something special from sea",
      restaurant: "Ocean Lovers",
      price: "56",
      time: "20-50min",
      rating: "8.7",
    ),
  ];

  void _updateFavoriteStatus(int index, bool isFavorited) {
    setState(() {
      items[index].isFavorited = isFavorited;
      if (!isFavorited) {
        items.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CupertinoButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                child: FoodItemCard(
                  cardItem: items[index],
                  onFavoriteToggle: (isFavorited) => _updateFavoriteStatus(index, isFavorited),
                ),
              ),
            ),
          ),
        ),
      );
}

class FoodItemCard extends StatelessWidget {
  final CardItem cardItem;
  final ValueChanged<bool> onFavoriteToggle;

  const FoodItemCard({
    required this.cardItem,
    required this.onFavoriteToggle,
  });

  void _toggleFavorite() {
    onFavoriteToggle(!cardItem.isFavorited);
  }

  @override
  Widget build(BuildContext context) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    cardItem.imageUrl,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: InkWell(
                    onTap: _toggleFavorite,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.favorite,
                        color: cardItem.isFavorited ? Colors.red : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Column(
                children: [
                  SizedBox(height: 10.h,),
                  Text(
                    cardItem.title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.h,),
                  Text(
                    cardItem.description,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      const Icon(Icons.restaurant, size: 16, color: Colors.orange),
                      const SizedBox(width: 5),
                      Text(cardItem.restaurant, style: const TextStyle(fontSize: 14)),
                      const Spacer(),
                      const Icon(Icons.euro, size: 16, color: Colors.orange),
                      const SizedBox(width: 5),
                      Text(cardItem.price, style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      const Icon(Icons.timer, size: 16, color: Colors.orange),
                      const SizedBox(width: 5),
                      Text(cardItem.time, style: const TextStyle(fontSize: 14)),
                      const Spacer(),
                      const Icon(Icons.star, size: 16, color: Colors.orange),
                      const SizedBox(width: 5),
                      Text(cardItem.rating, style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class CardItem {
  bool isFavorited;
  final String imageUrl;
  final String title;
  final String description;
  final String restaurant;
  final String price;
  final String time;
  final String rating;

  CardItem({
    required this.isFavorited,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.restaurant,
    required this.price,
    required this.time,
    required this.rating,
  });
}
