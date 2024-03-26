import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gossip/Config/colors.dart';
import 'package:gossip/Config/images.dart';
import 'package:gossip/Controllers/contact_collection.dart';
import 'package:gossip/Controllers/group_controller.dart';
import 'package:gossip/Screens/HomeScreen/Widgets/chat_list_tile.dart';
import 'package:gossip/Screens/NewGroup/new_group_screen.dart';

class NewGroup extends StatelessWidget {
  const NewGroup({super.key});
  @override
  Widget build(BuildContext context) {
    ContactCollectionController collectionController =
        Get.put(ContactCollectionController());
    GroupController groupController = Get.put(GroupController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBackgroundColor,
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton(
          onPressed: () {
            if (groupController.groupList.isEmpty) {
              Get.snackbar("Error", "Please select atleast one member");
            } else {
              Get.to(NewGroupScreen());
            }
          },
          child: Icon(
            Icons.arrow_forward,
          ),
        ),
      ),
      body: Column(
        children: [
          Obx(
            () => Row(
              children: groupController.groupList
                  .map(
                    (element) => Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          height: 70,
                          width: 70,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl:
                                  element.image ?? AssetsImages.deafultImage,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              groupController.groupList.remove(element);
                            },
                            child: Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.close,
                                size: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "Select Contact",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: StreamBuilder(
                stream: collectionController.getContact(),
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
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            groupController.selectMember(snapshot.data![index]);
                          },
                          child: ChatTile(
                            name: snapshot.data![index].name ?? "User",
                            imageUrl: snapshot.data![index].image ??
                                AssetsImages.deafultImage,
                            lastChat: "snapshot.data![index].",
                            lastTime: "",
                          ),
                        );
                      },
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
