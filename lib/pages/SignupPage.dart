import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

class SignupPage extends StatefulWidget {


  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      TextField(
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
                      TextField(
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
                      TextField(
                        decoration: InputDecoration(
                          filled: false,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              )),
                          hintText: 'Re-enter Password',
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
                      SizedBox(height: 35.0),
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
                    print(value);
                  },
                ),
                      SizedBox(height:50.0 ),
                      OutlinedButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context,'/Login');
                          },
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
                          )),]
              )),




                    ]
                ),



    );
  }
}
