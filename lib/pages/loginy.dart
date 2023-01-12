import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:project1/api/api_client.dart';
import 'package:project1/pages/Mainpage.dart';
import 'package:http/http.dart' as http;
import 'package:project1/api/auth_services.dart';
import 'package:project1/api/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  loginPressed() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_email, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {

        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', responseMap["access_token"]);
        localStorage.setString('email', _email);

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const MainpageState(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first);
      }
    } else {
      errorSnackBar(context, 'enter all required fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'Flutter Login',
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: TextFormField(
                          onChanged: (value) {
                            _email = value;
                          },
                          controller: email,
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(width: 1, color: Colors.grey)),
                              labelText: 'Email'),
                          validator: Validators.compose([
                            Validators.required('email is required'),
                            Validators.email('invalid email address')
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: TextFormField(
                          onChanged: (value) {
                            _password = value;
                          },
                          controller: password,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(width: 1, color: Colors.grey)),
                              labelText: 'Password'),
                          validator: Validators.compose(
                              [Validators.required('password is required')]),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: FloatingActionButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print(email.text);
                              print(password.text);
                              print('success');
                              loginPressed();
                            }
                          },
                          child: Text("Login"),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10)),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}