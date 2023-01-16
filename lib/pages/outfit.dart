import 'package:flutter/material.dart';
import 'package:project1/api/auth_services.dart';
import 'package:project1/pages/matchmystyle.dart';
import 'package:project1/pages/LoginPage.dart';
import 'package:project1/pages/BottomsSug.dart';
import 'package:project1/pages/TopsSug.dart';
import 'package:project1/pages/JacketsSug.dart';
import 'package:project1/pages/ShoesSug.dart';



class outfitSug extends StatefulWidget {
  const outfitSug({Key? key}) : super(key: key);

  @override
  State<outfitSug> createState() => _outfitSugState();
}

class _outfitSugState extends State<outfitSug> {

  void _onItemTapped(int index) {
    switch(index){
      case 0: {setState(() {
        list =[];
        outfitlistT=[];
        outfitlistS=[];
        outfitlistB=[];
        outfitlistJ=[];

      }); Navigator.pushNamed(context,'/ClothesShop');}break;
      case 1 :{setState(() {
        list =[];
        outfitlistT=[];
        outfitlistS=[];
        outfitlistB=[];
        outfitlistJ=[];
      }); Navigator.pushNamed(context,'/Homepage');}break;
      case 2 :{setState(() {
        list =[];
        outfitlistT=[];
        outfitlistS=[];
        outfitlistB=[];
        outfitlistJ=[];
      }); Navigator.pushNamed(context,'/Settings');}
    }
  }

  List list =outfitlistT+outfitlistB+outfitlistJ+outfitlistS;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.blueAccent,
        leading:IconButton(onPressed: (){
          setState(() {
            list =[];
            outfitlistT=[];
            outfitlistS=[];
            outfitlistB=[];
            outfitlistJ=[];
          });
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
                    'Outfit',
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
                    for (int i=0;i<list.length;i++)
                      Container(width: 150, height: 150, child:Image.network(serverurl+list[i]["image"].substring(3))),
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
