import 'package:flutter/material.dart';
import 'package:food_delivery/src/feature/profile/widgets/avatar_widget.dart';

import '../widgets/text_field_widget.dart';

class MyProfileEditPage extends StatefulWidget {
  const MyProfileEditPage({super.key});

  @override
  State<MyProfileEditPage> createState() => _MyProfileEditPageState();
}

class _MyProfileEditPageState extends State<MyProfileEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            AvatarWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),

            CustomTextField(
              labelText: 'Your name',


            ),






          ],
        ),
      ),
    );
  }
}
