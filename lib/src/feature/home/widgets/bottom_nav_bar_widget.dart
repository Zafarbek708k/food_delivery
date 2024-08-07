import 'package:flutter/material.dart';
import 'package:food_delivery/src/core/widgets/blur_widget.dart';

class BottomNavBarWidget extends StatelessWidget {
  final int currentPage;
  final Function(int) onTap;

  const BottomNavBarWidget({
    super.key,
    required this.currentPage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      child: BlurWidget(
        radius: 20,
        blur: 5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: BottomNavigationBar(
            currentIndex: currentPage,
            onTap: onTap,
            showSelectedLabels: true, // Show labels for selected items
            showUnselectedLabels: false, // Hide labels for unselected items
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.black,
            selectedIconTheme: const IconThemeData(color: Colors.orange),
            unselectedIconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.white.withOpacity(0.1),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.compass_calibration_outlined ), label: "Discovery"),
              BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Restaurants"),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}
