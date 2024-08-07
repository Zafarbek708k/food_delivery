import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/src/feature/auth/widgets/login_button_widget.dart';
import 'package:food_delivery/src/feature/auth/widgets/register_texfeild_widgets.dart';

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