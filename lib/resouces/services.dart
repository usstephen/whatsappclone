import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:whatsappclone/model/user.dart';

class Services {
  static const String HOST = "http://localhost:3000/";

  static const String register = HOST + "register";

  static Future<Map<String, dynamic>> registerUser({required UserModel user}) async {
    final url = Uri.parse(register);
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'uid': user.uid,
          'username': user.username,
          'first': user.first,
          'last': user.last,
          'email': user.email,
          'phone': user.phone,
          'password': user.password,
        }),
      );

      final data = jsonDecode(response.body);
      return data;
    } catch (e) {
      return {'failed': false, 'message': 'Registration failed: $e'};
    }
  }
}
