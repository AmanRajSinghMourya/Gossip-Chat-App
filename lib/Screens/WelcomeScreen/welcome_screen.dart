import 'package:flutter/material.dart';
import 'package:gossip/Screens/WelcomeScreen/Widgets/welcome_body.dart';
import 'package:gossip/Screens/WelcomeScreen/Widgets/welcome_footer.dart';
import 'package:gossip/Screens/WelcomeScreen/Widgets/welcone_header.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WelcomeHeader(),
              Welcomebody(),
              WelcomeFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
