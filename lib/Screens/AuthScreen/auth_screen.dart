import 'package:flutter/material.dart';
import 'package:gossip/Config/colors.dart';
import 'package:gossip/Config/strings.dart';
import 'package:gossip/Screens/AuthScreen/Widgets/auth_body.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBackgroundColor,
        title: Text(AppStrings.appName),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AuthBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
