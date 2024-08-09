import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

class FavoriteRestaurantsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: ListView(
        children: [
          CupertinoButton(
            padding: REdgeInsets.all(0),
            onPressed: (){},
            child: const FoodItemCard(
              imageUrl: "https://ecommercephotographyindia.com/assets/img/gallery/burger-photography.jpg",
              title: "GOAT burger",
              description: "The best burgers in town",
              restaurant: "Goat",
              price: "98",
              time: "20-50min",
              rating: "6.7",
            ),
          ),
          const SizedBox(height: 16),
          CupertinoButton(
            padding: REdgeInsets.all(0),
            onPressed: (){},
            child: const FoodItemCard(
              imageUrl: "https://ecommercephotographyindia.com/assets/img/gallery/burger-photography.jpg",
              title: "Cristiano burger",
              description: "Big fan of CR7? ",
              restaurant: "CR7 burgers",
              price: "59.99",
              time: "20-50min",
              rating: "8.7",
            ),
          ),
        ],
      ),
    ),
  );
}

class FoodItemCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String restaurant;
  final String price;
  final String time;
  final String rating;

  const FoodItemCard({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.restaurant,
    required this.price,
    required this.time,
    required this.rating,
  });

  @override
  _FoodItemCardState createState() => _FoodItemCardState();
}

class _FoodItemCardState extends State<FoodItemCard> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) => Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 5,
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  widget.imageUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _isFavorited = !_isFavorited;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.favorite,
                      color: _isFavorited ? Colors.red : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            widget.description,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                const Icon(Icons.restaurant, size: 16, color: Colors.orange),
                const SizedBox(width: 5),
                Text(widget.restaurant, style: const TextStyle(fontSize: 14)),
                const Spacer(),
                const Icon(Icons.euro, size: 16, color: Colors.orange),
                SizedBox(width: 5.w),
                Text(widget.price, style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
          Row(
            children: [
              const Icon(Icons.timer, size: 16, color: Colors.orange),
              SizedBox(width: 5.w),
              Text(widget.time, style: const TextStyle(fontSize: 14)),
              const Spacer(),
              const Icon(Icons.star, size: 16, color: Colors.orange),
              const SizedBox(width: 5),
              Text(widget.rating, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ],
      ),
    ),
  );
}
