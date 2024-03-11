import 'dart:convert';

import 'package:srs5/model/profile_user.dart';
import 'package:http/http.dart' as http;

class ProfileProvider {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/posts/1';

  Future<ProfileUser> fetchProfile() async {
    final response = await http.get(Uri.parse(_baseUrl));
    print(response);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load profileUser");
    }
  }
}
