import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AvatarProvider with ChangeNotifier {
  String? _avatarPath;

  String? get avatarPath => _avatarPath;

  AvatarProvider() {
    _loadAvatarPath();
  }

  Future<void> _loadAvatarPath() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _avatarPath = prefs.getString('avatarPath');
    notifyListeners();
  }

  Future<void> pickAvatar() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _avatarPath = pickedFile.path;
      notifyListeners();
      _saveAvatarPath(_avatarPath!);
    }
  }

  Future<void> updateAvatar() async {
    await pickAvatar();
  }

  Future<void> deleteAvatar() async {
    _avatarPath = null;
    notifyListeners();
    _removeAvatarPath();
  }

  Future<void> _saveAvatarPath(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('avatarPath', path);
  }

  Future<void> _removeAvatarPath() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('avatarPath');
  }
}

class AvatarWidget extends StatefulWidget {
  const AvatarWidget({Key? key}) : super(key: key);

  @override
  _AvatarWidgetState createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AvatarProvider>(
      builder: (context, avatarProvider, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                await avatarProvider.pickAvatar();
                ScaffoldMessenger.of(context).showSnackBar(
                  const    SnackBar(
                      backgroundColor: Colors.green,  content: Text('Avatar added')),
                );
              },
              child: CircleAvatar(
                radius: 80,
                backgroundImage: avatarProvider.avatarPath != null
                    ? FileImage(File(avatarProvider.avatarPath!))
                    : null,
                child: avatarProvider.avatarPath == null
                    ? const Icon(Icons.person, size: 80)
                    : null,
              ),
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () async {
                    await avatarProvider.updateAvatar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Avatar updated')),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await avatarProvider.deleteAvatar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Avatar deleted')),
                    );
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}