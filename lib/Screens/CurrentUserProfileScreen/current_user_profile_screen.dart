import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gossip/Config/colors.dart';
import 'package:gossip/Controllers/image_picker_controller.dart';
import 'package:gossip/Controllers/profile_controller.dart';

class CurrentUserProfileScreen extends StatelessWidget {
  const CurrentUserProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    RxBool isEdit = false.obs;
    ProfileController profileController =
        Get.put(ProfileController(), permanent: true);
    if (isEdit.value == false) {
      // Obx(
      //   () => profileController.getUserDetails(),
      // );
    }
    TextEditingController name =
        TextEditingController(text: profileController.user.value.name);
    TextEditingController email =
        TextEditingController(text: profileController.user.value.email);
    TextEditingController about =
        TextEditingController(text: profileController.user.value.about);
    TextEditingController phone =
        TextEditingController(text: profileController.user.value.phone);

    ImagePickerController imagePickerController =
        Get.put(ImagePickerController());

    RxString imagePath = "".obs;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBackgroundColor,
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: darkPrimaryColor,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(
                                () => isEdit.value
                                    ? InkWell(
                                        //tap to pick image
                                        onTap: () async {
                                          imagePath.value =
                                              await imagePickerController
                                                  .pickImage();
                                          print(imagePath.value);
                                        },
                                        child: Container(
                                          height: 110,
                                          width: 110,
                                          decoration: BoxDecoration(
                                            color: darkBackgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: imagePath.value == ""
                                              ? Icon(
                                                  Icons.add,
                                                )
                                              : ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    100,
                                                  ),
                                                  child: Image.file(
                                                    File(
                                                      imagePath.value,
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                        ),
                                      )
                                    : profileController.user.value.image ==
                                                null ||
                                            profileController
                                                    .user.value.image ==
                                                ""
                                        ? CircleAvatar(
                                            radius: 55,
                                            backgroundColor: Colors.white,
                                            child: CircleAvatar(
                                              radius: 50,
                                              child: Icon(
                                                Icons.add,
                                              ),
                                            ),
                                          )
                                        : CircleAvatar(
                                            radius: 42,
                                            backgroundColor: Colors.white,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl: profileController
                                                    .user.value.image!,
                                                placeholder: (context, url) =>
                                                    CircularProgressIndicator(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Obx(
                            () => TextField(
                              controller: name,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                ),
                                labelText: "Name",
                                hintText: name.text,
                                border: InputBorder.none,
                                filled: isEdit.value,
                                enabled: isEdit.value,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Obx(
                            () => TextField(
                              controller: about,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.info,
                                ),
                                labelText: "About",
                                hintText: about.text,
                                border: InputBorder.none,
                                filled: isEdit.value,
                                enabled: isEdit.value,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextField(
                            controller: email,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                              ),
                              labelText: "Email",
                              hintText: email.text,
                              border: InputBorder.none,
                              filled: isEdit.value,
                              enabled: false,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Obx(
                            () => TextField(
                              controller: phone,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.phone,
                                ),
                                labelText: "Number",
                                hintText: phone.text,
                                border: InputBorder.none,
                                filled: isEdit.value,
                                enabled: isEdit.value,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Obx(
                            () => profileController.isUpdating.value
                                ? CircularProgressIndicator(
                                    color: darkOnPrimaryContainer,
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      isEdit.value
                                          ? InkWell(
                                              onTap: () async {
                                                await profileController
                                                    .updateUserProfile(
                                                  name.text,
                                                  phone.text,
                                                  about.text,
                                                  imagePath.value,
                                                );
                                                isEdit.value = false;
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: darkButtonColor,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 10),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.save,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text("Save"),
                                                  ],
                                                ),
                                              ),
                                            )
                                          : InkWell(
                                              onTap: () {
                                                isEdit.value = true;
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: darkButtonColor,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 10),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.edit,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text("Edit"),
                                                  ],
                                                ),
                                              ),
                                            ),
                                    ],
                                  ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
