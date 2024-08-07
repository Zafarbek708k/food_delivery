import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List items = [
    Items(icon: "assets/icons/profile_icon.svg",     text: "My Profile"),
    Items(icon: "assets/icons/order_list_icon.svg",  text: "My orders"),
    Items(icon: "assets/icons/location_icon.svg",    text: "Delivery Address"),
    Items(icon: "assets/icons/wallet_icon.svg", text: "Payment Methods"),
    Items(icon: "assets/icons/email_icon.svg", text: "Contact Us"),
    Items(icon: "assets/icons/setting_icon.svg", text: "Setting"),
    Items(icon: "assets/icons/help_icon.svg", text: "Help & FAQ"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                  Container(
                    height: 120,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/woman.png"),
                      ),
                    ),
                  ),
                  const Text(
                    'Katty Berry',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      fontFamily: 'Rubik',
                    ),
                  ),
                  const Text(
                    'yourEmail@.gmail.com',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      fontFamily: 'Rubik',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            SizedBox(
              height: 400,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index){
                    Items item = items[index];
                return   Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: ListTile(

                    leading:  SvgPicture.asset(
                      item.icon,
                      height: MediaQuery.of(context).size.height * 0.024,
                      width: MediaQuery.of(context).size.width * 0.024,

                    ),
                    title: Text(
                      item.text,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: 'Rubik',
                      ),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            MaterialButton(
                height: 50,
                minWidth: 120,
                shape: const StadiumBorder(side: BorderSide(color: Colors.deepOrange)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/log_out_icon.svg",
                      height: 30,
                      width: 60,
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      "Log Out",
                      style: TextStyle(color: Colors.deepOrange),
                    )
                  ],
                ),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}


class Items{
  String text;
  String icon;
  Items({required this.text, required this.icon});
}