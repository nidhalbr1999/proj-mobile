import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project1/api/auth_services.dart';
import 'package:http/http.dart' as http;
import 'package:project1/pages/LoginPage.dart';


List outfitlist=[];

class matchmystyle extends StatefulWidget {

  @override
  State<matchmystyle> createState() => _matchmystyleState();
}

class _matchmystyleState extends State<matchmystyle> {


  void _onItemTapped(int index) {
    switch(index){
      case 0: {Navigator.pushNamed(context,'/ClothesShop');}break;
      case 1 :{Navigator.pushNamed(context,'/Homepage');}break;
      case 2 :{Navigator.pushNamed(context,'/Settings');}
    }
  }

  Future<List> getFullOutfit(String apiurl) async{
    http.Response res= await AuthServices.getData(apiurl);
    if (jsonDecode(res.body)is Map){
      return [];
    }else{
    return jsonDecode(res.body);}
  }
  Future openDialog() => showDialog(context: context,
      builder: (content)=>AlertDialog(
        title:Text('Sorry'),
        content: Text('we didnt find an outfit for you, update your wardrobe and try again'),
        actions: [
          TextButton(child: Text('done'),onPressed:()=>
              Navigator.pop(context))
        ],

      ));
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
      actions: [IconButton(onPressed: (){
        Navigator.pushNamed(context,'/Profile' );
      },
      icon:
      CircleAvatar(
      backgroundImage: NetworkImage(serverurl+responseMap["image"].substring(3)),
        backgroundColor: Colors.transparent,
      radius: 30,
    ),
        iconSize: 60,
    )],
      elevation: 0.0,

),
        body: Padding(
            padding: EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                      'Match My',
                      style:TextStyle(
                          color:Colors.black,
                          letterSpacing: 2.0,
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  Text(
                      'Style',
                      style:TextStyle(
                          color:Colors.black,
                          letterSpacing: 2.0,
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  SizedBox(height: 25.0),

                  GestureDetector(
                    onTap: () {

                      Navigator.pushNamed(context,'/Mywarderobesug' );

                    },
                    child: Image.asset(
                      'assets/pic1.JPG',
                      width: 350.0,
                      height: 200.0,
                    ),
                  ),
                  SizedBox(height: 10.0),


                        GestureDetector(
                          onTap: () async{
                            outfitlist=await getFullOutfit('clothes/suggest/');
                            if (outfitlist.isNotEmpty) {
                              Navigator.pushNamed(context, '/FullOutfit');
                            }else{
                              openDialog();
                            }
                          },
                          child: Image.asset(
                            'assets/pic2.JPG',
                            width: 150.0,
                            height: 150.0,
                          ),
                        ),

                ]
            )
        ),
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
        selectedItemColor:Colors.black,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
     );
  }
}
