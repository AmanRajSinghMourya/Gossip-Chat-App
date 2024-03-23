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

//.set(updatedUser.toJson()):
//This sets the data of the specified document to the JSON representation of an updated user object (updatedUser).
//The updatedUser is an instance of a user model class, and .toJson() is a method defined on that class to convert the user object to a JSON format that Firestore can store.
//By calling .set() on the document reference, you're effectively updating the data in that document with the new user information.
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

//final path = "files/${imageUrl}";: This line constructs the path where the image will be stored in Firebase Storage.
//It concatenates the string "files/" with the imageUrl.

//final file = File(imageUrl);:
//This line creates a File object representing the image file using the imageUrl provided as the file path.

//final imageref = storageRef.child(path).putFile(file);:
//This line uploads the file to Firebase Storage. storageRef is a reference to the Firebase Storage location where the file will be stored.
//.child(path) specifies the path within the storage location, and
//.putFile(file) uploads the file represented by the File object file to that path. This operation returns an UploadTask which represents the asynchronous upload process.

//final uploadImage = await imageref.whenComplete(() {});:
//This line awaits the completion of the upload process represented by imageref. whenComplete is a method that returns a Future which completes when the UploadTask is complete.
//By awaiting it, the code waits until the upload task is finished.

//final downlaodImageUrl = await uploadImage.ref.getDownloadURL();:
//Once the upload is complete, this line retrieves the download URL of the uploaded image.
//uploadImage.ref.getDownloadURL() is an asynchronous operation that returns a Future which will eventually contain the download URL of the uploaded image.
  }
}
//.collection("users"):
//This line indicates that you're referencing the "users" collection within your Firestore database.

//.doc(auth.currentUser!.uid):
//Here, We specifying a document within the "users" collection.
//We are using Firebase Authentication (auth) to get the current user, and then accessing its uid property.
//As mentioned before, the uid (User ID) is a unique identifier assigned to each user by Firebase Authentication.
//So, you're accessing the document in the "users" collection that corresponds to the currently authenticated user.

//.get():
//This method initiates a request to fetch the document from the Firestore database.
//It returns a Future which will eventually contain a DocumentSnapshot.

//.then((value) => user.value = UserModel.fromJson(value.data()!)):
//This part of the code represents what to do once the data is fetched from Firestore.
//It uses a then method, which takes a callback function to be executed once the Future (result of .get()) is completed.

//(value) => ...:
//This is an anonymous function taking a parameter value, which represents the DocumentSnapshot returned from the Firestore database.

//user.value = UserModel.fromJson(value.data()!):
//Inside the callback function, it's extracting the data from the DocumentSnapshot using the data() method.
//The data() method returns a Map<String, dynamic>?, representing the data stored in the document. The ! operator is used here to assert that value.data() will not be null.
//Then, it's converting this data into a UserModel object using a fromJson factory constructor of the UserModel class.
//Then the UserModel.fromJson is a method that constructs a UserModel object from a JSON format.
//Finally, the resulting UserModel object is assigned to user.value.
