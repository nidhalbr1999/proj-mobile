import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// 'package:url_launcher/url_launcher_string.dart';
import 'dart:async';

class clothesshop extends StatefulWidget {

  @override
  State<clothesshop> createState() => _clothesshopState();
}

class _clothesshopState extends State<clothesshop> {

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
  launchURL(String url) async {
    if (!await launch(url))
    {
      throw 'Could not launch $url';
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
        actions: [IconButton(onPressed: (){
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
      body: Padding(
          padding: EdgeInsets.fromLTRB(40.0, 70.0, 40.0, 0.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                    'Clothes Shop',
                    style:TextStyle(
                        color:Colors.black,
                        letterSpacing: 2.0,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold
                    )
                ),

                SizedBox(height: 25.0),

          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                        children: <Widget> [
                          const Padding (padding: EdgeInsets.fromLTRB(0.0,0.0,0.0,50.0)),
                          GestureDetector(
                            onTap: ()  {
                              String url= 'https://www.zara.com/tn/';
                              launchURL(url);
                            },
                            child:Container(
                              decoration: BoxDecoration (
                                boxShadow: const [
                                  BoxShadow (
                                    color:Colors.black12,
                                    blurRadius: 5.0,
                                    blurStyle: BlurStyle.normal,
                                  ) ],
                                borderRadius: BorderRadius.circular(15),
                                image:const DecorationImage(
                                    image:AssetImage('assets/zara.png'),
                                    fit:BoxFit.cover
                                ),
                              ),
                              width:140,
                              height: 80,
                            ),
                          ),
                        ]
                    ),
                    Column(
                        children:<Widget> [
                          Padding ( padding: EdgeInsets.fromLTRB(0.0,0.0,0.0,50.0)),
                          GestureDetector(
                            onTap: () {
                              String url= 'https://www.decathlon.tn/';
                              launchURL(url);
                            },
                            child:Container(
                              decoration: BoxDecoration (
                                boxShadow: const [
                                  BoxShadow (
                                    color:Colors.black12,
                                    blurRadius: 5.0,
                                    blurStyle: BlurStyle.normal,
                                  ) ],
                                borderRadius: BorderRadius.circular(15),
                                image: const DecorationImage (
                                  image:AssetImage('assets/decatlon.jpg'),
                                  fit:BoxFit.cover,
                                ),
                              ),
                              width: 140,
                              height:80,
                            ),
                          ),
                        ]
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                        children: <Widget> [
                          const Padding (padding: EdgeInsets.fromLTRB(0.0,0.0,0.0,50.0)),
                          GestureDetector(
                            onTap: () {
                              String url= 'https://www.gucci.com/fr/fr/';
                              launchURL(url);
                            },
                            child:Container(
                              decoration: BoxDecoration (
                                boxShadow: const [
                                  BoxShadow (
                                    color:Colors.black12,
                                    blurRadius: 5.0,
                                    blurStyle: BlurStyle.normal,
                                  ) ],
                                borderRadius: BorderRadius.circular(15),
                                image:const DecorationImage(
                                    image:AssetImage('assets/gucci.jpg'),
                                    fit:BoxFit.cover
                                ),
                              ),
                              width:140,
                              height: 80,
                            ),
                          ),
                        ]
                    ),
                    Column(
                        children:<Widget> [
                          Padding ( padding: EdgeInsets.fromLTRB(0.0,0.0,0.0,50.0)),
                          GestureDetector(
                            onTap: () {
                              String url= 'https://www.bershka.com/fr/';
                              launchURL(url);
                            },
                            child:Container(
                              decoration: BoxDecoration (
                                boxShadow: const [
                                  BoxShadow (
                                    color:Colors.black12,
                                    blurRadius: 5.0,
                                    blurStyle: BlurStyle.normal,
                                  ) ],
                                borderRadius: BorderRadius.circular(15),
                                image: const DecorationImage (
                                  image:AssetImage('assets/bershka-logo.jpg'),
                                  fit:BoxFit.cover,
                                ),
                              ),
                              width: 140,
                              height:80,
                            ),
                          ),
                        ]
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                        children: <Widget> [
                          const Padding (padding: EdgeInsets.fromLTRB(0.0,0.0,0.0,50.0)),
                          GestureDetector(
                            onTap: () {
                              String url= 'https://www.pullandbear.com/';
                              launchURL(url);
                            },
                            child:Container(
                              decoration: BoxDecoration (
                                boxShadow: const [
                                  BoxShadow (
                                    color:Colors.black12,
                                    blurRadius: 5.0,
                                    blurStyle: BlurStyle.normal,
                                  ) ],
                                borderRadius: BorderRadius.circular(15),
                                image:const DecorationImage(
                                    image:AssetImage('assets/pull&bear.jpg'),
                                    fit:BoxFit.cover
                                ),
                              ),
                              width:140,
                              height: 80,
                            ),
                          ),
                        ]
                    ),
                    Column(
                        children:<Widget> [
                          Padding ( padding: EdgeInsets.fromLTRB(0.0,0.0,0.0,50.0)),
                          GestureDetector(
                            onTap: () {
                              String url= 'https://www.adidas.fr/';
                              launchURL(url);
                            },
                            child:Container(
                              decoration: BoxDecoration (
                                boxShadow: const [
                                  BoxShadow (
                                    color:Colors.black12,
                                    blurRadius: 5.0,
                                    blurStyle: BlurStyle.normal,
                                  ) ],
                                borderRadius: BorderRadius.circular(15),
                                image: const DecorationImage (
                                  image:AssetImage('assets/adidas.webp'),
                                  fit:BoxFit.cover,
                                ),
                              ),
                              width: 140,
                              height:80,
                            ),
                          ),
                        ]
                    ),
                  ],
                ),
              ]
          )
              ]
          )
      ),
    );
  }
}
