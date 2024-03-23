import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:gossip/Model/user_model.dart';

class AuthenticationController extends GetxController {
  final authentication = FirebaseAuth.instance;

  final db = FirebaseFirestore.instance;

  RxBool loading = false.obs;
  //User Login
  Future<void> loginDetails(String email, String password) async {
    //https://firebase.google.com/docs/auth/flutter/password-auth
    loading.value = true;
    try {
      await authentication.signInWithEmailAndPassword(
          email: email, password: password);

      Get.offAllNamed(
        "/homePage",
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print(e);
      }
    }
    loading.value = false;
  }

  //New user Sign In
  Future<void> signInDetails(String email, String password, String name) async {
    loading.value = true;
    try {
      await authentication.createUserWithEmailAndPassword(
          email: email, password: password);

      //new user created so make entry in database
      await makeUser(email, name);
      //Move to home page
      Get.offAllNamed("/homePage");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print(e);
      }
    }
    loading.value = false;
  }

  //LOGOUT
  Future<void> logout() async {
    await authentication.signOut();
    //After singnout move to "/authPage", AuthScreen in page
    Get.offAllNamed(
      "/authPage",
    );
  }

  //DATABASE
  //make a entry in database for new user
  Future<void> makeUser(String email, String name) async {
    var userModel = UserModel(
      email: email,
      name: name,
      id: authentication.currentUser!.uid,
    );
    try {
      await db
          .collection("users")
          .doc(authentication.currentUser!.uid)
          .set(userModel.toJson());
    } catch (e) {
      print(e);
    }
  }
}


//.collection("users"): This line indicates that you're referencing the "users" collection within your Firestore database. 
//Collections in Firestore are containers for documents, somewhat analogous to tables in a traditional database.

// .doc(authentication.currentUser!.uid): Here, you're specifying a document within the 
// "users" collection. We are using Firebase Authentication (authentication) to
// get the current user, and then accessing its uid property. The uid (User ID) is a unique 
// identifier assigned to each user by Firebase Authentication. So, you're accessing the document in 
// the "users" collection that corresponds to the currently authenticated user.

//.set(userModel.toJson()): This line is setting the data of the document retrieved in the 
//previous step. It's using the set method to write data to the document. userModel.toJson() suggests that you're 
//converting a user model object (userModel) to a JSON format. Firebase Firestore accepts data in JSON format,
// so you're essentially setting the data of the document to the JSON representation of the user model.