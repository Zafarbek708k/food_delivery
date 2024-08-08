import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/feature/profile/pages/profile_page.dart";
import "package:food_delivery/src/feature/restaurant/page/restaraunt_page.dart";
import "package:food_delivery/src/feature/search/pages/search_page.dart";
import "../widgets/bottom_nav_bar_widget.dart";
import "discovery_page.dart";

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController controller = PageController();
  int currentPage = 0;
  List<Widget> pages = [
    const DiscoveryPage(),
    const RestaurantsPage(),
    SearchPage(),
    const Center(child: Text("Oybek", style: TextStyle(color: Colors.black))),
    const ProfilePage()
  ];

  @override
  void initState() {
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              children: pages,
            ),
            Positioned(
              bottom: 16.h, // Set bottom to 0 to remove extra space
              left: 0,
              right: 0,
              child: BottomNavBarWidget(
                currentPage: currentPage,
                onTap: onPageChanged,
              ),
            ),
          ],
        ),
      );
}

/// child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: SizedBox(
//               height: 60.h, // Ensure the height is not too large
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(18),
//                 child: BottomNavigationBar(
//                   currentIndex: currentPage,
//                   onTap: onPageChanged,
//                   showSelectedLabels: true,
//                   showUnselectedLabels: false,
//                   selectedItemColor: Colors.orange,
//                   unselectedItemColor: Colors.black,
//                   items: [
//                     BottomNavigationBarItem(
//                       icon: NavBarIcon(
//                         assetName: "assets/icons/discover_compass_icon.svg",
//                         isSelected: currentPage == 0,
//                       ),
//                       label: "Discovery",
//                     ),
//                     BottomNavigationBarItem(
//                       icon: NavBarIcon(
//                         assetName: "assets/icons/home_restaurant_icon.svg",
//                         isSelected: currentPage == 1,
//                       ),
//                       label: "Restaurants",
//                     ),
//                     BottomNavigationBarItem(
//                       icon: NavBarIcon(
//                         assetName: "assets/icons/search_icon.svg",
//                         isSelected: currentPage == 2,
//                       ),
//                       label: "Search",
//                     ),
//                     BottomNavigationBarItem(
//                       icon: NavBarIcon(
//                         assetName: "assets/icons/favorite_icon.svg",
//                         isSelected: currentPage == 3,
//                       ),
//                       label: "Favorite",
//                     ),
//                     BottomNavigationBarItem(
//                       icon: NavBarIcon(
//                         assetName: "assets/icons/profile_icon.svg",
//                         isSelected: currentPage == 4,
//                       ),
//                       label: "Profile",
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
