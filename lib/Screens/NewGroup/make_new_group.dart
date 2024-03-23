import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gossip/Config/colors.dart';
import 'package:gossip/Config/images.dart';
import 'package:gossip/Controllers/contact_collection.dart';
import 'package:gossip/Controllers/group_controller.dart';
import 'package:gossip/Screens/HomeScreen/Widgets/chat_list_tile.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.arrow_forward,
        ),
      ),
      body: Column(
        children: [
          Obx(
            () => Row(
              children: groupController.groupList
                  .map(
                    (element) => Container(
                      height: 100,
                      width: 100,
                      color: Colors.white,
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
