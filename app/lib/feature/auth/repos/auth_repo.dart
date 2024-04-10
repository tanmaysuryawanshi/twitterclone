import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/config.dart';
import '../models/user_modek.dart';

class AuthRepo {
  static Future<UserModel?> getUserRepo(String uid) async {
    try {
      Dio dio = Dio();
      final response = await dio.get("${Config.serverUrl}user/$uid");
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        // UserModel userModel = UserModel.fromMap(response.data);
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
