import 'package:flutter/material.dart';

class Forgotpage extends StatelessWidget {


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
                      SizedBox(height: 60.0),
                      Text('Forgot Your Password?',
                          style:TextStyle(
                              color:Colors.black,
                              letterSpacing: 2.0,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold
                          )),
                      SizedBox(height: 50.0),
                      Text('Write your Email and we will send you an Authentication code',
                          style:TextStyle(
                              color:Colors.black,
                              letterSpacing: 2.0,
                              fontSize: 18.0,

                          )),
                      SizedBox(height: 20.0),
                      TextField(
                        decoration: InputDecoration(
                          filled: false,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              )),
                          hintText: 'Write your Email',
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
                      SizedBox(height:50.0 ),
                      OutlinedButton.icon(
                          onPressed: () {
                          },
                          icon:Icon(Icons.send),
                          label:Text('Send Request',
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


                    ]
                ),)])



    );
  }
}
