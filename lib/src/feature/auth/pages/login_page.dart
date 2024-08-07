import 'package:flutter/material.dart';
import 'package:food_delivery/src/feature/auth/widgets/login_button_widget.dart';
import 'package:food_delivery/src/feature/auth/widgets/login_texFeild_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 150,),
            const Padding(
              padding: EdgeInsets.only(right: 290),
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
            ),
            const LoginTexfeildWidget(),
           
            Column(
              children: [
                const LoginButtonWidget(),
             
    const SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Row(
                children: [
                  const Text(
                    "Don't have an accaunt? ",
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Sing Up",
                      style: TextStyle(fontSize: 16, color: Colors.orange),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 25,),
          const  Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 60,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1.8,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("salom"),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1.8,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            
            Column(
            
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide()
                    ),
                    height: 40,
                    minWidth: double.infinity,
                    onPressed: () {
                      
                    },
                    child: const Text("Facebook"),
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide()
                    ),
                    height: 40,
                    minWidth: double.infinity,
                    onPressed: () {
                      
                    },
                    child: const Text("Facebook"),
                  ),
                )
              ],
            )
             ],
            ),
          ],
        ),
      ),
    );
  }
}
