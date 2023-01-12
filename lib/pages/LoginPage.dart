import 'package:flutter/material.dart';
import 'package:project1/models/loginmodel.dart';
import 'package:project1/api/api_service.dart';
import 'package:wc_form_validators/wc_form_validators.dart';




class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  /*bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  late LoginRequestModel loginRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel('','');
  }*/

  /*bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }*/
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
                      SizedBox(height: 50.0),
                      TextFormField(
                       /* onSaved: (input) =>
                loginRequestModel.email = input,*/
                        controller: email,
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
                        validator: Validators.compose([
                          Validators.required('email is required'),
                          Validators.email('invalid email address')
                        ]),
                      ),
                      SizedBox(height:30.0 ),
                      TextFormField(
                        /*validator: (value) =>
                            Validator.validateEmail(value ?? ""),
                        controller: emailControlle,*/
                        controller: password,
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
                        validator: Validators.compose(
                            [Validators.required('password is required'),]),
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
                            if (_formKey.currentState!.validate()) {
                              print(email.text);
                              print(password.text);
                              print('success');
                            }
                            //Navigator.pushNamed(context, '/Homepage');
        /*if (validateAndSave()) {
    print(loginRequestModel.toJson());

    setState(() {
    isApiCallProcess = true;
    });

    APIService apiService = new APIService();
    apiService.login(loginRequestModel).then((value) {
    if (value != null) {
    setState(() {
    isApiCallProcess = false;
    });

    if (value.token.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successful")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.error)));
    }
    }
    });
        }*/
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
                ),)]))


    );
  }
}





