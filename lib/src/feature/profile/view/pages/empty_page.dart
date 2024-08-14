import "package:flutter/material.dart";
import "package:food_delivery/src/core/style/app_colors.dart";

class EmptyProfilePage extends StatelessWidget {
  const EmptyProfilePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: AppColors.lEDEDEF,
    ),
    body: const Center(
      child: Text("Keyingi versiyada"),
    ),
  );
}
