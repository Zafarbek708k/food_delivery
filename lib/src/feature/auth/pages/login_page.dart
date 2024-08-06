import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/src/core/style/text_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Login",style: const AppTextStyle().CategorysNameLarge,),
            ),
          )
        ],
       ) ,
    );
  }
}
