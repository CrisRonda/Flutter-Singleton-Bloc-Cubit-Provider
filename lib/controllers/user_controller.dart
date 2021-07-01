import 'package:get/get.dart';
import 'package:states/models/user.dart';

class UserController extends GetxController {
  var existUser = false.obs;
  var user = new User().obs;

  int get professionCount => this.user.value.professions.length;

  setUser(User user) {
    this.user.value = user;
    this.existUser.value = true;
  }

  changeAgeUser(int age) {
    this.user.update((prevUser) {
      prevUser!.age = age;
    });
  }

  addProfessions(String profession) {
    this.user.update((prevUser) {
      prevUser!.professions = [
        ...prevUser.professions,
        profession,
      ];
    });
  }
}
