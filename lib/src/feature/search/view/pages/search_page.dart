import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:food_delivery/src/feature/search/view_model/search_vm.dart";
import "../widgets/search_text_fild_custom.dart";

class SearchPage extends ConsumerStatefulWidget {
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
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus(); // Sahifa ochilganda TextField ga fokusni beradi
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search bar
                  SearchTextfildCustom(
                    controller: ref.read(searchVM).searchController,
                    focusNode: _focusNode, // FocusNode ni berish
                  ),
                  const SizedBox(height: 16),
                  // Tags/Buttons
                  Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    spacing: 5,
                    runSpacing: 5,
                    children: widget.tags
                        .map(
                          (tag) => CupertinoButton(
                            padding: EdgeInsets.zero,
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
