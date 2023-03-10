import 'dart:convert';
import 'package:fodee/Model/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStore{
  Future<void> setUser(UserModel user) async {
      SharedPreferences local= await SharedPreferences.getInstance();
    local.setString("user", jsonEncode(user.toJson()));
  }
  Future<UserModel> getUser() async {
    SharedPreferences local= await SharedPreferences.getInstance();
    String userLocal =local.getString("user")?? "";
    UserModel newUser =UserModel.fromJson(jsonDecode(userLocal));
    return newUser;
  }
}