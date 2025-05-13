import 'dart:convert';

import 'package:whatsappclone/Common/constants.dart';
import 'package:whatsappclone/data/model/response/response.dart';
import 'package:whatsappclone/data/model/user/user.dart';
import 'package:http/http.dart' as http;


class UserService{
  static String _middleware = "/users";
  static String _register = "${Constants.DOMAIN_NAME}${_middleware}/register";

  static Future<ApiResponse> registerUser(UserModel user)async{
    try{
      final url =Uri.parse(_register);
      final response = await http.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'username': user.username,
            'first': user.first,
            'last': user.last,
            'email': user.email,
            'phone': user.phone,
            'password': user.password
          })
      );
      return ApiResponse.fromJson(jsonDecode(response.body));
    } catch (error){
      throw Exception(error);
    }
  }
}