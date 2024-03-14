import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gossip/Config/colors.dart';
import 'package:gossip/Config/images.dart';
import 'package:gossip/Controllers/chat_controller.dart';
import 'package:gossip/Controllers/profile_controller.dart';
import 'package:gossip/Model/chat_model.dart';
import 'package:gossip/Model/user_model.dart';
import 'package:gossip/Screens/ChatScreen/Widgets/chat_bubble.dart';
import 'package:gossip/Screens/ChatScreen/Widgets/floating_controller.dart';
import 'package:gossip/Screens/UserProfileScreen/user_profile_screen.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatelessWidget {
  final UserModel userModel;
  const ChatScreen({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    ChatController chatController = Get.put(ChatController());
    TextEditingController messageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkPrimaryColor,
        title: InkWell(
          onTap: () {
            Get.to(
              UserProfileScreen(
                userModel: userModel,
              ),
            );
          },
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userModel.name ?? "User",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: darkOnPrimaryContainer,
                        ),
                  ),
                  Text(
                    "Online",
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: darkOnSecondaryContainer,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.to(() => UserProfileScreen(
                  userModel: userModel,
                ));
          },
          child: Container(
            height: 50,
            width: 50,
            margin: EdgeInsets.all(5),
            child: CircleAvatar(
              backgroundColor: darkBackgroundColor,
              radius: 30,
              backgroundImage: NetworkImage(
                userModel.image ?? AssetsImages.deafultImage,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.call),
            color: darkOnSecondaryContainer,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.video_call),
            color: darkOnSecondaryContainer,
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 40),
        padding:
            const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 50),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  StreamBuilder<List<ChatModel>>(
                    stream: chatController.getMessage(userModel.id!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("Erroe Occured"),
                        );
                      }
                      if (snapshot.data == null) {
                        return Center(
                          child: Text("No messages"),
                        );
                      } else {
                        return ListView.builder(
                          reverse: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            DateTime dateTime = DateTime.parse(
                                snapshot.data![index].timestamp!);
                            String formattedDate =
                                DateFormat("hh:mm a").format(dateTime);

                            return ChatBubble(
                              imageUrl: snapshot.data![index].imageUrl ?? "",
                              isComming: snapshot.data![index].recieverId ==
                                  profileController.user.value.id,
                              message: snapshot.data![index].message!,
                              status: "read",
                              time: formattedDate,
                            );
                          },
                        );
                      }
                    },
                  ),
                  Obx(
                    () => chatController.selectedImage.value != ""
                        ? Positioned(
                            bottom: 50,
                            left: 0,
                            right: 0,
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              height: 300,
                              // width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(
                                    File(chatController.selectedImage.value),
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(20),
                                color: darkPrimaryColor,
                              ),
                            ),
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
            FloatingButtonSend(
                messageController: messageController,
                chatController: chatController,
                userModel: userModel)
          ],
        ),
      ),
    );
  }
}
