
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static Future<void> updateToken() async {
    final prefs = await SharedPreferences.getInstance();
    String newToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4NzQ1ZGY2NTU1NGIzMjg5MTJlNTZkMiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzUzNjc4MDg5fQ.oAcJG01vyFgfrTw0u28nIIsqYib2QNgbkBowtNYYcA4";

    await prefs.setString('token', newToken);
    print('✅ Token updated successfully!');
  }
}