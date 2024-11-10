import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:learn_flutter/models/user_model.dart';
import 'package:learn_flutter/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;
  UserModel? _currentUser;
  final AuthService _authService = AuthService();

  bool get isAuthenticated => _isAuthenticated;
  UserModel? get currentUser => _currentUser;

  Future<void> loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('jwt_token');
    if (token != null) {
      _isAuthenticated = true;
      _currentUser = await _authService.getUserFromToken(token);
    } else {
      _isAuthenticated = false;
    }
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    final users = await _authService.fetchUsers();
    final user = users.firstWhere(
      (user) => user.email == email && user.password == password,
      orElse: () =>
          UserModel(id: 0, name: '', email: '', password: '', role: 'guest'),
    );

    if (user.role != 'guest') {
      _isAuthenticated = true;
      _currentUser = user;

      String fakeToken = 'fake_jwt_token_${user.id}';
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('jwt_token', fakeToken);

      notifyListeners();
    }
  }

  Future<void> logout() async {
    _isAuthenticated = false;
    _currentUser = null;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt_token'); // Clear the JWT token

    notifyListeners(); // Notify listeners about the authentication change
  }
}
