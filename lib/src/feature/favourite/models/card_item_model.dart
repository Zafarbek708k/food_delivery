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