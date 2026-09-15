import 'package:teste01/domain/user.dart';
import 'package:teste01/fake_api/fake_api.dart';

class UserDao {
  final FakeApi _api = FakeApi();

  Future<User?> login(String email, String password) async {
    return await _api.login(email, password);
  }
}