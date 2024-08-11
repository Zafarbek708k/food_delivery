import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../../model/food_model.dart";
import "../../view_model/restaurant_detail_vm.dart";

class FoodDetailsPage extends ConsumerStatefulWidget {
  final FoodItem foodItem;

  const FoodDetailsPage({required this.foodItem, super.key});

  @override
  FoodDetailsPageState createState() => FoodDetailsPageState();
}

class FoodDetailsPageState extends ConsumerState<FoodDetailsPage> {
  List<AddOn> selectedAddOns = [];

  @override
  void initState() {
    super.initState();
    selectedAddOns = widget.foodItem.addOns;
  }

  @override
  Widget build(BuildContext context) {
    final cartNotifier = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.foodItem.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.foodItem.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              widget.foodItem.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.foodItem.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              "Select Add-Ons",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...widget.foodItem.addOns.map(
              (addOn) => CheckboxListTile(
                title:
                    Text("${addOn.name} (+€${addOn.price.toStringAsFixed(2)})"),
                value: selectedAddOns.contains(addOn),
                onChanged: (isChecked) {
                  setState(() {
                    if (isChecked ?? false) {
                      selectedAddOns.add(addOn);
                    } else {
                      selectedAddOns.remove(addOn);
                    }
                  });
                },
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                cartNotifier
                    .addItem(widget.foodItem.copyWith(addOns: selectedAddOns));
                Navigator.pop(context);
              },
              child: const Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
