import 'package:flutter/material.dart';
import 'package:food_delivery/src/feature/home/pages/discovery_page.dart';
import '../widgets/bottom_nav_bar_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController controller = PageController();
  int currentPage = 0;
  List<Widget> pages = const [
    DiscoveryPage(),
    Center(child: Text("Page 2", style: TextStyle(color: Colors.black))),
    Center(child: Text("Page 3", style: TextStyle(color: Colors.black))),
    Center(child: Text("Page 4", style: TextStyle(color: Colors.black)))
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
      appBar: AppBar(),
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


