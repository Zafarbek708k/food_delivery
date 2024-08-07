import 'package:flutter/material.dart';
import 'package:food_delivery/src/feature/auth/widgets/login_button_widget.dart';
import 'package:food_delivery/src/feature/auth/widgets/register_texfeild_widgets.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 80,),
            const Padding(
              padding: EdgeInsets.only(right: 260),
              child: Text(
                "Sing Up",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
            ),
            const RegisterTexfeildWidgets(),
           
            Column(
              children: [
                const LoginButtonWidget(),
             
    SizedBox(height: 25,),
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
            SizedBox(height: 25,),
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
            SizedBox(height: 20,),
            
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
                    child: Text("Facebook"),
                  ),
                ),
                SizedBox(height: 10,),
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
                    child: Text("Facebook"),
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