// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:http/http.dart' as http;

class ApiService {
  static const base_url = "https://xi-rpl.herokuapp.com/api";

  Future register(String name, String email, String password,
      String password_confirmation) async {
    Uri url = Uri.parse("$base_url/register");
    final response = await http.post(url,
        body: ({
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": password_confirmation
        }));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
