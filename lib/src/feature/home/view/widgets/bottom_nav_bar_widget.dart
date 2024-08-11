import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/core/widgets/blur_widget.dart";
import "bottom_nav_bar_item_widget.dart";

class BottomNavBarWidget extends StatelessWidget {
  final int currentPage;
  final Function(int) onTap;

  const BottomNavBarWidget({required this.currentPage, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: REdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          margin: REdgeInsets.all(0.0001),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0.5),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: BlurWidget(
            radius: 10.r,
            blur: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: BottomNavigationBar(
                currentIndex: currentPage,
                onTap: onTap,
                showSelectedLabels: true,
                showUnselectedLabels: false,
                selectedItemColor: Colors.orange,
                unselectedItemColor: Colors.black,
                backgroundColor: Colors.white.withOpacity(0.5),
                type: BottomNavigationBarType.fixed,
                landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
                selectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                items: [
                  BottomNavigationBarItem(
                    icon: Center(
                      child: NavBarIcon(
                        assetName: "assets/icons/discover_compass_icon.svg",
                        isSelected: currentPage == 0,
                      ),
                    ),
                    label: "Discovery",
                  ),
                  BottomNavigationBarItem(
                    icon: Center(
                      child: NavBarIcon(
                        assetName: "assets/icons/home_restaurant_icon.svg",
                        isSelected: currentPage == 1,
                      ),
                    ),
                    label: "Restaurants",
                  ),
                  BottomNavigationBarItem(
                    icon: Center(
                      child: NavBarIcon(
                        assetName: "assets/icons/search_icon.svg",
                        isSelected: currentPage == 2,
                      ),
                    ),
                    label: "Search",
                  ),
                  BottomNavigationBarItem(
                    icon: Center(
                      child: NavBarIcon(
                        assetName: "assets/icons/favorite_icon.svg",
                        isSelected: currentPage == 3,
                      ),
                    ),
                    label: "Favorite",
                  ),
                  BottomNavigationBarItem(
                    icon: Center(
                      child: NavBarIcon(
                        assetName: "assets/icons/profile_icon.svg",
                        isSelected: currentPage == 4,
                      ),
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
