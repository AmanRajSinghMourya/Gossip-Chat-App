import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gossip/Config/colors.dart';
import 'package:gossip/Config/images.dart';
import 'package:gossip/Controllers/chat_controller.dart';
import 'package:gossip/Controllers/contact_collection.dart';
import 'package:gossip/Screens/ChatScreen/chat_screen.dart';
import 'package:gossip/Screens/ContactScreen/Widgets/contact_search.dart';
import 'package:gossip/Screens/ContactScreen/Widgets/contact_tile.dart';
import 'package:gossip/Screens/HomeScreen/Widgets/chat_list_tile.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ContactCollectionController collectionController =
        Get.put(ContactCollectionController());
    ChatController chatController = Get.put(ChatController());
    RxBool isSearch = false.obs;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Obx(
            () => IconButton(
              onPressed: () {
                isSearch.value = !isSearch.value;
              },
              icon: isSearch.value
                  ? Icon(Icons.close)
                  : Icon(
                      Icons.search,
                    ),
            ),
          )
        ],
        backgroundColor: darkBackgroundColor,
        centerTitle: true,
        title: Text(
          "New Contact",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: darkOnPrimaryContainer,
              ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            // Get.of;
          },
        ),
      ),
      backgroundColor: darkBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView(
            children: [
              Obx(
                () => isSearch.value ? ContactSearch() : Container(),
              ),
              SizedBox(
                height: 10,
              ),
              ContactTile(
                name: "New Conatct",
                iconData: Icons.person_add,
                voidCallback: () {},
              ),
              SizedBox(
                height: 10,
              ),
              ContactTile(
                name: "New Group",
                iconData: Icons.group,
                voidCallback: () {
                  Get.offAllNamed('/groupPage');
                  // Get.to(NewGroup());
                },
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Contact on Gossip",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: darkOnPrimaryContainer,
                          ),
                    ),
                  ),
                ],
              ),
              Obx(
                () => Column(
                  children: collectionController.userList
                      .map(
                        (element) => InkWell(
                          onTap: () {
                            Get.to(() => ChatScreen(userModel: element));
                            String roomId =
                                chatController.getRoomId(element.id!);
                            print(roomId);
                          },
                          child: ChatTile(
                            name: element.name ?? "User",
                            imageUrl:
                                element.image ?? AssetsImages.deafultImage,
                            lastChat: element.name ?? "Hello",
                            lastTime: "",
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
