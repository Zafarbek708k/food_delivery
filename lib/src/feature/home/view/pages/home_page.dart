import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "../../view_model/my_home_page_vm.dart";
import "../widgets/bottom_nav_bar_widget.dart";

class MyHomePage extends ConsumerWidget {
  const MyHomePage({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(myHomePageVm).currentIndex;
    return Scaffold(
      body: child,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 5.h, left: 4.w, right: 4.w),
        child: BottomNavBarWidget(
          currentPage: currentPage,
          onTap: (index) {
            ref.read(myHomePageVm).onPageChanged(index: index, context: context);
          },
        ),
      ),
    );
  }
}
