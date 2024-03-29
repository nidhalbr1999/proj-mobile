import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project1/pages/LoginPage.dart';
import 'package:project1/api/auth_services.dart';
import 'package:http/http.dart' as http;


class profilepage extends StatefulWidget {


  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {


  File? _image;

  bool showPassword = false;

  final imagePicker=ImagePicker();
  Future getImage(source) async{
    final image=await ImagePicker.pickImage(source: source);
    setState(() {
      _image=File(image.path);
    });
  }


  void _onItemTapped(int index) {

    switch(index){
      case 0: {Navigator.pushNamed(context,'/ClothesShop');}break;
      case 1 :{Navigator.pushNamed(context,'/Homepage');}break;
      case 2 :{Navigator.pushNamed(context,'/Settings');}
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.blueAccent,
        leading:IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:Icon(Icons.arrow_back_ios)),
        elevation: 0.0,

      ),
        body: Padding(
        padding: EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
              'Profile',
              style:TextStyle(
                  color:Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold
              )
          ),
          SizedBox(height:20),
          PopupMenuButton(
              offset: const Offset(70, 60),
              onSelected: (x)async{
                if (x==1) {
                  await getImage(ImageSource.gallery);
                  AuthServices.uploadImage('User/{$id}/uploadimage/',_image,"PUT");
                }
                else {
                  await getImage(ImageSource.camera);
                  AuthServices.uploadImage('User/{$id}/uploadimage/',_image,"PUT");
                }
              },
              child: Center(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(serverurl+responseMap["image"].substring(3)),
                    backgroundColor: Colors.transparent,
                    radius: 80,
                  )),
              itemBuilder: (context) => [
                const PopupMenuItem(child: Text('upload picture'),value: 1, ),
                const PopupMenuItem(child: Text('use camera'),value: 2,),
              ]
          ),
          SizedBox( height: 30),
          Container(
            child:
          ListTile(
            leading: Text("Full Name:",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w700,
                )),
            title: Text(responseMap["username"],style:TextStyle(fontSize: 20,fontWeight: FontWeight.w400),
            ))
          ),
          ListTile(
              leading: Text("E-mail:",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w700,
                  )),
              title: Text(responseMap["email"],style:TextStyle(fontSize: 20,fontWeight: FontWeight.w400)),
          ),

          ListTile(
              leading: Text("Gender:",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w700,
                  )),
              title: Text(responseMap["sexe"],style:TextStyle(fontSize: 20,fontWeight: FontWeight.w400))
          ),
          ListTile(
              leading: Text("Age:",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w700,
                  )),
              title: Text(responseMap["age"].toString(),style:TextStyle(fontSize: 20,fontWeight: FontWeight.w400))
          ),

          SizedBox(height: 30,),
          OutlinedButton.icon(
              onPressed: () {
                print(responseMap);
                //Navigator.pushNamed(context,'/Login' );
              },
              icon:Icon(Icons.logout),
              label:Text('Logout',
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
              )

          ),


          ]



    )),
        bottomNavigationBar:BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart,size: 30.0),
    label: '',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.home_filled,size: 50.0),
    label: '',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.settings,size: 30.0),
    label: '',
    )],
    elevation:40.0,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.black,
    backgroundColor: Colors.blueAccent,
    onTap: _onItemTapped,
    ),
    );
  }
  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
            )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }

}
