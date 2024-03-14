import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gossip/Config/colors.dart';
import 'package:gossip/Config/images.dart';
import 'package:gossip/Controllers/contact_collection.dart';
import 'package:gossip/Screens/ChatScreen/chat_screen.dart';
import 'package:gossip/Screens/HomeScreen/Widgets/chat_list_tile.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    ContactCollectionController collectionController =
        Get.put(ContactCollectionController());
    return RefreshIndicator(
        backgroundColor: darkButtonColor,
        color: Colors.white,
        child: Obx(() => ListView(
              shrinkWrap: true,
              children: collectionController.chatRoomList
                  .map(
                    (element) => InkWell(
                      onTap: () {
                        Get.to(ChatScreen(userModel: element.reciever!));
                      },
                      child: ChatTile(
                        name: element.reciever!.name ?? "User",
                        imageUrl: element.reciever!.image ??
                            AssetsImages.deafultImage,
                        lastChat: element.lastMessage ?? "Last Message",
                        lastTime: element.lastTimeStamp ?? "Last Time",
                      ),
                    ),
                  )
                  .toList(),
            )),
        onRefresh: () {
          return collectionController.getChatRoomList();
        });
  }
}
