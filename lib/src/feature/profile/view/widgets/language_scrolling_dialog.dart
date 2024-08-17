import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";
import "package:food_delivery/src/core/style/app_colors.dart";
import "package:food_delivery/src/core/style/text_style.dart";
import "package:food_delivery/src/feature/settings/inherited_locale_notifier.dart";

import "../../../settings/locale_controller.dart";

@immutable
// ignore: must_be_immutable
class LanguageSelectorDialog extends StatelessWidget {
  final ScrollController _scrollController = FixedExtentScrollController();
  final double _itemHeight = 60;
  int selectedLanguageIndex = 0;

  final List<Map<String, dynamic>> languages = [
    {"name": "Русский", "flag": "🇷🇺", "code": LangCodes.ru},
    {"name": "English", "flag": "🇬🇧", "code": LangCodes.en},
    {"name": "O'zbek", "flag": "🇺🇿", "code": LangCodes.uz},
    {"name": "العربية", "flag": "🇸🇦", "code": LangCodes.ar},
    {"name": "日本語", "flag": "🇯🇵", "code": LangCodes.ja},
  ];

  @override
  Widget build(BuildContext context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: 300.h,
          width: 200.w,
          decoration: BoxDecoration(
            color: AppColors.lFFE7CC,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
                child: Text(
                  context.localized.selectLanguage, //sel lan
                  style: const AppTextStyle().headlineSmall,
                ),
              ),
              Expanded(
                // Expanded bilan ListWheelScrollViewni moslashtiramiz
                child: ListWheelScrollView(
                  controller: _scrollController,
                  itemExtent: _itemHeight,
                  physics: const FixedExtentScrollPhysics(),
                  overAndUnderCenterOpacity: 0.5,
                  perspective: 0.002,
                  onSelectedItemChanged: (index) {
                    selectedLanguageIndex = index;
                    InheritedLocalNotifier.maybeOf(context)
                        ?.changeLocal(languages[selectedLanguageIndex]["code"]);
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
                    child: Text(
                      context.localized.cancel,
                      style: const AppTextStyle().bodyLarge,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // Dialogni yopish
                    },
                  ),
                  const Spacer(),
                  TextButton(
                    child: Text(
                      context.localized.ok,
                      style: const AppTextStyle().bodyLarge,
                    ),
                    onPressed: () {
                      // Bu erda OK tugmasi logikasi
                      // InheritedLocalNotifier.maybeOf(context)
                      //     ?.changeLocal(languages[selectedLanguageIndex]["code"]);
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
