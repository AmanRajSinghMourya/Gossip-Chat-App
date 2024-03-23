import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gossip/Config/colors.dart';
import 'package:gossip/Config/images.dart';
import 'package:gossip/Controllers/chat_controller.dart';
import 'package:gossip/Controllers/image_picker_controller.dart';
import 'package:gossip/Model/user_model.dart';

class FloatingButtonSend extends StatelessWidget {
  const FloatingButtonSend({
    super.key,
    required this.messageController,
    required this.chatController,
    required this.userModel,
  });

  final TextEditingController messageController;
  final ChatController chatController;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    ImagePickerController imagePickerController =
        Get.put(ImagePickerController());
    RxString isTexting = "".obs;
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: darkPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            child: Icon(Icons.emoji_emotions),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: TextFormField(
              onChanged: (value) {
                isTexting.value = value;
              },
              controller: messageController,
              decoration: InputDecoration(
                hintText: "Type message...",
                fillColor: darkPrimaryColor,
                filled: true,
              ),
            ),
          ),
          //Image picker

          Obx(
            () => chatController.selectedImage.value != ""
                ? SizedBox()
                : InkWell(
                    onTap: () async {
                      chatController.selectedImage.value =
                          await imagePickerController.pickImage();
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      child: Icon(
                        Icons.image,
                      ),
                    ),
                  ),
          ),
          SizedBox(
            width: 10,
          ),
          //send message button
          Obx(
            () => isTexting.value != "" ||
                    chatController.selectedImage.value != ""
                ? InkWell(
                    onTap: () {
                      if (messageController.text.isNotEmpty ||
                          chatController.selectedImage.value.isNotEmpty) {
                        chatController.sendMessage(
                          userModel.id!,
                          messageController.text,
                          userModel,
                        );
                        messageController.clear();
                        isTexting.value = "";
                        chatController.selectedImage.value = "";
                      }
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      child: chatController.isLoading.value
                          ? CircularProgressIndicator()
                          : SvgPicture.asset(AssetsImages.send),
                    ),
                  )
                : SvgPicture.asset(AssetsImages.mic),
          ),
        ],
      ),
    );
  }
}
