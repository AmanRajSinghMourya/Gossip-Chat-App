import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:gossip/Controllers/profile_controller.dart';
import 'package:gossip/Model/chat_model.dart';
import 'package:gossip/Model/chat_room_modal.dart';
import 'package:gossip/Model/user_model.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class ChatController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final uuid = Uuid();
  RxBool isLoading = false.obs;

  ProfileController profileController = Get.put(ProfileController());
  RxString selectedImage = "".obs;
  String getRoomId(String targetUserId) {
    String currentUserId = auth.currentUser!.uid;
    if (currentUserId[0].codeUnitAt(0) > targetUserId[0].codeUnitAt(0)) {
      return currentUserId + targetUserId;
    } else {
      return targetUserId + currentUserId;
    }
  }

  Future<void> sendMessage(
    String targetUserId,
    String message,
    UserModel reciever,
  ) async {
    isLoading.value = true;

    String roomId = getRoomId(targetUserId);
    String chatId = uuid.v6();

    DateTime dateTime = DateTime.now();
    String currentTime = DateFormat("hh:mm a").format(dateTime);

    RxString imageUrl = "".obs;
    if (selectedImage.value.isNotEmpty) {
      imageUrl.value =
          await profileController.uploadImageToFirebase(selectedImage.value);
    }

    var newChatModel = ChatModel(
      message: message,
      imageUrl: imageUrl.value,
      id: chatId,
      senderId: auth.currentUser!.uid,
      senderName: profileController.user.value.name,
      recieverId: targetUserId,
      timestamp: DateTime.now().toString(),
    );
    var roomDetails = ChatRoomModel(
      id: roomId,
      sender: profileController.user.value,
      lastTimeStamp: currentTime,
      lastMessage: message,
      timeStamp: DateTime.now().toString(),
      reciever: reciever,
      unReadMessages: 0,
    );
    try {
      await db.collection("chats").doc(roomId).set(
            roomDetails.toJson(),
          );
      await db
          .collection("chats")
          .doc(roomId)
          .collection("messages")
          .doc(chatId)
          .set(
            newChatModel.toJson(),
          );
      selectedImage.value = "";
      isLoading.value = false;
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }

  Stream<List<ChatModel>> getMessage(String targetUserId) {
    String roomId = getRoomId(targetUserId);

    return db
        .collection("chats")
        .doc(roomId)
        .collection("messages")
        .orderBy("timestamp", descending: true)
        .snapshots()
        .map(
          (event) => event.docs
              .map(
                (e) => ChatModel.fromJson(
                  e.data(),
                ),
              )
              .toList(),
        );
  }
}
