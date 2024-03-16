import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Storage._();

  static final Storage instance = Storage._();
  late SharedPreferences sharedpreferences;

  Future<void> initializeStorage() async {
    sharedpreferences = await SharedPreferences.getInstance();
  }

  Future<void> setUser(String token) async {
    debugPrint('set token ${token}');
    await sharedpreferences.setString("token", token);
    await sharedpreferences.setBool("isLoggedIn", true);
  }

  get isLoggedIn => sharedpreferences.getBool("isLoggedIn") ?? false;

  get token => sharedpreferences.getString("token") ?? "";

  Future<void> logout() async {
    await sharedpreferences.clear();
  }
}
