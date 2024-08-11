import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:food_delivery/src/feature/search/view_model/search_vm.dart";

import "../widgets/search_text_fild_custom.dart";

class SearchPage extends ConsumerWidget {
  final List<String> tags = [
    "burger",
    "vegetarian",
    "healthy",
    "wrap",
    "fast food",
    "salad",
    "snack",
    "sandwich",
    "sushi",
    "desserts",
    "thai",
    "lunch",
    "pizza",
    "kebab",
  ];

  SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search bar
                  SearchTextfildCustom(controller: ref.read(searchVM).searchController),
                  const SizedBox(height: 16),
                  // Tags/Buttons
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 5,
                    runSpacing: 5,
                    children: tags
                        .map(
                          (tag) => CupertinoButton(
                            padding: EdgeInsets.zero,
                            // onTap: () {
                            //   log("Tapped: $tag");
                            //   ref.read(searchVM).searchController.text = tag;
                            // },
                            onPressed: () {
                              ref.read(searchVM).searchController.text = tag;
                            },
                            child: Chip(
                              label: Text(tag),
                              backgroundColor: Colors.orange,
                              labelStyle: const TextStyle(color: Colors.white),
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
