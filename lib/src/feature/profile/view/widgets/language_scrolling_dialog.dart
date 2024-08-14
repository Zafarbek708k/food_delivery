import "package:flutter/material.dart";
import "package:food_delivery/src/core/style/app_colors.dart";

class LanguageSelectorDialog extends StatelessWidget {
  final ScrollController _scrollController = FixedExtentScrollController();
  final double _itemHeight = 60;

  final List<Map<String, String>> languages = [
    {"name": "Русский", "flag": "🇷🇺"},
    {"name": "English", "flag": "🇬🇧"},
    {"name": "O'zbek", "flag": "🇺🇿"},
    {"name": "العربية", "flag": "🇸🇦"},
    {"name": "日本語", "flag": "🇯🇵"},
  ];

  @override
  Widget build(BuildContext context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: 250,
          width: 200,
          decoration: BoxDecoration(
            color: AppColors.lFFE7CC,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListWheelScrollView(
            controller: _scrollController,
            itemExtent: _itemHeight,
            physics: const FixedExtentScrollPhysics(),
            overAndUnderCenterOpacity: 0.5,
            perspective: 0.002,
            onSelectedItemChanged: (index) {
              // O'ZGARGANDA YOZILADI LOGIKA
            },
            children: languages
                .map(
                  (language) => GestureDetector(
                    onTap: () {
                      // Bu erda tilni o'zgartirish logikasi
                    },
                    child: ListTile(
                      leading: Text(language["flag"]!, style: const TextStyle(fontSize: 24)),
                      title: Text(language["name"]!),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      );
}
