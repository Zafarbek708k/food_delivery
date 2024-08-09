
import "dart:io";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:image_picker/image_picker.dart";
import "package:shared_preferences/shared_preferences.dart";

class AvatarNotifier extends Notifier<String?> {
  @override
  String? build() {
    _loadAvatarPath();
    return null;
  }

  Future<void> _loadAvatarPath() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    state = prefs.getString("avatarPath");
  }

  Future<void> pickAvatar() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      state = pickedFile.path;
      _saveAvatarPath(state!);
    }
  }

  Future<void> updateAvatar() async {
    await pickAvatar();
  }

  Future<void> deleteAvatar() async {
    state = null;
    _removeAvatarPath();
  }

  Future<void> _saveAvatarPath(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("avatarPath", path);
  }

  Future<void> _removeAvatarPath() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('avatarPath');
  }
}

final avatarProvider =
NotifierProvider<AvatarNotifier, String?>(() => AvatarNotifier());

class AvatarWidget extends ConsumerWidget {
  const AvatarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarPath = ref.watch(avatarProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            await ref.read(avatarProvider.notifier).pickAvatar();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text("Avatar added"),
              ),
            );
          },
          child: CircleAvatar(
            radius: 65,
            backgroundImage: avatarPath != null
                ? FileImage(File(avatarPath))
                : const AssetImage("assets/images/woman.png")
            as ImageProvider,
            child: avatarPath == null ? null : null,
          ),
        ),
        const SizedBox(height: 2),

      ],
    );
  }
}
