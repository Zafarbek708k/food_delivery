import 'dart:developer';

import 'package:flutter/material.dart';

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
    'desserts',
    'greek',
    'italian',
    'asian',
    'japanese',
    'vietnamese',
    'chinese',
    'french',
    'african',
    'indian',
    'thai',
  ];

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Tag UI Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              
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
    );
  }
}
