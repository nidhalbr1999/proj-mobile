import 'package:flutter/material.dart';
import 'package:project1/api/auth_services.dart';
import 'package:project1/pages/MyWardrobe.dart';
import 'package:project1/pages/MywardrobeSug.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:project1/pages/LoginPage.dart';

List outfitlistT=[];

class Topssug extends StatefulWidget {
  const Topssug({Key? key}) : super(key: key);

  @override
  State<Topssug> createState() => _TopssugState();
}

class _TopssugState extends State<Topssug> {

  void _onItemTapped(int index) {
    switch(index){
      case 0: {Navigator.pushNamed(context,'/ClothesShop');}break;
      case 1 :{Navigator.pushNamed(context,'/Homepage');}break;
      case 2 :{Navigator.pushNamed(context,'/Settings');}
    }
  }
  Future<List> getOutfit(String apiurl) async{
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
      body:SingleChildScrollView( child:Padding(
          padding: EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                    'Tops',
                    style:TextStyle(
                        color:Colors.black,
                        letterSpacing: 2.0,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold
                    )
                ),


                SizedBox(height: 50,width: 0,),
                Wrap(
                  children: <Widget>[
                    for (int i=0;i<responseList1.length;i++)
                      Container(width: 150, height: 150, child:GestureDetector(
                          child: Image.network(serverurl+responseList1[i]["image"].substring(3)),
                          onTap: ()async{
                            outfitlistT=await getOutfit('clothes/outfit/?image_path=${responseList1[i]["image"]}');
                            if (outfitlistT.isNotEmpty) {
                              print(outfitlistT);
                              Navigator.pushNamed(context, '/Outfit');
                            }else{
                              openDialog();
                            }
                          }

                      ),
                      ),
                  ],
                  runSpacing: 8.0,
                  textDirection: TextDirection.ltr,
                ),

                SizedBox(height: 50,width: 0,),
              ]
          )
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
