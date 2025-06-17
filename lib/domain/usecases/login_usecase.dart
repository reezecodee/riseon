import '../entities/user_entity.dart';
import '../repositories/user_repository_interface.dart';

class LoginUseCase {
  final UserRepositoryInterface userRepository;
  
  LoginUseCase(this.userRepository);
  
  Future<UserEntity> execute(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email dan password tidak boleh kosong');
    }
    
    if (!_isValidEmail(email)) {
      throw Exception('Format email tidak valid');
    }
    
    if (password.length < 6) {
      throw Exception('Password minimal 6 karakter');
    }
    
    return await userRepository.login(email, password);
  }
  
  bool _isValidEmail(String email) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }
}
