import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gossip/Config/colors.dart';
import 'package:gossip/Config/images.dart';
import 'package:gossip/Config/strings.dart';

class Welcomebody extends StatelessWidget {
  const Welcomebody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: Image.asset(AssetsImages.boyImage),
            ),
            // Image.asset(AssetsImages.plug),
            SvgPicture.asset(AssetsImages.plugSvg),
            CircleAvatar(
              radius: 50,
              child: Image.asset(AssetsImages.girlImage),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          AppStrings.nowWeAre,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          AppStrings.connected,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: darkOnPrimaryContainer),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          AppStrings.welcomeDescription,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}
