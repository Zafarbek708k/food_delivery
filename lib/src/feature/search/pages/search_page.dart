import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery/src/feature/search/widgets/search_text_fild_custom.dart';

class SearchPage extends StatelessWidget {
  final List<String> tags = [
    'burger',
    'vegetarian',
    'healthy',
    'wrap',
    'fast food',
    'salad',
    'snack',
    'sandwich',
    'sushi',
    'desserts',
    'thai',
    'lunch',
    'pizza',
    'kebab',
    'breakfast',
    'wings',
  ];

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search bar
                const SearchTextfildCustom(),
                const SizedBox(height: 16.0),
                // Tags/Buttons
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: tags
                      .map(
                        (tag) => GestureDetector(
                          onTap: () {
                            log("On tap");
                          },
                          child: Chip(
                            label: Text(tag),
                            backgroundColor: Colors.orange,
                            labelStyle: const TextStyle(color: Colors.white),
                            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                            side: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
