import 'package:flutter/material.dart';
import 'package:gossip/Config/colors.dart';
import 'package:gossip/Config/strings.dart';

thisTabbar(tabController, BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(60),
    child: Container(
      child: TabBar(
        // indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 4,
        unselectedLabelColor: darkOnSecondaryContainer,
        controller: tabController,
        labelStyle: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(color: darkOnPrimaryContainer),
        tabs: [
          Text(AppStrings.chats),
          Text(AppStrings.groups),
          Text(AppStrings.calls),
        ],
      ),
    ),
  );
}
