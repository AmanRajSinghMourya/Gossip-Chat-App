import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gossip/Config/colors.dart';
import 'package:gossip/Config/images.dart';

class UserInfo extends StatelessWidget {
  final String name;
  final String image;
  final String email;
  const UserInfo({
    super.key,
    required this.name,
    required this.image,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    // ProfileController profileController = Get.put(ProfileController());

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: darkPrimaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 57,
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                            color: darkBackgroundColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CachedNetworkImage(
                              // width: 10,
                              fit: BoxFit.cover,
                              imageUrl: image != ""
                                  ? image
                                  : AssetsImages.deafultImage,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name != "" ? name : "User",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      email,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: darkBackgroundColor,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.phone,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Phone"),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: darkBackgroundColor,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.video_call,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Video"),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: darkBackgroundColor,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.chat_bubble,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Chat"),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
