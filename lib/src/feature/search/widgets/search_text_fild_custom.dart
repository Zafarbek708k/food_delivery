import 'dart:developer';
import 'package:flutter/material.dart';

class SearchTextfildCustom extends StatelessWidget {
  const SearchTextfildCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        log("Search value: $value");
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search), // icon
        hintText: 'Search', // rang berish kk
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
      ),
    );
  }
}
