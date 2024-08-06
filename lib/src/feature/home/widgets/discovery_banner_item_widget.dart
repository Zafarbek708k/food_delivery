import 'package:flutter/material.dart';

class DiscoveryBannerItemWidget extends StatelessWidget {
  const DiscoveryBannerItemWidget({super.key, required this.imageUrl, required this.bannerText});
  final String imageUrl;
  final String bannerText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                bannerText,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                // primary: Colors.black, // Button background color
                  backgroundColor: Colors.black),
              onPressed: () {
                // Handle order now action
              },
              child: const Text(
                "Order Now",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );;
  }
}