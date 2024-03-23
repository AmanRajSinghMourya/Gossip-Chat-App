import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gossip/Config/colors.dart';
import 'package:gossip/Config/strings.dart';
import 'package:gossip/Controllers/contact_collection.dart';
import 'package:gossip/Screens/GroupScreen/group_screen.dart';
import 'package:gossip/Screens/HomeScreen/Widgets/chat_list.dart';
import 'package:gossip/Screens/HomeScreen/Widgets/home_screen_drawer.dart';
import 'package:gossip/Screens/HomeScreen/Widgets/tabbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    //this is so that
    ContactCollectionController collectionController =
        Get.put(ContactCollectionController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBackgroundColor,
        title: Text(
          AppStrings.appName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),

        centerTitle: true,
        // put this later
        // leading: ,
        actions: [
          IconButton(
            onPressed: () {
              collectionController.getChatRoomList();
            },
            icon: Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
            ),
          ),
        ],

        bottom: thisTabbar(tabController, context),
        // bottom: thisTabbar(tabController, context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offAllNamed("/contactPage");
        },
        backgroundColor: darkPrimaryColor,
        child: Icon(
          Icons.add,
          color: darkOnPrimaryContainer,
          size: 30,
        ),
      ),

      drawer: HomeScreenDrawer(),

      //give the number of children same as the number of tabbars
      //defined in above "bottom"
      body: TabBarView(
        controller: tabController,
        children: [
          //TAB - 1

          ChatList(),

          //TAB - 2 - Group
          GroupScreen(),
          //TAB - 3
          ListView(
            children: [ListTile()],
          )
        ],
      ),
    );
  }
}
