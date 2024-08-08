import 'package:flutter/material.dart';
import 'package:food_delivery/src/core/widgets/blur_widget.dart';
import 'bottom_nav_bar_item_widget.dart';

class BottomNavBarWidget extends StatelessWidget {
  final int currentPage;
  final Function(int) onTap;

  const BottomNavBarWidget({
    super.key,
    required this.currentPage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Padding(
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
                BottomNavigationBarItem(
                  icon: NavBarIcon(
                    assetName: "assets/icons/discover_compass_icon.svg",
                    isSelected: currentPage == 0,
                  ),
                  label: "Discovery",
                ),
                BottomNavigationBarItem(
                  icon: NavBarIcon(
                    assetName: "assets/icons/home_restaurant_icon.svg",
                    isSelected: currentPage == 1,
                  ),
                  label: "Restaurants",
                ),
                BottomNavigationBarItem(
                  icon: NavBarIcon(
                    assetName: "assets/icons/search_icon.svg",
                    isSelected: currentPage == 2,
                  ),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                  icon: NavBarIcon(
                    assetName: "assets/icons/favorite_icon.svg",
                    isSelected: currentPage == 3,
                  ),
                  label: "Favorite",
                ),
                BottomNavigationBarItem(
                  icon: NavBarIcon(
                    assetName: "assets/icons/profile_icon.svg",
                    isSelected: currentPage == 4,
                  ),
                  label: "Profile",
                ),
              ],
            ),
          ),
        ),
      ),
    );
}

