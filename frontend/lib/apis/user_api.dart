import 'dart:convert';

import 'package:frontend/apis/url.dart';
import 'package:frontend/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<String?> login(String email, String password) async {
  String loginUrl = "$url/users/login";

  http.Response response = await http.post(Uri.parse(loginUrl),
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode({
        "email": email,
        "password": password
      }));

  var result = json.decode(response.body);
  if(response.statusCode == 200){
    SharedPreferences sp = await SharedPreferences.getInstance();
    UserModel user = UserModel.fromJson(result);
    sp.setString("token", user.token);
    return null;
  }


  return result["message"] as String;
}