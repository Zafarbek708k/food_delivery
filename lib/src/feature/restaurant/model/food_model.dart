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
    this.addOns = const [],
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
    required this.quantity,
  });

  CartItem copyWith({List<AddOn>? selectedAddOns, int? quantity}) => CartItem(
        foodItem: foodItem,
        selectedAddOns: selectedAddOns ?? this.selectedAddOns,
        quantity: quantity ?? this.quantity,
      );

  double calculateTotalPrice() {
    final double addOnsPrice = selectedAddOns.fold(
      0,
      (sum, addOn) => sum + addOn.price,
    );
    return (foodItem.price + addOnsPrice) * quantity;
  }
}

List<FoodItem> foodsList = [
  FoodItem(
    name: "Toy oshi",
    category: "Osh",
    imageUrl:
        "https://darsik.com/wp-content/uploads/2023/05/untitled-1-8-3.jpg",
    description: "Delicious spaghetti with marinara sauce",
    price: 12000,
    addOns: [
      AddOn(name: "Non", price: 6000),
      AddOn(name: "choy", price: 3000),
    ],
  ),
  FoodItem(
    name: "choyona oshi",
    category: "Osh",
    imageUrl:
        "https://darsik.com/wp-content/uploads/2023/05/untitled-1-7-5.jpg",
    description: "Classic beef lasagna",
    price: 15000,
    addOns: [
      AddOn(name: "garimdori", price: 1000),
      AddOn(name: "salat", price: 5000),
    ],
  ),
  FoodItem(
    name: "olivye",
    category: "Salad",
    imageUrl:
        "https://1-dream.ru/wp-content/uploads/2018/10/olivie-kassika8.jpg",
    description: "Delicious spaghetti with marinara sauce",
    price: 20000,
    addOns: [
      AddOn(name: "Mayonez", price: 2000),
      AddOn(name: "qoshiq", price: 1000),
    ],
  ),
  FoodItem(
    name: "tsezar",
    category: "Salad",
    imageUrl:
        "https://donatello23.ru/image/cache/catalog/Salaty/%20%D0%A6%D0%B5%D0%B7%D0%B0%D1%80%D1%8C%20%D1%81%20%D0%BA%D1%80%D0%B5%D0%B2%D0%B5%D1%82%D0%BA%D0%B0%D0%BC%D0%B8-800x800.jpg",
    description: "Classic beef lasagna",
    price: 18000,
    addOns: [
      AddOn(name: "ketchup", price: 1.99),
      AddOn(name: "Salad", price: 3.99),
    ],
  ),
  FoodItem(
    name: "fanta",
    category: "Drink",
    imageUrl:
        "https://st2.depositphotos.com/1050070/12134/i/450/depositphotos_121349842-stock-photo-fanta-orange-on-white-background.jpg",
    description: "Classic beef lasagna",
    price: 8000,
    addOns: [
      AddOn(name: "stakan", price: 1000),
      AddOn(name: "trubochka", price: 300),
    ],
  ),
  FoodItem(
    name: "Cola",
    category: "Drink",
    imageUrl:
        "https://st3.depositphotos.com/1029150/13893/i/450/depositphotos_138934162-stock-photo-1-5l-coca-cola-drink.jpg",
    description: "Refreshing Coca-Cola",
    price: 9000,
    addOns: [],
  ),
];
