import 'package:flutter/material.dart';

class RessetPasswordPage extends StatefulWidget {
  const RessetPasswordPage({super.key});

  @override
  State<RessetPasswordPage> createState() => _RessetPasswordPageState();
}

class _RessetPasswordPageState extends State<RessetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(child: Text("Reset password"),));
  }
}