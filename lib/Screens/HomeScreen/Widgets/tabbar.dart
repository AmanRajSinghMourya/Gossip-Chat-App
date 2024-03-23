import 'package:flutter/material.dart';
import 'package:gossip/Config/colors.dart';
import 'package:gossip/Config/strings.dart';

thisTabbar(tabController, BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(50),
    child: Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TabBar(
        indicatorColor: darkOnPrimaryContainer,
        indicatorWeight: 2,
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: darkOnSecondaryContainer,
        controller: tabController,
        labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 18,
              letterSpacing: 1,
              color: darkOnPrimaryContainer,
            ),
        tabs: [
          Text(AppStrings.chats),
          Text(AppStrings.groups),
          Text(AppStrings.calls),
        ],
      ),
    ),
  );
}
