
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";

import "../../../core/routes/app_route_name.dart";

final myHomePageVm = ChangeNotifierProvider((ref) => PrimaryVM());

class PrimaryVM with ChangeNotifier {
  /// home page
  int currentIndex = 0;

  void changeNavigation(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void onPageChanged({required int index, required BuildContext context}) {
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
    changeNavigation(index);
  }


  /// discovery Page

  void seeAll({required BuildContext context}){
    currentIndex++;
    context.go(AppRouteName.restaurantPage);
    notifyListeners();
  }
  final PageController bannerController = PageController();
  final List<String> bannerImages = [
    "https://insights.workwave.com/wp-content/uploads/2021/08/WorkWave-The-Carbon-Footprint-of-Food-Delivery-Services.jpg",
    "https://insights.workwave.com/wp-content/uploads/2021/08/WorkWave-The-Carbon-Footprint-of-Food-Delivery-Services.jpg",
    "https://insights.workwave.com/wp-content/uploads/2021/08/WorkWave-The-Carbon-Footprint-of-Food-Delivery-Services.jpg",
    "https://insights.workwave.com/wp-content/uploads/2021/08/WorkWave-The-Carbon-Footprint-of-Food-Delivery-Services.jpg",
  ];



}
