import 'package:flutter/material.dart';

class Settingspage extends StatefulWidget {

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {

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
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios)),
          elevation: 0.0,

        ),
        body: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 55.0),
                  Text(
                      'Settings',
                      style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 2.0,
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  SizedBox(height: 30.0),
                  SizedBox(height: 85.0),

                OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context,'/Profile' );
                    },
                    icon:Icon(Icons.account_circle_rounded),
                    label:Text('Account',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      )),

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize:  Size.fromHeight(70),
                  alignment: Alignment.centerLeft,

                )

                ),

                  OutlinedButton.icon(
                      onPressed: () {},
                      icon:Icon(Icons.lock),
                      label:Text('Privacy & Security',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        )),

                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize:  Size.fromHeight(70),
                        alignment: Alignment.centerLeft,
                      )

                  ),

                  OutlinedButton.icon(
                      onPressed: () {},
                      icon:Icon(Icons.help),
                      label:Text('Help and Support',
                          style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),),

                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize:  Size.fromHeight(70),
                        alignment: Alignment.centerLeft,
                      )

                  ),

                  OutlinedButton.icon(
                      onPressed: () {},
                      icon:Icon(Icons.chat_outlined),
                      label:Text('About',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),

                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize:  Size.fromHeight(70),
                        alignment: Alignment.centerLeft,
                      )

                  )
                ]
            )
        ),

    );
  }
}
