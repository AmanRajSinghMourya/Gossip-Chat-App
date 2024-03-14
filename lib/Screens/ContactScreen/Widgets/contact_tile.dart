import 'package:flutter/material.dart';
import 'package:gossip/Config/colors.dart';

class ContactTile extends StatelessWidget {
  final String name;
  final IconData iconData;
  final VoidCallback voidCallback;
  const ContactTile({
    super.key,
    required this.name,
    required this.iconData,
    required this.voidCallback,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        voidCallback;
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: darkPrimaryColor,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: darkBackgroundColor,
              child: Icon(iconData),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              name,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: darkOnPrimaryContainer,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
