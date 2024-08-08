import 'package:flutter/material.dart';
import 'package:food_delivery/src/feature/home/pages/discovery_page.dart';
import 'package:food_delivery/src/feature/profile/pages/profile_page.dart';
import 'package:food_delivery/src/feature/restaurant/page/restaraunt_page.dart';
import 'package:food_delivery/src/feature/search/pages/search_page.dart';
import '../widgets/bottom_nav_bar_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController controller = PageController();
  int currentPage = 0;
  List<Widget> pages =  [
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
  Widget build(BuildContext context) {
    return Scaffold(
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
            bottom: 0,
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
}
