import "package:dio/dio.dart";
import "package:food_delivery/src/feature/favourite/models/restaurant_card_model.dart";

class RestaurantService {
  final Dio _dio = Dio();
  Future<CardItem>deleteItem()async{
    try {
      final response = await _dio.delete("http://45.138.158.240:8080/swagger-ui/index.html");

      if (response.statusCode == 200) {
        return CardItem.fromJson(response.data);
      } else {
        throw Exception("Failed to delete item");
      }
    } catch (e) {
      throw Exception("Failed to delete item: $e");
    }
  }

  Future<List<CardItem>> fetchFavoriteRestaurants() async {
    try {
      final response = await _dio.get("http://45.138.158.240:8080/swagger-ui/index.html");

      if (response.statusCode == 200) {
        final items = (response.data as List)
            .map((item) => CardItem.fromJson(item))
            .toList();
        return items;
      } else {
        throw Exception("Failed to load favorite restaurants");
      }
    } catch (e) {
      throw Exception('Failed to load favorite restaurants: $e');
    }
  }
}
