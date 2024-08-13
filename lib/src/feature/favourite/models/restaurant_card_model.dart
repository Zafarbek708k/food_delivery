class RestaurantItem {
  bool isFavorited;
  final String imageUrl;
  final String title;
  final String description;
  final String time;
  final String rating;

  RestaurantItem({
    required this.isFavorited,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.time,
    required this.rating,
  });
}
