import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";
import "package:food_delivery/src/core/style/app_colors.dart";
import "package:go_router/go_router.dart";
import "../../../../core/routes/app_route_name.dart";
import "../../../../core/style/text_style.dart";
import "../../view_model/profile_vm.dart";
import "../widgets/avatar_widget.dart";
import "../widgets/language_scrolling_dialog.dart";

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const SizedBox(
                  child: AvatarWidget(),
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                    fontFamily: "Rubik",
                    color: Colors.black,
                  ),
                ),
                Text(
                  "yourEmail@.gmail.com",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    fontFamily: "Rubik",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.035,
            ),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      context.go("${AppRouteName.profilePage}/${AppRouteName.profileEditPage}");
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.056,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/my_profile_icon.svg",
                            height: MediaQuery.of(context).size.height * 0.040,
                            width: MediaQuery.of(context).size.width * 0.040,
                          ),
                          Text(
                            context.localized.myProfile,
                            style: const AppTextStyle().forProfile,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.go("${AppRouteName.profilePage}/${AppRouteName.profileEmptyPage}");
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.056,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/order_list_icon.svg",
                            height: MediaQuery.of(context).size.height * 0.038,
                            width: MediaQuery.of(context).size.width * 0.038,
                          ),
                          Text(
                            context.localized.myOrders,
                            style: const AppTextStyle().forProfile,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.go("${AppRouteName.profilePage}/${AppRouteName.mapDeliveryPage}");
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.056,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/location_icon.svg",
                            height: MediaQuery.of(context).size.height * 0.040,
                            width: MediaQuery.of(context).size.width * 0.040,
                          ),
                          Text(
                            context.localized.deliveryAddress,
                            style: const AppTextStyle().forProfile,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.go("${AppRouteName.profilePage}/${AppRouteName.profileEmptyPage}");
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.056,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/wallet_icon.svg",
                            height: MediaQuery.of(context).size.height * 0.040,
                            width: MediaQuery.of(context).size.width * 0.040,
                          ),
                          Text(
                            context.localized.paymentMethods,
                            style: const AppTextStyle().forProfile,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.go("${AppRouteName.profilePage}/${AppRouteName.profileEmptyPage}");
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.056,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/email_icon.svg",
                            height: MediaQuery.of(context).size.height * 0.040,
                            width: MediaQuery.of(context).size.width * 0.040,
                          ),
                          Text(
                            context.localized.contactUs,
                            style: const AppTextStyle().forProfile,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => LanguageSelectorDialog(),
                      );
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.056,
                      child: Row(
                        children: [
                          Icon(
                            Icons.language_outlined,
                            size: MediaQuery.of(context).size.height * 0.040,
                            color: AppColors.profil,
                          ),
                          Text(
                            context.localized.languages,
                            style: const AppTextStyle().forProfile,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.go("${AppRouteName.profilePage}/${AppRouteName.profileEmptyPage}");
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.056,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/help_icon.svg",
                            height: MediaQuery.of(context).size.height * 0.040,
                            width: MediaQuery.of(context).size.width * 0.040,
                          ),
                          Text(
                            context.localized.helpFAQ,
                            style: const AppTextStyle().forProfile,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MaterialButton(
                        height: 50.h,
                        minWidth: 120.w,
                        shape: const StadiumBorder(
                          side: BorderSide(
                            color: AppColors.lF96234,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/log_out_icon.svg",
                              height: 30.h,
                              width: 60.w,
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                            Text(
                              context.localized.logOut,
                              style: const TextStyle(color: AppColors.lF83B01),
                            ),
                          ],
                        ),
                        onPressed: () {
                          // Log out yozish kerak
                        },
                      ),
                    ],
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
