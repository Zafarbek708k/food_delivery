import 'package:flutter/material.dart';

class InfoWelcomePageWidgets extends StatelessWidget {
  const InfoWelcomePageWidgets(
      {super.key, required this.googleButton, required this.facebookButton, required this.emailButton, required this.signInButton});

  final VoidCallback googleButton;
  final VoidCallback facebookButton;
  final VoidCallback emailButton;
  final VoidCallback signInButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          const Text(
            "Welcome to",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Text(
            "Fast Food",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Get your favourite meals delivered quickly right to your doorstep",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          MaterialButton(
            onPressed: emailButton,
            height: 50,
            minWidth: double.infinity,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Colors.black,
            child: const Text(
              "Start with email",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              Expanded(child: Divider(color: Colors.white)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  "Sign In With",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Expanded(child: Divider(color: Colors.white)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: googleButton,
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white,
                  child: const Icon(Icons.g_mobiledata),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: MaterialButton(
                    onPressed: facebookButton,
                    height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.blue[800],
                    child: const Icon(Icons.facebook)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have an account?",
                style: TextStyle(color: Colors.white),
              ),
              TextButton(
                onPressed: signInButton,
                child: const Text(
                  "Sign In",
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}