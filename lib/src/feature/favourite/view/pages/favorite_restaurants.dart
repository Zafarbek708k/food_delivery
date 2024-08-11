import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class FavoriteRestaurantsPage extends StatefulWidget {
  @override
  _FavoriteRestaurantsPageState createState() => _FavoriteRestaurantsPageState();
}

class _FavoriteRestaurantsPageState extends State<FavoriteRestaurantsPage> {
  List<CardItem> items = [
    CardItem(
      isFavorited: true,
      imageUrl: "https://www.grozny-inform.ru/LoadedImages/2022/05/11/840px-McDonalds-exterior_2_w900_h600.jpg",
      title: "McDonald's",
      description: "Classic fast food restaurant",
      time: "20-50min",
      rating: "7.7",
    ),
    CardItem(
      isFavorited: true,
      imageUrl: "https://media.wired.com/photos/65e71a8e4f6303aec3b5018d/1:1/w_2667,h_2667,c_limit/gettyimages-921740490.jpg",
      title: "KFC",
      description: "Special Kentucky fried chicken",
      time: "20-50min",
      rating: "9.8",
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
            onPressed: (){},
            padding: REdgeInsets.all(0),
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
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(
                cardItem.title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              cardItem.description,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 20.h,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                children: [
                  const Icon(Icons.star, size: 16, color: Colors.orange),
                  const SizedBox(width: 5),
                  Text(cardItem.rating, style: const TextStyle(fontSize: 14)),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(Icons.timer, size: 16, color: Colors.orange),
                      const SizedBox(width: 5),
                      Text(cardItem.time, style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),
          ],
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
  final String time;
  final String rating;

  CardItem({
    required this.isFavorited,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.time,
    required this.rating,
  });
}
