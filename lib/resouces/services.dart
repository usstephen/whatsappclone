import 'dart:convert';
import 'package:http/http.dart' as http;

class Services {
  static const String HOST = "http://localhost:3000/";

  static const String register = HOST + "register";

  static Future<Map<String, dynamic>> registerUser({
    required String uid,
    required String username,
    required String first,
    required String last,
    required String email,
    required String phone,
    required String password,
  }) async {
    final url = Uri.parse(register);

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'uid': uid,
          'username': username,
          'first': first,
          'last': last,
          'email': email,
          'phone': phone,
          'password': password,
        }),
      );

      final data = jsonDecode(response.body);
      return data;
    } catch (e) {
      return {'failed': false, 'message': 'Registration failed: $e'};
    }
  }
}
