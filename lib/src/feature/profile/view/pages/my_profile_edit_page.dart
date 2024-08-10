
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:shared_preferences/shared_preferences.dart";
import "../widgets/avatar_widget.dart";


class MyProfileEditPage extends ConsumerWidget {
  const MyProfileEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController _namecontroller = TextEditingController();
    final name = ref.watch(nameProvider);

    return Scaffold(
      floatingActionButton: MaterialButton(
        onPressed: () {
          final newName = _namecontroller.text.trim();
          if (newName.isNotEmpty) {
            ref.read(nameProvider.notifier).updateName(newName);
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(300),
        ),
        color: Colors.greenAccent,
        minWidth: MediaQuery.of(context).size.width * 0.9,
        height: 60,
        child: const Text(
          "Save",
          style: TextStyle(
            color: Colors.white60,
            fontSize: 18,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (String value) async {
              if (value == "edit") {
                await ref.read(avatarProvider.notifier).updateAvatar();
              if(context.mounted){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text("Avatar updated"),),

                );
              }
              } else if (value == "delete") {
                await ref.read(avatarProvider.notifier).deleteAvatar();
                if(context.mounted){ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("Avatar deleted"),),

                );}

              }
            },
            itemBuilder: (BuildContext context) => [
            const  PopupMenuItem<String>(
                value:  "edit",
                child: Row(
                  children:  [
                    Icon(Icons.edit, color: Colors.orange),
                    SizedBox(width: 8),
                    Text("Edit Avatar"),
                  ],
                ),
              ),
            const  PopupMenuItem<String>(
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

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AvatarWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                fontFamily: "Rubik",
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            TextField(
              cursorColor: Colors.white60,
              controller: _namecontroller,
              decoration: const InputDecoration(
                hintText: "Your name",
                hintStyle:  TextStyle(
                  color: Colors.white60,
                ),
                filled: true,
                fillColor: Colors.greenAccent,
                border:  OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
           const Spacer(),
          ],
        ),
      ),
    );
  }
}

final nameProvider = StateNotifierProvider<NameNotifier, String>((ref) {
  return NameNotifier(NameStorage());
});

class NameStorage {
  static const String _keyName = "userName";

  Future<String> loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyName) ?? "Katty Berry";
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
