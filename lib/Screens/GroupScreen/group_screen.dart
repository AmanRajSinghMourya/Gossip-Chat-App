import 'package:flutter/material.dart';
import 'package:gossip/Config/images.dart';
import 'package:gossip/Screens/HomeScreen/Widgets/chat_list_tile.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChatTile(
          name: "name",
          imageUrl: AssetsImages.deafultImage,
          lastChat: "lastChat",
          lastTime: "lastTime",
        ),
      ],
    );
  }
}
