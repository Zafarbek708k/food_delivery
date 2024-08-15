import "package:flutter/material.dart";
import "package:food_delivery/src/core/style/app_colors.dart";
import "package:food_delivery/src/core/style/text_style.dart";

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
          height: 300,
          width: 200,
          decoration: BoxDecoration(
            color: AppColors.lFFE7CC,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: Text("Select Language",
                  style: const AppTextStyle().headlineSmall,),
              ),

              Expanded( // Expanded bilan ListWheelScrollViewni moslashtiramiz
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
                        leading: Text(
                          language["flag"]!,
                          style: const TextStyle(fontSize: 24),
                        ),
                        title: Text(language["name"]!),
                      ),
                    ),
                  )
                      .toList(),
                ),
              ),
              Row(
                children: [
                  const Spacer(),
                  TextButton(
                    child:  Text("Cancel",
                    style: const AppTextStyle().bodyLarge,),
                    onPressed: () {
                      Navigator.of(context).pop(); // Dialogni yopish
                    },
                  ),
                  const Spacer(),
                  TextButton(
                    child:  Text("OK",
                      style: const AppTextStyle().bodyLarge,),
                    onPressed: () {
                                     // Bu erda OK tugmasi logikasi
                      Navigator.of(context).pop();
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      );
}
