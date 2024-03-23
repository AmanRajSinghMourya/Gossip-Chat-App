import 'package:get/get.dart';
import 'package:gossip/Model/user_model.dart';

class GroupController extends GetxController {
  RxList<UserModel> groupList = <UserModel>[].obs;

  void selectMember(UserModel userModel) {
    if (groupList.contains(userModel)) {
      groupList.remove(userModel);
      print("REMOVED");
    } else {
      groupList.add(userModel);
      print("ADDED");
    }
  }
}
