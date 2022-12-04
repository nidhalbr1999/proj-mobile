import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {


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
          SizedBox(height: 50.0),
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
          SizedBox(height:30.0 ),
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
          SizedBox(height:50.0 ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/Forgot');
            },
            child: Text('Forget Password?',style:TextStyle(fontSize: 18.0, )),
          ),
          SizedBox(height:50.0 ),
        OutlinedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/Homepage');
            },
            icon:Icon(Icons.login),
            label:Text('Login',
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
      ),)])



    );
  }
}
