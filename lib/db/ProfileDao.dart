import 'package:pmobile913/db/db_helper.dart';
import 'package:pmobile913/domain/profile.dart';

class ProfileDao {
  Future<Profile> buscarProfile() async {
    var db = await DBHelper().initDB();

    var result = await db.query('profile', limit: 1);

    return Profile(
      username: result[0]['username'].toString(),
      email: result[0]['email'].toString(),
      telephone: result[0]['telephone'].toString(),
    );
  }
}
