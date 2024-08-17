import "dart:io";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "../../view_model/profile_vm.dart";

class AvatarWidget extends ConsumerWidget {
  const AvatarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatar = ref.watch(avatarProvider);

    return avatar != null
        ? CircleAvatar(
            radius: 60,
            backgroundImage: FileImage(File(avatar)),
          )
        : CircleAvatar(
            radius: 80.r,
            backgroundImage: const AssetImage("assets/images/profiile.png"),
          );
  }
}
