import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "../pages/my_profile_edit_page.dart";

class EditNameWidget extends ConsumerWidget {
  EditNameWidget({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(

      body: Column(
        children: [

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
          ),


        ],
      ),
    );
  }
}
