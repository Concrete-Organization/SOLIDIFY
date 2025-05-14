import 'package:jwt_decoder/jwt_decoder.dart';

class JwtHelper {
  static String? getUserId(String token) {
    try {
      final Map<String, dynamic> payload = JwtDecoder.decode(token);
      return payload['Id']?.toString();
    } catch (e) {
      return null;
    }
  }

  static String? getUserName(String token) {
    try {
      final Map<String, dynamic> payload = JwtDecoder.decode(token);
      return payload['User Name']?.toString();
    } catch (e) {
      return null;
    }
  }

  static String? getUserRole(String token) {
    try {
      final Map<String, dynamic> payload = JwtDecoder.decode(token);
      return payload['role']?.toString();
    } catch (e) {
      return null;
    }
  }
}