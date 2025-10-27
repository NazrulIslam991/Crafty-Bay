import 'dart:convert';

import 'package:crafty_bay/features/shared/data/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final String _tokenKey = "access-token";
  final String _userDataKey = "user-model";
  String? accessToken;
  UserModel? userModel;

  Future<void> saveUserData(UserModel model, String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_tokenKey, token);
    await sharedPreferences.setString(_userDataKey, jsonEncode(model.toJson()));
    accessToken = token;
    userModel = model;
  }

  Future<bool> isUserAlreadyLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_tokenKey);
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> loadUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_tokenKey);
    String? userData = sharedPreferences.getString(_userDataKey);

    if (token != null && userData != null) {
      accessToken = token;
      userModel = UserModel.fromJson(jsonDecode(userData));
    }
  }

  Future<void> clearUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
