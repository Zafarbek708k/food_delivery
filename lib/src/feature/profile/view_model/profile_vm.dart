import "dart:io";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:image_picker/image_picker.dart";

class NameNotifier extends StateNotifier<String> {
  NameNotifier() : super("John Doe");

  void updateName(String newName) {
    state = newName;
  }
}


class AvatarNotifier extends StateNotifier<String?> {
  AvatarNotifier() : super(null);


  Future<void> updateAvatar() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      state = pickedFile.path;
    }
  }


  Future<void> deleteAvatar() async {
    if (state != null) {
      final file = File(state!);
      if (file.existsSync()) {
        file.deleteSync();
      }
      state = null;
    }
  }
}


final nameProvider = StateNotifierProvider<NameNotifier, String>((ref) => NameNotifier());

final avatarProvider = StateNotifierProvider<AvatarNotifier, String?>((ref) => AvatarNotifier());
