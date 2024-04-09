import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class UsersAPI {
  bool savedUsername = false;

  Future<SharedPreferences> _getPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  Future<String> getUsers() async {
    var url = Uri.https('127.0.0.1:8000', '/users');
    var response = await http.get(url);
    return response.body;
  }

  Future<String> getUsername() async {
    var prefs = await _getPrefs();
    String username = prefs.getString('username') ?? 'no_username_set';

    if (username == 'no_username_set') {
      var url = Uri.https('http://127.0.0.1:8000/users', '');
      var response = await http.get(url);
    }

    return username;
  }

  Future<void> setUsername(String username) async {
    var prefs = await _getPrefs();
    await prefs.setString('username', username);
  }
}
