import 'package:flutter/material.dart';
import 'package:gossip/Config/images.dart';
import 'package:gossip/Config/strings.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              child: Image.asset(
                AssetsImages.boyImage,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        Text(
          AppStrings.appName,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }
}
