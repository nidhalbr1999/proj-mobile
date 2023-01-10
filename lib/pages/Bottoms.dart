import 'package:flutter/material.dart';


class Bottoms extends StatefulWidget {
  const Bottoms({Key? key}) : super(key: key);

  @override
  State<Bottoms> createState() => _BottomsState();
}

class _BottomsState extends State<Bottoms> {

  void _onItemTapped(int index) {
    switch(index){
      case 0: {Navigator.pushNamed(context,'/ClothesShop');}break;
      case 1 :{Navigator.pushNamed(context,'/Homepage');}break;
      case 2 :{Navigator.pushNamed(context,'/Settings');}
    }
  }

  List imgList = [
    Image.asset('Images/S1.png'),
    Image.asset('Images/S3.png'),
    Image.asset('Images/S2.png'),
    Image.asset('Images/S2.png'),
    Image.asset('Images/S2.png'),
    Image.asset('Images/S2.png'),
    Image.asset('Images/S2.png'),
    Image.asset('Images/S2.png'),
    //Image.asset('Images/S2.png'),
  ];
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
      body:SingleChildScrollView( child:Padding(
          padding: EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                    'Bottoms',
                    style:TextStyle(
                        color:Colors.black,
                        letterSpacing: 2.0,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold
                    )
                ),

                SizedBox(height: 50,width: 0,),
                for (int i=0;i<imgList.length;i+=2)
                  Center(
                    child:Row(children: [SizedBox(height: 0,width: 50,),
                      Container(width: 100, height: 100, child:imgList[i]),
                      SizedBox(height: 0,width: 30,),
                      Container(width: 100, height: 100, child: imgList[i+1]),
                    ],),

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
