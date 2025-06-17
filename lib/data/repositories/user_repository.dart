import '../models/user_model.dart';
import '../services/api_service.dart';

abstract class UserRepositoryInterface {
  Future<UserModel?> getCurrentUser();
  Future<UserModel> login(String email, String password);
  Future<void> logout();
}

class UserRepository implements UserRepositoryInterface {
  final ApiService _apiService = ApiService();
  
  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final response = await _apiService.get('user/profile');
      return UserModel.fromJson(response['data']);
    } catch (e) {
      return null;
    }
  }
  
  @override
  Future<UserModel> login(String email, String password) async {
    final response = await _apiService.post('auth/login', {
      'email': email,
      'password': password,
    });
    return UserModel.fromJson(response['data']);
  }
  
  @override
  Future<void> logout() async {
    await _apiService.post('auth/logout', {});
  }
}