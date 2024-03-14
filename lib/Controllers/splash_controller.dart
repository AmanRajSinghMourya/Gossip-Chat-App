import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final auth = FirebaseAuth.instance;
  void onInit() {
    super.onInit();
    print("hello");
    splace();
  }

  Future<void> splace() async {
    await Future.delayed(
      Duration(seconds: 2),
    );
    Get.offAllNamed("/homePage");
    if (auth.currentUser == null) {
      Get.offAllNamed(
        "/authPage",
      );
    } else if (auth.currentUser != null) {
      Get.offAllNamed("/homePage");
    }
    print("hello");
  }
}
