import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.5), // Add black border
          borderRadius: BorderRadius.circular(20.0),
        ),
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
              items: [
                BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/discover_compass_icon.svg"), label: "Discovery"),
                BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/home_restaurant_icon.svg"), label: "Restaurant"),
                BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/search_icon.svg"), label: "Search"),
                BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/favorite_icon.svg"), label: "Favorite"),
                BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/profile_icon.svg"), label: "Profile"),
                // BottomNavigationBarItem(icon: Icon(Icons.compass_calibration_outlined), label: "Discovery"),
                // const BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Restaurants"),
                // const BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
                // const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
                // const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
