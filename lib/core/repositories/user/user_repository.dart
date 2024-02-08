

import '../../providers/user/user_provider.dart';
import '../../providers/user/user_response.dart';

class UserRepository {
  final UserProvider provider;
  const UserRepository(this.provider);

  

  Future<UserResponse> getUserData() async {
    return provider.getUserData();
  }

  Future<UserResponse> logout() async {
    return provider.logout();
  }

  // Future<UserResponse> uploadPhoto(File image) async {
  //   return provider.uploadPhoto(image);
  // }

  // Future<UserResponse> updateFullName(String fullname) async {
  //   return provider.updateFullName(fullname);
  // }
}
