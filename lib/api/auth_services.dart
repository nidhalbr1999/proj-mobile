import 'dart:convert';

import 'package:project1/api/globals.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  static String token ='';
  static Future<http.Response> register(
      String name, String email, String password) async {
    Map data = {
      "id":10,
      "username": name,
      "email": email,
      "hashed_password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse('http://10.0.2.2:8000/User/');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> login(String email, String password) async {
   Map data = {
      "username": email,
      "password": password,
    };
    var url = Uri.parse('http://10.0.2.2:8000/login/');
    http.Response response = await http.post(
      url,
      body: data,
    );
    //print(response.body);
    return response;
  }


  static Future<String> getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String token = localStorage.getString("token")!;
    return token;
    }

    static Future<http.Response>getData(apiUrl) async {
    var url = 'http://10.0.2.2:8000/'+ apiUrl;
    await getToken();
    return await http.get(Uri.parse(url), headers: _headers());
  }
  static Future<http.Response>postData(data, apiUrl) async {
    var url = 'http://10.0.2.2:8000/' + apiUrl;
    await getToken();
    return await http.post(Uri.parse(url),
        body: jsonEncode(data), headers: _headers());
  }

  static _headers() => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
    'ngrok-skip-browser-warning': '111'
  };

  }

