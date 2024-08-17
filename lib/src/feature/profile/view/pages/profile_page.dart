import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";
import "package:food_delivery/src/core/style/app_colors.dart";
import "package:go_router/go_router.dart";
import "../../../../core/routes/app_route_name.dart";
import "../../view_model/profile_vm.dart";
import "../widgets/language_scrolling_dialog.dart";
import "../widgets/profile_headrs_widget.dart";
import "../widgets/profile_logaut_widget.dart";
import "../widgets/profile_options_widget.dart";

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ProfileHeader(name: name),
            SizedBox(height: MediaQuery.of(context).size.height * 0.035),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  ProfileOption(
                    iconPath: "assets/icons/my_profile_icon.svg",
                    label: context.localized.myProfile,
                    onTap: () {
                      context.go("${AppRouteName.profilePage}/${AppRouteName.profileEditPage}");
                    },
                  ),
                  ProfileOption(
                    iconPath: "assets/icons/order_list_icon.svg",
                    label: context.localized.myOrders,
                    onTap: () {
                      context.go("${AppRouteName.profilePage}/${AppRouteName.profileEmptyPage}");
                    },
                  ),
                  ProfileOption(
                    iconPath: "assets/icons/location_icon.svg",
                    label: context.localized.deliveryAddress,
                    onTap: () {
                      context.go("${AppRouteName.profilePage}/${AppRouteName.mapDeliveryPage}");
                    },
                  ),
                  ProfileOption(
                    iconPath: "assets/icons/wallet_icon.svg",
                    label: context.localized.paymentMethods,
                    onTap: () {
                      context.go("${AppRouteName.profilePage}/${AppRouteName.profileEmptyPage}");
                    },
                  ),
                  ProfileOption(
                    iconPath: "assets/icons/email_icon.svg",
                    label: context.localized.contactUs,
                    onTap: () {
                      context.go("${AppRouteName.profilePage}/${AppRouteName.profileEmptyPage}");
                    },
                  ),
                  ProfileOption(
                    iconPath: "assets/icons/help_icon.svg",
                    label: context.localized.helpFAQ,
                    onTap: () {
                      context.go("${AppRouteName.profilePage}/${AppRouteName.profileEmptyPage}");
                    },
                  ),
                  ProfileOption(
                    icon: Icon(
                      Icons.language_outlined,
                      size: MediaQuery.of(context).size.height * 0.040,
                      color: AppColors.profil,
                    ),
                    label: context.localized.languages,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => LanguageSelectorDialog(),
                      );
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  LogOutButton(
                    onPressed: () {
                      // Log out yozish kerak
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
