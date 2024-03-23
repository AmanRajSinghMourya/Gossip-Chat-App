import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:gossip/Model/user_model.dart';

class ProfileController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final storageRef = FirebaseStorage.instance.ref();

  RxBool isUpdating = false.obs;
  Rx<UserModel> user = UserModel().obs;
  @override
  void onInit() async {
    super.onInit();
    await getUserDetails();
  }

  Future<void> getUserDetails() async {
    //user.value = how we use Getx variable

    //value we get from database is in json format
    //fromJson decode the value and than make our UserModel
    await db.collection("users").doc(auth.currentUser!.uid).get().then(
          (value) => user.value = UserModel.fromJson(
            value.data()!,
          ),
        );
  }

  Future<void> updateUserProfile(
    String? name,
    String? phone,
    String? about,
    String? imageUrl,
  ) async {
    isUpdating.value = true;
    //first upload image to firebase by calling this function
    try {
      final imageDownloadLink = await uploadImageToFirebase(imageUrl!);
      final updatedUser = UserModel(
        id: auth.currentUser!.uid,
        email: auth.currentUser!.email,
        about: about,
        name: name,
        image: imageDownloadLink == "" ? user.value.image : imageDownloadLink,
        phone: phone,
      );

      await db.collection("users").doc(auth.currentUser!.uid).set(
            updatedUser.toJson(),
          );
      getUserDetails();

      isUpdating.value = false;
    } catch (e) {
      print(e);
      isUpdating.value = false;
    }
    isUpdating.value = false;
  }

  //a seperate Function to upload image to firebase storage
  Future<String> uploadImageToFirebase(String imageUrl) async {
    final path = "files/${imageUrl}";
    final file = File(imageUrl);
    if (imageUrl != "") {
      try {
        final imageref = storageRef.child(path).putFile(file);

        final uploadImage = await imageref.whenComplete(() {});

        final downlaodImageUrl = await uploadImage.ref.getDownloadURL();
        print(downlaodImageUrl);
        return downlaodImageUrl;
      } catch (e) {
        print(e);
        return "";
      }
    }
    return "";
  }
}
