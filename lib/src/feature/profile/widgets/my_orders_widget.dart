import 'package:flutter/material.dart';

class MyOrdersWidget extends StatelessWidget {
  const MyOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('No data',
        style: TextStyle(
          color: Colors.black26,
          fontSize: 20,
        )

        ),
      ),
    );
  }
}
