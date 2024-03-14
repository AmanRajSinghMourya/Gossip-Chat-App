import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gossip/Config/colors.dart';
import 'package:gossip/Config/images.dart';
import 'package:gossip/Controllers/auth_controller.dart';
import 'package:gossip/Controllers/profile_controller.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AuthenticationController authenticationController =
        Get.put(AuthenticationController());
    ProfileController profileController =
        Get.put(ProfileController(), permanent: true);
    return Drawer(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
        right: Radius.circular(40),
      )),
      width: 275,
      backgroundColor: darkButtonColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerItem(
                  onTap: () {},
                  icon: Icons.arrow_back,
                  title: "Settings",
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Image.asset(AssetsImages.boyImage),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Aman Raj",
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: 20,
                              ),
                    ),
                  ],
                ),
                Divider(
                  height: 35,
                  color: darkOnPrimaryContainer,
                ),
                SizedBox(
                  height: 20,
                ),
                DrawerItem(
                  onTap: () {
                    // await profileController.getUserDetails();
                    // print(profileController.user.value.about);
                    print("GOING to OTHER PAAAAAGE");
                    Get.offAllNamed(
                      "/currentUserProfilePage",
                    );
                    // Get.to(CurrentUserProfileScreen(
                    //   profileController: profileController,
                    // ));
                  },
                  icon: Icons.person,
                  title: "Profile",
                ),
                SizedBox(
                  height: 10,
                ),
                DrawerItem(
                  onTap: () {},
                  icon: Icons.chat_bubble,
                  title: "Chats",
                ),
                SizedBox(
                  height: 10,
                ),
                DrawerItem(
                  onTap: () {},
                  icon: Icons.key,
                  title: "Account",
                ),
                SizedBox(
                  height: 10,
                ),
                DrawerItem(
                  onTap: () {},
                  icon: Icons.notifications,
                  title: "Notification",
                ),
                SizedBox(
                  height: 10,
                ),
                DrawerItem(
                  onTap: () {},
                  icon: Icons.storage,
                  title: "Data and Storage",
                ),
                SizedBox(
                  height: 10,
                ),
                DrawerItem(
                  onTap: () {},
                  icon: Icons.help,
                  title: "Help",
                ),
                Divider(
                  height: 35,
                  color: darkOnPrimaryContainer,
                ),
                SizedBox(
                  height: 10,
                ),
                DrawerItem(
                  onTap: () {},
                  icon: Icons.people_outline,
                  title: "Invite a freind",
                ),
              ],
            ),
            DrawerItem(
              icon: Icons.logout_outlined,
              title: "Logout",
              onTap: () {
                authenticationController.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap.call();
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 25),
        child: Row(
          children: [
            Icon(
              icon,
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 16,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
