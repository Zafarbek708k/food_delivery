import "package:flutter/material.dart";

class EmptyProfilePage extends StatelessWidget {
  const EmptyProfilePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text("Keyingi versiyadan qo'shamiz"),
        ),
      );
}
