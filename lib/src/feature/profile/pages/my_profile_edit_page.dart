import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:food_delivery/src/feature/profile/widgets/avatar_widget.dart";
import "package:shared_preferences/shared_preferences.dart";

import "../widgets/edit_name_widget.dart";

class MyProfileEditPage extends ConsumerWidget {
  const MyProfileEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
       backgroundColor: Colors.white,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (String value) async {
              // Handle menu actions here
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'edit',
                child: Row(
                  children: [
                    Icon(Icons.edit, color: Colors.orange),
                    SizedBox(width: 8),
                    Text('Edit Avatar'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'delete',
                child: Row(
                  children: [
                    Icon(Icons.delete, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Delete Avatar'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 18.0),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.02,
            // ),
            AvatarWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                fontFamily: 'Rubik',
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            EditNameWidget(),


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

