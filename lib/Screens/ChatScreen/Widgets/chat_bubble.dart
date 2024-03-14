import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gossip/Config/colors.dart';
import 'package:gossip/Config/images.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  //time of mesage
  final String time;
  //incoming message outgoing
  final bool isComming;
  //seen or not
  final String status;
  final String imageUrl;
  const ChatBubble({
    super.key,
    required this.message,
    required this.time,
    required this.isComming,
    required this.status,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 10,
      ),
      child: Column(
        crossAxisAlignment:
            isComming ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 5),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width / 1.7,
            ),
            decoration: BoxDecoration(
              color: darkPrimaryColor,
              borderRadius: isComming
                  ? BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(10),
                    )
                  : BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(0),
                    ),
            ),
            child: imageUrl == ""
                ? Text(
                    message,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: darkOnPrimaryContainer,
                          fontSize: 14,
                        ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(imageUrl)),
                      Text(
                        message,
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: darkOnPrimaryContainer,
                                  fontSize: 14,
                                ),
                      )
                    ],
                  ),
          ),
          Row(
            mainAxisAlignment:
                isComming ? MainAxisAlignment.start : MainAxisAlignment.end,
            children: [
              isComming
                  ? Text(
                      time,
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  : Row(
                      children: [
                        Text(
                          time,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        SvgPicture.asset(
                          AssetsImages.status,
                          width: 20,
                        ),
                      ],
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
