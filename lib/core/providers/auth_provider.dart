// core/providers/auth_provider.dart
import 'package:flutter/material.dart';
import 'package:learn_flutter/models/user_model.dart';
import 'package:learn_flutter/services/mock_service.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;
  UserModel? _currentUser;

  bool get isAuthenticated => _isAuthenticated;
  String get userRole => _currentUser?.role ?? 'guest';

  final MockService _mockService = MockService();

  Future<void> login(String email, String password) async {
    final users = await _mockService.fetchUsers();
    final user = users.firstWhere(
      (user) => user.email == email && user.password == password,
      orElse: () =>
          UserModel(id: 0, name: '', email: '', password: '', role: 'guest'),
    );

    if (user.role != 'guest') {
      _isAuthenticated = true;
      _currentUser = user;
      notifyListeners();
    }
  }

  void logout() {
    _isAuthenticated = false;
    _currentUser = null;
    notifyListeners();
  }
}
