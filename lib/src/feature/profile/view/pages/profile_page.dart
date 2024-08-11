import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import "package:go_router/go_router.dart";
import "../../../../core/routes/app_route_name.dart";
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/text_style.dart';
import '../../view_model/profile_vm.dart';
import '../widgets/avatar_widget.dart';
import 'empty_page.dart';
import 'my_profile_edit_page.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
        padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    fontFamily: "Rubik",
                    color: Colors.black,
                  ),
                ),
                const Text(
                  "yourEmail@.gmail.com",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: "Rubik",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.035,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      context.go(AppRouteName.profileEditPage);
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
                            "    My Profile",
                            style: const AppTextStyle().forProfile,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
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
                            "    My Orders",
                            style: const AppTextStyle().forProfile,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {  context.go(AppRouteName.profileEmptyPage);
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
                            "    Delivery Address",
                            style: const AppTextStyle().forProfile,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {  context.go(AppRouteName.profileEmptyPage);  },
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
                            "    Payment Methods",
                            style: const AppTextStyle().forProfile,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.go(AppRouteName.profileEmptyPage);
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
                            "    Contact Us",
                            style: const AppTextStyle().forProfile,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EmptyProfilePage(),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.056,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/bag_icon.svg",
                            height: MediaQuery.of(context).size.height * 0.040,
                            width: MediaQuery.of(context).size.width * 0.040,
                          ),
                          Text(
                            "    About Us",
                            style: const AppTextStyle().forProfile,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.100,
            ),
            MaterialButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(300),
              ),
              color: AppColors.lFED8CC,
              minWidth: MediaQuery.of(context).size.width * 0.9,
              height: 60,
              child: const Text(
                "Logout",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
