import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_svg/svg.dart";
import "package:food_delivery/src/core/style/app_colors.dart";
import "../../../../core/style/text_style.dart";
import "../widgets/avatar_widget.dart";
import "empty_page.dart";
import "my_profile_edit_page.dart";



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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyProfileEditPage()));
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmptyProfilePage(),
                        ),
                      );
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
                            "    Delivery Adress",
                            style: AppTextStyle().forProfile,
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
                              builder: (context) => EmptyProfilePage()));
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
                            "    Payment Methods",
                            style: AppTextStyle().forProfile,
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
                              builder: (context) => EmptyProfilePage()));
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
                            style: AppTextStyle().forProfile,
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
                              builder: (context) =>  EmptyProfilePage()));
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.056,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/setting_icon.svg",
                            height: MediaQuery.of(context).size.height * 0.040,
                            width: MediaQuery.of(context).size.width * 0.040,
                          ),
                           Text(
                            "    Settings",
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
                              builder: (context) => EmptyProfilePage()));
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
                            "    Help & FAQ",
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
                        height: 50,
                        minWidth: 120,
                        shape: const StadiumBorder(
                            side: BorderSide(color: AppColors.lF96234,)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/log_out_icon.svg",
                              height: 30,
                              width: 60,
                            ),
                            SizedBox(
                                width:
                                MediaQuery.of(context).size.width * 0.02),
                            const Text(
                              "Log Out",
                              style: TextStyle(color: Colors.deepOrange),
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
