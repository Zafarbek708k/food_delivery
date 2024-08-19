
class CardItem {
  bool isFavorited;
  String imageUrl;
  String title;
  String description;
  String restaurant;
  String price;
  String time;
  String rating;

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

  factory CardItem.fromJson(Map<String, dynamic> json) => CardItem(
      isFavorited: json["isFavorited"] ?? false,
      imageUrl: json["imageUrl"],
      title: json["title"],
      description: json["description"],
      restaurant: json["restaurant"],
      price: json["price"],
      time: json["time"],
      rating: json["rating"],
    );
}
