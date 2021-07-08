import 'package:hemobile/models/user_model.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:localstorage/localstorage.dart';

class UserRepository {
  late LocalStorage storage;

  UserRepository() {
    storage = new LocalStorage('user_data');
  }

  Future fetchHistory() async {}

  Future fetchAppointments() async {}

  saveUserToLocalStorage(UserModel user) {
    // UserModel('klean', 'klean@klean', '110.289.814-73').toJson()
    storage.setItem('user', user.toJson());
  }

  Future<UserModel> fetchUser() async {
    return storage.getItem('user');
  }
}
