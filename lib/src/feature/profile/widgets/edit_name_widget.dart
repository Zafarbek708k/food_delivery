import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "../pages/my_profile_edit_page.dart";

class EditNameWidget extends ConsumerWidget {
  EditNameWidget({Key? key}) : super(key: key);

  final TextEditingController _namecontroller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
       TextField(
          cursorColor: Colors.white60,
          controller: _namecontroller,
          decoration: InputDecoration(
            hintText: "Your name",
            hintStyle: const TextStyle(
              color: Colors.white60,
            ),


            filled: true,
            fillColor: Colors.greenAccent,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        MaterialButton(


          onPressed: () {

            final newName = _namecontroller.text.trim();
            if (newName.isNotEmpty) {
              ref.read(nameProvider.notifier).updateName(newName);
            }

          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(300),
          ),
          color:Colors.greenAccent,
          minWidth: double.infinity,
          height: 60,
          child: const Text(
            "Save",
            style: TextStyle(
              color: Colors.white60,
              fontSize: 18,
            ),
          ),
        ),

      ],
    );
  }
}
