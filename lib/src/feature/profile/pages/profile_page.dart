import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "package:food_delivery/src/feature/profile/pages/my_profile_edit_page.dart";

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Container(
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/woman.png"),
                    ),
                  ),
                ),
              const  Text(
                  'Katty Berry',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    fontFamily: 'Rubik',
                  ),
                ),
                const  Text(
                  'yourEmail@.gmail.com',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: 'Rubik',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.035,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/my_profile_icon.svg",
                        height: MediaQuery.of(context).size.height * 0.040,
                        width: MediaQuery.of(context).size.width * 0.040,
                      ),
                      TextButton(
                        onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProfileEditPage())); },
                        child: const Text(
                          "My Profile",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: 'Rubik',
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/order_list_icon.svg",
                        height: MediaQuery.of(context).size.height * 0.037,
                        width: MediaQuery.of(context).size.width * 0.037,
                      ),
                      TextButton(
                        onPressed: () {  },
                        child: const Text(
                          "My Orders",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: 'Rubik', color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/location_icon.svg",
                        height: MediaQuery.of(context).size.height * 0.042,
                        width: MediaQuery.of(context).size.width * 0.042,
                      ),
                      TextButton(
                        onPressed: (){},
                        child: const Text(
                          "Delivery Adress",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: 'Rubik', color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/wallet_icon.svg",
                        height: MediaQuery.of(context).size.height * 0.038,
                        width: MediaQuery.of(context).size.width * 0.038,
                      ),
                      TextButton(
                        onPressed: () {  },
                        child: const Text(
                          "Payment Methods",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: 'Rubik', color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/email_icon.svg",
                        height: MediaQuery.of(context).size.height * 0.040,
                        width: MediaQuery.of(context).size.width * 0.040,
                      ),
                      TextButton(
                        onPressed: () {  },
                        child: const Text(
                          "Contact Us",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: 'Rubik', color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/setting_icon.svg",
                        height: MediaQuery.of(context).size.height * 0.040,
                        width: MediaQuery.of(context).size.width * 0.040,
                      ),
                      TextButton(
                        onPressed: () {  },
                        child: const Text(
                          "Settings",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: 'Rubik', color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/help_icon.svg",
                        height: MediaQuery.of(context).size.height * 0.040,
                        width: MediaQuery.of(context).size.width * 0.040,
                      ),
                      TextButton(
                        onPressed: () {  },
                        child: const Text(
                          "Help & FAQ",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            fontFamily: 'Rubik', color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: [
                      MaterialButton(
                          height: 50,
                          minWidth: 120,
                          shape: const StadiumBorder(side: BorderSide(color: Colors.deepOrange)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/log_out_icon.svg",
                                height: 30,
                                width: 60,
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                              const Text(
                                "Log Out",
                                style: TextStyle(color: Colors.deepOrange),
                              )
                            ],
                          ),
                          onPressed: () {
                            //Log out yozish kerak

                          }),
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
