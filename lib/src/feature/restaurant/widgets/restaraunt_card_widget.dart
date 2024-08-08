import "package:flutter/material.dart";

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key});

  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tasty bowl",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Choose from a variety of bowl options and tas...",
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text("€1.00", style: TextStyle(color: Colors.orange)),
                      SizedBox(width: 10),
                      Icon(Icons.access_time, size: 16),
                      Text("40-50min"),
                      SizedBox(width: 10),
                      Icon(Icons.star, size: 16, color: Colors.orange),
                      Text("9.2"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
