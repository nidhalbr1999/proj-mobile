import 'package:flutter/material.dart';
import 'package:project1/pages/LoginPage.dart';
import 'package:project1/services/Maindraw.dart';
import 'package:project1/api/auth_services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:project1/services/EventClass.dart';



List<Event> YourEvents = [];


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
  Future<Map<dynamic,dynamic>> pressToGetMap (String apiUrl)async{
    Map<dynamic,dynamic> map=Map();
    http.Response res= await AuthServices.getData(apiUrl);
    setState(() { map = jsonDecode(res.body);});
    return map;
  }

  Future<int> getid(String urlapi)async{
    http.Response res= await AuthServices.getData(urlapi);
    print(res.body);
    return int.parse(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.blueAccent,
        actions: [IconButton(onPressed: ()async{
          print(responseMap);
          Navigator.pushNamed(context,'/Profile' );
        },
            icon:
            CircleAvatar(
              backgroundImage: AssetImage('C:\Users\nidhal\Desktop\project1\assets/userpic.jpg'),
              backgroundColor: Colors.transparent,
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
                SizedBox(height: 40,),
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
                SizedBox(height: 70.0),

                Row(
                    children: <Widget>[
                      SizedBox(width: 10.0),

                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context,'/MyWardrobe' );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset(
                            'assets/1.JPG',
                            width: 150.0,
                            height: 150.0,
                          ),  )
                      ),
                      SizedBox(width: 10.0,),
                      GestureDetector(
                        onTap: ()async {
                          List list=[];
                          http.Response res= await AuthServices.getData('events/?skip=0&limit=100');
                          print(res.body);
                          list=jsonDecode(res.body);
                          for (int i=0;i<list.length;i++){
                            YourEvents.add(new Event(list[i]["name"],DateTime.parse(list[i]["date"]+' 00:00:00.000'),list[i]["owner id"]));
                          }
                          Navigator.pushNamed(context,'/Calendar' );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset(
                            'assets/2.JPG',
                            width: 150.0,
                            height: 150.0,
                          ),  )
                      ),

                    ]
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context,'/matchmystyle' );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset(
                      'assets/3.JPG',
                      width: 300.0,
                      height: 150.0,
                    ),  )
                ),


              ]
          )
      ),

    );
  }
}