import "package:my_app/User.dart";
import "package:my_app/repo/UserRepository.dart";

class Userservice {
  Userrepository userrepository;

  Userservice({required this.userrepository});

  List<User> getUsers() {
    return userrepository.getUsers();
  }
}
