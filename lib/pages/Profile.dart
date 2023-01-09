import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class profilepage extends StatefulWidget {


  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {


  File? _image;

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.blueAccent,
        leading:IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:Icon(Icons.arrow_back_ios)),
        /*actions: [IconButton(onPressed: (){},
            icon:
            CircleAvatar(
              backgroundImage: AssetImage('assets/user.JPG'),
              radius: 30,
            )
        )],*/
        elevation: 0.0,

      ),
        body: Padding(
        padding: EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
              'User Name',
              style:TextStyle(
                  color:Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold
              )
          ),
          SizedBox(height:10),
          PopupMenuButton(
              offset: const Offset(70, 60),
              onSelected: (x){
                if (x==1) {
                  getImage(ImageSource.gallery);
                }
                else {
                  getImage(ImageSource.camera);
                }
              },
              child: Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/user.JPG'),
                    radius: 80,
                  )),
              itemBuilder: (context) => [
                const PopupMenuItem(child: Text('upload picture'),value: 1, ),
                const PopupMenuItem(child: Text('use camera'),value: 2,),
              ]
          ),
          SizedBox(height:20),
          OutlinedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context,'/Login' );
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
}
