import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../widgets/avatar_widget.dart";
import "../widgets/edit_profile_button_widget.dart";
import "../widgets/text_field_widget.dart";

class MyProfileEditPage extends ConsumerStatefulWidget {
  const MyProfileEditPage({super.key});

  @override
  ConsumerState<MyProfileEditPage> createState() => _MyProfileEditPageState();
}

class _MyProfileEditPageState extends ConsumerState<MyProfileEditPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (String value) async {
              if (value == "edit") {
                await ref.read(avatarProvider.notifier).updateAvatar();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                     backgroundColor: Colors.green, content: Text("Avatar updated"),),
                );
              } else if (value == "delete") {
                await ref.read(avatarProvider.notifier).deleteAvatar();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text("Avatar deleted"), ),
                );
              }
            },
            itemBuilder: (BuildContext context) => [
               const PopupMenuItem<String>(
                value: "edit",
                child: Row(
                  children:  [
                    Icon(Icons.edit, color: Colors.orange),
                    SizedBox(width: 8),
                    Text("Edit Avatar"),
                  ],
                ),
              ),
             const PopupMenuItem<String>(
                value: "delete",
                child: Row(
                  children:  [
                    Icon(Icons.delete, color: Colors.red),
                    SizedBox(width: 8),
                    Text("Delete Avatar"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white60,
      body: Center(
        child: Column(
          children: [

             AvatarWidget(),
             SizedBox(
               width: MediaQuery.of(context).size.width * 0.1,
             ),


            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
             CustomTextField(
              hintText: "Your name",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            EditProfileButtonWidget(
              onPressed: () {
                // Handle name change
              },
              color: Colors.orangeAccent,
            ),
          ],
        ),
      ),
    );
}
