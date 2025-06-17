import 'package:flutter/material.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/user_repository.dart';

class AuthProvider extends ChangeNotifier {
  final UserRepository _userRepository = UserRepository();
  
  UserModel? _currentUser;
  bool _isLoading = false;
  String? _errorMessage;
  
  UserModel? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => _currentUser != null;
  
  Future<void> login(String email, String password) async {
    _setLoading(true);
    _errorMessage = null;
    
    try {
      _currentUser = await _userRepository.login(email, password);
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _setLoading(false);
    }
  }
  
  Future<void> logout() async {
    _setLoading(true);
    
    try {
      await _userRepository.logout();
      _currentUser = null;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _setLoading(false);
    }
  }
  
  Future<void> checkAuthStatus() async {
    _setLoading(true);
    
    try {
      _currentUser = await _userRepository.getCurrentUser();
      notifyListeners();
    } catch (e) {
      _currentUser = null;
    } finally {
      _setLoading(false);
    }
  }
  
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
