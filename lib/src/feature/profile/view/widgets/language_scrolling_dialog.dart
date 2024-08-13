import 'package:flutter/material.dart';

class LanguageSelectorDialog extends StatelessWidget {
  final ScrollController _scrollController = FixedExtentScrollController();
  final double _itemHeight = 60.0;

  final List<Map<String, String>> languages = [
    {'name': 'Русский', 'flag': 'assets/flags/russia.png'},
    {'name': 'English', 'flag': 'assets/flags/uk.png'},
    {'name': 'O\'zbek', 'flag': 'assets/flags/uzbekistan.png'},
    {'name': 'العربية', 'flag': 'assets/flags/arab.png'},
    {'name': '日本語', 'flag': 'assets/flags/japan.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                height: 250,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListWheelScrollView(
                  controller: _scrollController,
                  itemExtent: _itemHeight,
                  physics: const FixedExtentScrollPhysics(),
                  overAndUnderCenterOpacity: 0.5,
                  perspective: 0.002,
                  onSelectedItemChanged: (index) {
                    print("Selected language index: $index");
                    // Implement language change logic here based on index
                  },
                  children: languages.map((language) {
                    return GestureDetector(
                      onTap: () {
                        print("Tapped on: ${language['name']}");
                        // Implement language change logic here
                      },
                      child: ListTile(
                        leading: Image.asset(language['flag']!),
                        title: Text(language['name']!),
                      ),
                    );
                  }).toList(),
                ),
              ),
            );
          },
        );
      },
      child: const Text('Select Language'),
    );
  }
}
