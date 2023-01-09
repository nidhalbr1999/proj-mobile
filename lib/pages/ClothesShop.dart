import 'package:flutter/material.dart';

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
          padding: EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0.0),
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
    );
  }
}
