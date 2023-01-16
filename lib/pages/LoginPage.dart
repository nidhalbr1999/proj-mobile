import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import 'package:project1/pages/Mainpage.dart';
import 'package:http/http.dart' as http;
import 'package:project1/api/auth_services.dart';
import 'package:project1/api/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

int id=0;
Map<dynamic,dynamic> responseMap=Map();


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  bool isLoading=true;

  Future<Map<dynamic,dynamic>> pressToGetMap (String apiUrl)async{
    Map<dynamic,dynamic> map=Map();
    http.Response res= await AuthServices.getData(apiUrl);
    setState(() { map = jsonDecode(res.body);
              if (map["image"]==null){
                  map["image"]=".//static//images//1ac6c2bcec5f262f4837.png";
              }
    });
    return map;
  }

  Future<int> getid(String urlapi)async{
    http.Response res= await AuthServices.getData(urlapi);
    print(res.body);
    return int.parse(res.body);
  }


  loginPressed() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_email, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {

        SharedPreferences localStorage = await SharedPreferences.getInstance();
        setState((){
          localStorage.setString('token', responseMap["access_token"]);
          localStorage.setString('email', _email);
        });



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
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
        ),
        body:Form(
            key:_formKey,
            child:Column(
            children: <Widget>[
              Image.asset(
                'assets/bar.png',
                width: 720.0,
                height: 150.0,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40.0, 0, 40.0, 0),
                child:Column(
                    children: <Widget>[

                      Text('Hello There',
                          style:TextStyle(
                              color:Colors.black,
                              letterSpacing: 2.0,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold
                          )),
                      Text('Welcome Back',
                          style:TextStyle(
                              color:Colors.black,
                              letterSpacing: 2.0,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold
                          )),
                      SizedBox(height: 70.0),
                      TextFormField(
                        onChanged: (value) {
                          _email = value;
                        },
                        controller: email,
                        validator: Validators.compose([
                          Validators.required('email is required'),
                          Validators.email('invalid email address')
                        ]),
                        decoration: InputDecoration(
                          filled: false,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              )),
                          hintText: 'Username',
                          hintStyle: TextStyle(fontSize: 20),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),

                        ),
                        cursorColor: Colors.blue,

                      ),
                      SizedBox(height:30.0 ),
                      TextFormField(
                        onChanged: (value) {
                          _password = value;
                        },
                        controller: password,
                        validator: Validators.compose(
                            [Validators.required('password is required'),]),
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: false,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              )),
                          hintText: 'Password',
                          hintStyle: TextStyle(fontSize: 20),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),

                        ),
                        cursorColor: Colors.blue,

                      ),


                      SizedBox(height:70.0 ),
                      OutlinedButton.icon(
                          onPressed: ()async {
                            if (_formKey.currentState!.validate()) {
                                await loginPressed();
                                id=await getid('User/user_id');
                                responseMap=await pressToGetMap('User/{$id}');

                            }
                          },
                          icon: Icon(Icons.login),
                          label:
                          Text('Login',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black
                              )),

                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              minimumSize:  Size.fromHeight(50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15), // <-- Radius
                              ),
                              side: BorderSide(width: 2.0, color: Colors.black)
                          )),
                      SizedBox(height:50.0 ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/Signup');
                          },
                          child: Text("Create Account",style:TextStyle(fontSize: 18.0, ),
                          )),

                    ]
                ),)]))


    );
  }
}





