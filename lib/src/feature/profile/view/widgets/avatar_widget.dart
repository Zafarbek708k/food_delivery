import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../view_model/profile_vm.dart';

class AvatarWidget extends ConsumerWidget {
  const AvatarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatar = ref.watch(avatarProvider);

    return avatar != null
        ? CircleAvatar(
      radius: 40,
      backgroundImage: FileImage(File(avatar)),
    )
        : const CircleAvatar(
      radius: 40,
      backgroundImage: AssetImage("assets/avatar_placeholder.png"),
    );
  }
}
