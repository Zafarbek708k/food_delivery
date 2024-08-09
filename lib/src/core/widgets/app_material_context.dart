import "package:flutter/material.dart";
import "package:food_delivery/src/core/routes/app_router.dart";
import "../../feature/settings/inherited_locale_notifier.dart";
import "../../feature/settings/inherited_theme_notifier.dart";
import "../../feature/settings/locale_controller.dart";
import "../../feature/settings/theme_controller.dart";

final ThemeController themeController = ThemeController();
final LocalController localController = LocalController();

class AppMaterialContext extends StatelessWidget {
  const AppMaterialContext({super.key});

  @override
  Widget build(BuildContext context) => InheritedThemeNotifier(
        themeController: themeController,
        child: InheritedLocalNotifier(
          localController: localController,
          child: Builder(
            builder: (context) => MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: InheritedThemeNotifier.maybeOf(context)?.theme,
              locale: InheritedLocalNotifier.maybeOf(context)?.appLocal,
              routerConfig: AppRouter.routes,
            ),
          ),
        ),
      );
}
