import "dart:developer";
import "package:flutter/material.dart";
import "package:food_delivery/src/core/style/app_colors.dart";

class SearchTextfildCustom extends StatelessWidget {
  final TextEditingController controller;

  const SearchTextfildCustom({required this.controller, super.key});

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        onChanged: (value) {
          log("Search value: $value");
        },
        cursorColor: AppColors.l767989, // Kursorning rangi
        style: const TextStyle(color: AppColors.l767989), // Kiritilgan text rangi
        decoration: InputDecoration(
          fillColor: AppColors.lEDEDEF,
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.l767989, // Icon rangini berish
          ),
          hintText: "Search",
          hintStyle: const TextStyle(color: AppColors.l767989), // Hint rangini berish
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      );
}
