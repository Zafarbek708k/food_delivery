import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final searchVM = ChangeNotifierProvider((ref) => SearchVm());

class SearchVm with ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
