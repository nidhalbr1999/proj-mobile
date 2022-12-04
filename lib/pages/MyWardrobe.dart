
import 'package:flutter/material.dart';
import 'package:project1/services/Item.dart';



class wardrobepage extends StatefulWidget {


  @override
  State<wardrobepage> createState() => _wardrobepageState();
}

class _wardrobepageState extends State<wardrobepage> {

  void ShowItems() async{
    Item instance = Item('jacket','Europe/Berlin') ;
    await instance.getData();
  }

  /*@override
  void initState(){
    super.initState();
    ShowItems();
  }*/

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
              'My',
                style:TextStyle(
                color:Colors.black,
                letterSpacing: 2.0,
                fontSize: 40.0,
                fontWeight: FontWeight.bold
                )
                ),
                 Text(
                  'Wardrobe',
                  style:TextStyle(
                  color:Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold
                  )
                  ),
                  SizedBox(height: 25.0),
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

