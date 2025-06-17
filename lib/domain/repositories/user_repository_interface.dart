import '../entities/user_entity.dart';

abstract class UserRepositoryInterface {
  Future<UserEntity?> getCurrentUser();
  Future<UserEntity> login(String email, String password);
  Future<void> logout();
  Future<void> updateProfile(UserEntity user);
}
