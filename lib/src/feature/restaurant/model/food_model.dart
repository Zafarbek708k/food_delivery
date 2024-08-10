class AddOn {
  final String name;
  final double price;

  AddOn({required this.name, required this.price});
}

class FoodItem {
  final String name;
  final String category;
  final String imageUrl;
  final String description;
  final double price;
  final List<AddOn> addOns;

  FoodItem({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.addOns,
  });

  FoodItem copyWith({
    String? name,
    String? category,
    String? imageUrl,
    String? description,
    double? price,
    List<AddOn>? addOns,
  }) =>
      FoodItem(
        name: name ?? this.name,
        category: category ?? this.category,
        imageUrl: imageUrl ?? this.imageUrl,
        description: description ?? this.description,
        price: price ?? this.price,
        addOns: addOns ?? this.addOns,
      );
}

class CartItem {
  final FoodItem foodItem;
  final List<AddOn> selectedAddOns;
  final int quantity;

  CartItem({
    required this.foodItem,
    required this.selectedAddOns,
    this.quantity = 1,
  });

  double calculateTotalPrice() {
    double addOnPrice =
        selectedAddOns.fold(0, (sum, addOn) => sum + addOn.price);
    return (foodItem.price + addOnPrice) * quantity;
  }

  CartItem copyWith({
    FoodItem? foodItem,
    List<AddOn>? selectedAddOns,
    int? quantity,
  }) =>
      CartItem(
        foodItem: foodItem ?? this.foodItem,
        selectedAddOns: selectedAddOns ?? this.selectedAddOns,
        quantity: quantity ?? this.quantity,
      );
}
