import 'package:flutter/material.dart';

class DeliveryCardWidget extends StatelessWidget {
  const DeliveryCardWidget({super.key, required this.imageUrl, required this.title, required this.price, required this.time, required this.rating});

  final String imageUrl;
  final String title;
  final String price;
  final String time;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
                child: Image.network(
                  imageUrl,
                  height: 150.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text("$price  •  $time"),
                    Text("⭐ $rating"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}