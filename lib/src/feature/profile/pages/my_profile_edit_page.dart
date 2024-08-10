import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:shared_preferences/shared_preferences.dart";
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
      appBar:  AppBar(
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (String value) async {
              if (value == "edit") {
                await ref.read(avatarProvider.notifier).updateAvatar();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Avatar updated')),
                );
              } else if (value == 'delete') {
                await ref.read(avatarProvider.notifier).deleteAvatar();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Avatar deleted')),
                );
              }
            },
            itemBuilder: (BuildContext context) => [
            const  PopupMenuItem<String>(
                value: 'edit',
                child: Row(
                  children:  [
                    Icon(Icons.edit, color: Colors.orange),
                    SizedBox(width: 8),
                    Text('Edit Avatar'),
                  ],
                ),
              ),
               const PopupMenuItem<String>(
                value: 'delete',
                child:   Row(
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
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            const AvatarWidget(),
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
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
}


final nameProvider = StateNotifierProvider<NameNotifier, String>((ref) {
  return NameNotifier(NameStorage());
});



class NameStorage {
  static const String _keyName = 'userName';

  Future<String> loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyName) ?? 'Katty Berry';
  }

  Future<void> saveName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyName, name);
  }
}




class NameNotifier extends StateNotifier<String> {
  final NameStorage _nameStorage;

  NameNotifier(this._nameStorage) : super("Katty Berry") {
    _loadName();
  }

  Future<void> _loadName() async {
    state = await _nameStorage.loadName();
  }

  Future<void> updateName(String newName) async {
    state = newName;
    await _nameStorage.saveName(newName);
  }
}

