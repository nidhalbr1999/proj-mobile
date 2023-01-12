import 'package:flutter/material.dart';
import 'package:project1/services/Maindraw.dart';
import 'package:project1/api/auth_services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Map responseMap=Map();

class FirstPage extends StatefulWidget {


  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    }
    );

    switch(index){
      case 0: {Navigator.pushNamed(context,'/ClothesShop');}break;
      case 1 :{Navigator.pushNamed(context,'/Homepage');}break;
      case 2 :{Navigator.pushNamed(context,'/Settings');}
    }
  }
  void pressToGet(String apiUrl,Map map)async{
    http.Response res= await AuthServices.getData(apiUrl);
    setState(() { map = jsonDecode(res.body);});
    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.blueAccent,
        actions: [IconButton(onPressed: ()async{
          pressToGet('User/2',responseMap);
          Navigator.pushNamed(context,'/Profile' );
        },
            icon:
            CircleAvatar(
              backgroundImage: AssetImage('assets/user.JPG'),
              radius: 30,
            ),
            iconSize: 60,
        )],
        elevation: 0.0,
      ),
        drawer: Drawer(
            child: MainDrawer()),
      body: Padding(
          padding: EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                    'CHOOSE YOUR',
                    style:TextStyle(
                        color:Colors.black,
                        letterSpacing: 2.0,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold
                    )
                ),
                Text(
                    'OUTFIT',
                    style:TextStyle(
                        color:Colors.black,
                        letterSpacing: 2.0,
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold
                    )
                ),
                SizedBox(height: 20.0),

                SizedBox(height: 10.0),
                Row(
                    children: <Widget>[
                      SizedBox(width: 10.0),

                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context,'/MyWardrobe' );
                        },
                        child: Image.asset(
                          'assets/1.JPG',
                          width: 150.0,
                          height: 150.0,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context,'/Calendar' );
                        },
                        child: Image.asset(
                          'assets/2.JPG',
                          width: 150.0,
                          height: 150.0,
                        ),
                      ),

                    ]
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context,'/matchmystyle' );
                  },
                  child: Image.asset(
                    'assets/3.JPG',
                    width: 300.0,
                    height: 100.0,
                  ),
                ),

                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context,'/FavoriteClothes');
                  },
                  child: Image.asset(
                    'assets/4.JPG',
                    width: 300.0,
                    height: 100.0,
                  ),
                ),

              ]
          )
      ),

    );
  }
}