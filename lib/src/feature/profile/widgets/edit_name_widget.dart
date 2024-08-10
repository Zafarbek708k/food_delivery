import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:food_delivery/src/feature/profile/widgets/text_field_widget.dart";
import "../pages/my_profile_edit_page.dart";
import 'edit_profile_button_widget.dart';

class MyProfileEditPage extends ConsumerStatefulWidget {
  const MyProfileEditPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyProfileEditPage> createState() => _MyProfileEditPageState();
}

class _MyProfileEditPageState extends ConsumerState<MyProfileEditPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize with current name
    _controller.text = ref.read(nameProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              hintText: 'Your name',
              controller: _controller,
            ),
            const SizedBox(height: 20),
            EditProfileButtonWidget(
              onPressed: () {
                final newName = _controller.text.trim();
                if (newName.isNotEmpty) {
                  ref.read(nameProvider.notifier).updateName(newName);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Name updated')),
                  );
                }
              },
              color: Colors.orangeAccent,
            ),
          ],
        ),
      ),
    );
  }
}
