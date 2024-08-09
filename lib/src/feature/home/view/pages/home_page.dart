import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:food_delivery/src/core/routes/app_route_name.dart";
import "package:go_router/go_router.dart";
import "../../view_model/my_home_page_vm.dart";
import "../widgets/bottom_nav_bar_widget.dart";

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({required this.child, super.key});
  final Widget child;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {

  @override
  void initState() {
    super.initState();
  }

  void onPageChanged({required int index, required BuildContext context}) {
    log(index.toString());
    switch (index) {
      case 0:
        context.go(AppRouteName.discoveryPage);
        break;
      case 1:
        context.go(AppRouteName.restaurantPage);
        break;
      case 2:
        context.go(AppRouteName.searchPage);
        break;
        case 3:
        context.go(AppRouteName.favoritePage);
        break;
        case 4:
        context.go(AppRouteName.profilePage);
        break;
      default:
        context.go(AppRouteName.discoveryPage);
        break;
    }

    ref.read(myHomePageVm).changeNavigation(index);
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = ref.watch(myHomePageVm).currentIndex;
    return Scaffold(
      body: Stack(
        children: [
          widget.child,
          // Positioned(
          //   bottom: 16,
          //   left: 0,
          //   right: 0,
          //   child: ,
          // ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: BottomNavBarWidget(
          currentPage: currentPage,
          onTap: (index) {
            onPageChanged(index: index, context: context);
          },
        ),
      ),
    );
  }
}


