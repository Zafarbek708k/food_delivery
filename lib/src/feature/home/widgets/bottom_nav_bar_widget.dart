import 'package:flutter/material.dart';

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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: onTap,
          selectedIconTheme: const IconThemeData(color: Colors.black),
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          backgroundColor: Colors.grey.shade700,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "notification"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
          ],
        ),
      ),
    );
  }
}