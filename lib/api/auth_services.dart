import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:project1/api/globals.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';


String serverurl='https://1635-196-203-166-194.eu.ngrok.io/';

class AuthServices {
  static String token ='';
  static Future<http.Response> register(
      String name, String email, String password,String date,String gender) async {
    Map data = {
      "username": name,
      "email": email,
      "hashed_password": password,
      "birth_date": date,
      "sexe": gender,
    };
    var body = json.encode(data);
    var url = Uri.parse(serverurl+'User/');
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
    var url = Uri.parse(serverurl+'login/');
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
    var url = serverurl+ apiUrl;
    token=await getToken();
    return await http.get(Uri.parse(url), headers: _headers());
  }
  static Future<http.Response>postData(data, apiUrl) async {
    var url = serverurl + apiUrl;
    token=await getToken();
    return await http.post(Uri.parse(url),
        body: jsonEncode(data), headers: _headers());
  }
  static Future<http.Response>deleteData(apiUrl) async {
    var url = serverurl + apiUrl;
    token=await getToken();
    return await http.delete(Uri.parse(url),headers: _headers());
  }



  static void uploadFile(apiUrl,File? file,String method) async {
    var url = Uri.parse(serverurl + apiUrl);
    var request = http.MultipartRequest(method, url);
    token=await getToken();
    request.headers['accept'] = 'application/json';
    request.headers['Content-Type'] = 'multipart/form-data';
    request.headers['Authorization']='Bearer $token';
    //request.fields['user_id'] = '6';
    final file1 = await file?.readAsBytes();
    final stream = new http.ByteStream.fromBytes(file1);
    final length = await file1?.length;
    final multipartFile = http.MultipartFile('file', stream, length, filename: "name");
    request.files.add(multipartFile);

    final response = await request.send();
    print(response.reasonPhrase);
  }

  static void uploadImage(apiUrl,File? image,String method) async {
    final request = http.MultipartRequest(
      method,
      Uri.parse(serverurl + apiUrl),
    );
    token=await getToken();
    request.headers['Authorization']='Bearer $token';

    request.files.add(
      await http.MultipartFile.fromPath(
        'file', // NOTE - this value must match the 'file=' at the start of -F
        image?.path,
        contentType: MediaType('image', 'png'),
      ),
    );

    final response = await http.Response.fromStream(await request.send());

    print(response.body);
    print(response.statusCode);
  }


  static _headers() => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
    'ngrok-skip-browser-warning': '111'
  };

  }

