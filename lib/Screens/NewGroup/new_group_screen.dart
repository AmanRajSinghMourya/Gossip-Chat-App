import 'package:flutter/material.dart';

class NewGroupScreen extends StatelessWidget {
  const NewGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Group Title"),
      ),
      body: Column(
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
