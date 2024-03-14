import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:gossip/Model/chat_room_modal.dart';
import 'package:gossip/Model/user_model.dart';

class ContactCollectionController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  RxList<UserModel> userList = <UserModel>[].obs;
  RxList<ChatRoomModel> chatRoomList = <ChatRoomModel>[].obs;
  RxBool isGettingList = false.obs;

  void onInit() async {
    super.onInit();
    await getUserList();
    await getChatRoomList();
  }

  Future<void> getUserList() async {
    try {
      userList.clear();
      isGettingList.value = true;
      await db.collection("users").get().then((value) => {
            userList.value = value.docs
                .map(
                  (e) => UserModel.fromJson(e.data()),
                )
                .toList(),
          });
      print("THIS IS WORKING");
      print(userList);
      isGettingList.value = false;
    } catch (e) {
      print(e);
      isGettingList.value = false;
    }
  }

  Future<void> getChatRoomList() async {
    List<ChatRoomModel> temoChatRoomList = [];
    await db.collection("chats").get().then((value) {
      temoChatRoomList =
          value.docs.map((e) => ChatRoomModel.fromJson(e.data())).toList();
    });
    print(chatRoomList);
    //the above give all the chats in our database
    //we only want the users from which we had a conversation
    //that means if we have a roomId with our id as a substring in it that means we had a chat with that user
    chatRoomList.value = temoChatRoomList
        .where((element) => element.id!.contains(auth.currentUser!.uid))
        .toList();
    ;
    print(chatRoomList);
  }
}
