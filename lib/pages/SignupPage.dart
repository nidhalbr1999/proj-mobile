import 'package:date_field/date_field.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/api/auth_services.dart';
import 'package:project1/api/globals.dart';
import 'package:project1/pages/Mainpage.dart';
import 'package:http/http.dart' as http;
import 'package:wc_form_validators/wc_form_validators.dart';

class SignupPage extends StatefulWidget {


  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  String _email = '';
  String _password = '';
  String _name = '';
  String _date='';
  String _gender ='';
  List<bool> _isSelected = [true, false];

  createAccountPressed() async {
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email);
    if (emailValid) {
      http.Response response =
      await AuthServices.register(_name, _email, _password,_date,_gender);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const MainpageState(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first[0]);
      }
    } else {
      errorSnackBar(context, 'not valid');
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
        body:Column(
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

                      Text('Create a New Account',
                          style:TextStyle(
                              color:Colors.black,
                              letterSpacing: 2.0,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold
                          )),
                      SizedBox(height: 30.0),
                      TextField(
                        onChanged: (value) {
                          _name = value;
                        },
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
                      SizedBox(height: 20.0),
                      TextFormField(
                        onChanged: (value) {
                          _email = value;
                        },
                        validator: Validators.compose([
                          Validators.required('email is required'),
                        ]),
                        decoration: InputDecoration(
                          filled: false,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              )),
                          hintText: 'Email',
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
                      SizedBox(height:20.0 ),
                      TextFormField(
                        onChanged: (value) {
                          _password = value;
                        },
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
                      SizedBox(height: 20.0),

                DateTimeFormField(

                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.black45),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.event_note),
                    labelText: 'Birth Date',
                  ),
                  mode: DateTimeFieldPickerMode.date,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  onDateSelected: (DateTime value) {
                    _date="${value.year.toString()}-${value.month.toString().padLeft(2,'0')}-${value.day.toString().padLeft(2,'0')}";;
                  },
                ),
                      SizedBox(height: 20,),
                      ToggleButtons(
                        children: <Widget>[
                          Icon(Icons.male),
                          Icon(Icons.female),
                        ],
                        onPressed: (int index) {
                          setState(() {
                            for (int buttonIndex = 0; buttonIndex < _isSelected.length; buttonIndex++) {
                              _isSelected[buttonIndex] = buttonIndex == index;
                            }
                            _gender = _isSelected[0] ? "Male":"Female";

                          });
                        },
                        isSelected: _isSelected,
                      ),

                      SizedBox(height:30.0 ),
                      OutlinedButton.icon(
                          onPressed: ()=> createAccountPressed(),
                          icon:Icon(Icons.login),
                          label:Text('SignUp',
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
                      SizedBox(height: 40,),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/Login');
                          },
                          child: Text("You have already an Account?",style:TextStyle(fontSize: 18.0, ),
                          )),
                    ]
              )),




                    ]
                ),



    );
  }
}
