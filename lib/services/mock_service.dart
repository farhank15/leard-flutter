// services/mock_service.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/user_model.dart';

class MockService {
  Future<List<UserModel>> fetchUsers() async {
    final String response =
        await rootBundle.loadString('web/assets/data/mock_data.json');
    final data = json.decode(response);
    return (data['users'] as List)
        .map((user) => UserModel.fromJson(user))
        .toList();
  }
}
