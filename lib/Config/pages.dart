import 'package:get/get.dart';
import 'package:gossip/Screens/AuthScreen/auth_screen.dart';
import 'package:gossip/Screens/ContactScreen/contact_screen.dart';
import 'package:gossip/Screens/HomeScreen/homescreen.dart';
import 'package:gossip/Screens/CurrentUserProfileScreen/current_user_profile_screen.dart';
import 'package:gossip/Screens/NewGroup/make_new_group.dart';

var pagePath = [
  GetPage(
    name: "/authPage",
    page: () => AuthScreen(),
    transition: Transition.leftToRight,
  ),
  GetPage(
    name: "/homePage",
    page: () => HomeScreen(),
    transition: Transition.leftToRight,
  ),

  GetPage(
    name: "/groupPage",
    page: () => NewGroup(),
    transition: Transition.leftToRight,
  ),

  // GetPage(
  //   name: "/userProfilePage",
  //   page: () => UserProfileScreen(),
  //   transition: Transition.leftToRight,
  // ),
  // GetPage(
  //   name: "/updateUserProfilePage",
  //   page: () => UpdateUserProfile(),
  //   transition: Transition.leftToRight,
  // ),
  GetPage(
    name: "/currentUserProfilePage",
    page: () => CurrentUserProfileScreen(),
  ),
  GetPage(
    name: "/contactPage",
    page: () => ContactScreen(),
  ),
];
