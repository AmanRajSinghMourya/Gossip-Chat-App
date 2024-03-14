import 'package:flutter/material.dart';
import 'package:gossip/Config/colors.dart';
import 'package:gossip/Config/images.dart';
import 'package:gossip/Model/user_model.dart';
import 'package:gossip/Screens/UserProfileScreen/Widgets/user_profile_info.dart';

class UserProfileScreen extends StatelessWidget {
  final UserModel userModel;
  const UserProfileScreen({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBackgroundColor,
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          IconButton(
              onPressed: () {
                //   Get.offAllNamed("/updateUserPage");
              },
              icon: Icon(Icons.edit)),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              UserInfo(
                email: userModel.email!,
                image: userModel.image ?? AssetsImages.deafultImage,
                name: userModel.name!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
