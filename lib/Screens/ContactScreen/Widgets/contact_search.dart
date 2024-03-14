import 'package:flutter/material.dart';
import 'package:gossip/Config/colors.dart';

class ContactSearch extends StatelessWidget {
  const ContactSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: darkPrimaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.done,
              onSubmitted: (value) => {print(value)},
              decoration: InputDecoration(
                hintText: "Search Contact",
                prefixIcon: Icon(
                  Icons.search,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
