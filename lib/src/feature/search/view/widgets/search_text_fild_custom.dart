import "dart:developer";
import "package:flutter/material.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";
import "package:food_delivery/src/core/style/app_colors.dart";

class SearchTextfildCustom extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode; 

  const SearchTextfildCustom({
    required this.controller,
    required this.focusNode,
    super.key,
  });

  @override
  Widget build(BuildContext context) => TextField(
        focusNode: focusNode,
        controller: controller,
        onChanged: (value) {
          log("Search value: $value");
        },
        cursorColor: AppColors.l767989, 
        style: const TextStyle(color: AppColors.l767989), 
        decoration: InputDecoration(
          fillColor: AppColors.lEDEDEF,
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.l767989,
          ),
          hintText: context.localized.search,
          hintStyle: const TextStyle(color: AppColors.l767989), 
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      );
}
