import "package:flutter/material.dart";

class HorizontalCategories extends StatelessWidget {
  const HorizontalCategories({super.key});

  @override
  Widget build(BuildContext context) => const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CategoryCard(
              title: "title",
              places: 15,
              imageUrl: "https://freshday.ru/image/cache/catalog/raznye-vidy-italyanskoy-pasty-1152x768.webp",
            ),
            CategoryCard(
              title: "title",
              places: 15,
              imageUrl: "https://freshday.ru/image/cache/catalog/raznye-vidy-italyanskoy-pasty-1152x768.webp",
            ),
            CategoryCard(
              title: "title",
              places: 15,
              imageUrl: "https://freshday.ru/image/cache/catalog/raznye-vidy-italyanskoy-pasty-1152x768.webp",
            ),
            CategoryCard(
              title: "title",
              places: 15,
              imageUrl: "https://freshday.ru/image/cache/catalog/raznye-vidy-italyanskoy-pasty-1152x768.webp",
            ),
            CategoryCard(
              title: "title",
              places: 15,
              imageUrl: "https://freshday.ru/image/cache/catalog/raznye-vidy-italyanskoy-pasty-1152x768.webp",
            ),
          ],
        ),
      );
}

class CategoryCard extends StatelessWidget {
  final String title;
  final int places;
  final String imageUrl;

  const CategoryCard({
    required this.title,
    required this.places,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Image.network(imageUrl, width: 100, height: 100, fit: BoxFit.cover),
            Text(title),
            Text("$places places"),
          ],
        ),
      );
}
