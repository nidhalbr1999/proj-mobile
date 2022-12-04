import 'package:flutter/material.dart';
import 'package:project1/services/Maindraw.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.blueAccent,
        /*leading:IconButton(onPressed: (){
        }, icon:Icon(Icons.menu)),*/
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
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          )),
                      fillColor: Colors.grey[400],
                      hintText: 'Search For a Piece',
                      hintStyle: TextStyle(fontSize: 16)

                  ),
                  cursorColor: Colors.black,
                ),
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
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.blueAccent,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}