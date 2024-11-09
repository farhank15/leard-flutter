import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/user_model.dart';

class AuthService {
  Future<List<UserModel>> fetchUsers() async {
    final String response =
        await rootBundle.loadString('web/assets/data/mock_data.json');
    final data = json.decode(response);
    return (data['users'] as List)
        .map((user) => UserModel.fromJson(user))
        .toList();
  }

  Future<UserModel?> getUserFromToken(String token) async {
    List<UserModel> users = await fetchUsers();

    String userId = token.split("_").last;

    try {
      return users.firstWhere((user) => user.id.toString() == userId);
    } catch (e) {
      return null;
    }
  }
}
