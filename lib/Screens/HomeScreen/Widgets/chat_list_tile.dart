import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gossip/Config/colors.dart';

class ChatTile extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String lastChat;
  final String lastTime;
  const ChatTile({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.lastChat,
    required this.lastTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: darkPrimaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: darkBackgroundColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: CachedNetworkImage(
                            // width: 10,
                            fit: BoxFit.cover,
                            imageUrl: imageUrl,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          textAlign: TextAlign.start,
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: darkOnPrimaryContainer,
                                  ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          lastChat,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              lastTime,
              style: Theme.of(context).textTheme.labelMedium,
            )
          ],
        ),
      ),
    );
  }
}
