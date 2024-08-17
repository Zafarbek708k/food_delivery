import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";

import "../../view_model/profile_vm.dart";
import "../widgets/avatar_widget.dart";

class MyProfileEditPage extends ConsumerWidget {
  const MyProfileEditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    final nameController = TextEditingController(text: name);
    final focusNode = FocusNode(); // FocusNode yaratamiz

    return Scaffold(
      floatingActionButton: MaterialButton(
        onPressed: () {
          final newName = nameController.text.trim();
          if (newName.isNotEmpty) {
            ref.read(nameProvider.notifier).updateName(newName);
            // nameController.clear();
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(300.r),
        ),
        color: Colors.greenAccent,
        minWidth: MediaQuery.of(context).size.width * 0.9,
        height: 60.h,
        child: Text(
          context.localized.save,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
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
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(context.localized.avatarUpdated),
                    ),
                  );
                }
              } else if (value == "delete") {
                await ref.read(avatarProvider.notifier).deleteAvatar();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(context.localized.deleteAvatar),
                    ),
                  );
                }
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: "edit",
                child: Row(
                  children: [
                    const Icon(Icons.edit, color: Colors.orange),
                    SizedBox(width: 8.w),
                    Text(context.localized.editAvatar),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: "delete",
                child: Row(
                  children: [
                    const Icon(Icons.delete, color: Colors.red),
                    SizedBox(width: 8.w),
                    Text(context.localized.deleteAvatar),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: GestureDetector(
        // GestureDetector qo'shamiz
        onTap: () {
          FocusScope.of(context).unfocus(); // Ekranning boshqa qismini bosganda keyboard yopiladi
        },
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AvatarWidget(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  fontFamily: "Rubik",
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              TextField(
                focusNode: focusNode, // FocusNode ni TextField ga qo'shamiz
                cursorColor: Colors.white60,
                controller: nameController,
                decoration: InputDecoration(
                  hintText: context.localized.yourName,
                  hintStyle: const TextStyle(
                    color: Colors.white60,
                  ),
                  filled: true,
                  fillColor: Colors.greenAccent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.r),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
                onSubmitted: (newName) {
                  if (newName.trim().isNotEmpty) {
                    ref.read(nameProvider.notifier).updateName(newName.trim());
                    focusNode.unfocus(
                      disposition: UnfocusDisposition.previouslyFocusedChild,
                    ); // Klaviaturani yopish uchun focusni yo'q qilamiz
                  }
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
