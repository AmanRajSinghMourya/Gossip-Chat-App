import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gossip/Config/colors.dart';
import 'package:gossip/Config/images.dart';
import 'package:gossip/Config/strings.dart';
import 'package:slide_to_act/slide_to_act.dart';

class WelcomeFooter extends StatelessWidget {
  const WelcomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideAction(
      onSubmit: () {
        // Get.offAllNamed(
        //   "/authPage",
        // );
        Get.offAllNamed(
          "/homePage",
        );
        return null;
      },
      sliderButtonIcon: SvgPicture.asset(AssetsImages.plugSvg),
      innerColor: darkBackgroundColor,
      outerColor: darkPrimaryColor,
      text: AppStrings.slideToStart,
      submittedIcon: SvgPicture.asset(AssetsImages.plugSvg),
      animationDuration: Duration(milliseconds: 300),
      textStyle: Theme.of(context).textTheme.headlineSmall,
    );
  }
}
