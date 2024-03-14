import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gossip/Config/colors.dart';
import 'package:gossip/Controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBackgroundColor,
        title: Text(
          "Splash Screen",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Center(
        child: Text("THis is splasgh screen after 2 sec we go to main screen"),
      ),
    );
  }
}
