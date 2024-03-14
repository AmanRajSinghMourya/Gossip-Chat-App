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
      padding: EdgeInsets.all(10),
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
            width: 10,
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
          InkWell(
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
          //send message button
          Obx(
            () => isTexting.value == ""
                ? SvgPicture.asset(AssetsImages.mic)
                : InkWell(
                    onTap: () {
                      if (messageController.text.isNotEmpty) {
                        chatController.sendMessage(
                          userModel.id!,
                          messageController.text,
                          userModel,
                        );
                        messageController.clear();
                        isTexting.value = "";
                      }
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      child: SvgPicture.asset(AssetsImages.send),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
