import 'package:my_app/User.dart';
import 'package:my_app/UserService.dart';
import 'package:my_app/repo/UserRepository.dart';

void main() {
  Userservice userservice = Userservice(userrepository: Userrepository());
  List<User> users = userservice.getUsers();
  for (var user in users) {
    print(user.name);
    print(user.city);
  }
}
