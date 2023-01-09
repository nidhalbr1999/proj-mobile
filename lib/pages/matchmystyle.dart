import 'package:flutter/material.dart';


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
      backgroundImage: AssetImage('assets/user.JPG'),
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

                    },
                    child: Image.asset(
                      'assets/pic1.JPG',
                      width: 350.0,
                      height: 200.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                      children: <Widget>[
                        SizedBox(width: 10.0),
                        GestureDetector(
                          onTap: () {

                          },
                          child: Image.asset(
                            'assets/pic3.JPG',
                            width: 150.0,
                            height: 150.0,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        GestureDetector(
                          onTap: () {

                          },
                          child: Image.asset(
                            'assets/pic2.JPG',
                            width: 150.0,
                            height: 150.0,
                          ),
                        ),
                      ]
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
