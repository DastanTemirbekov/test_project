import 'package:test_project/screens/user_screen/bloc/user_provider.dart';
import 'package:test_project/screens/user_screen/model/user_model.dart';

class UserRepository {
  Future<List<UserModel>> getUser() {
    UserProvider provider = UserProvider();
    return provider.getUser();
  }
}
