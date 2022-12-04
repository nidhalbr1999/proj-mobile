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
            padding: EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                      'Settings',
                      style: TextStyle(
                          color: Colors.black,
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
                        hintText: 'Search For a setting...',
                        hintStyle: TextStyle(fontSize: 16)

                    ),
                    cursorColor: Colors.black,
                  ),
                SizedBox(height: 20.0),

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
                  minimumSize:  Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // <-- Radius
                    ),
                    side: BorderSide(width: 2.0, color: Colors.black)
                )

                ),
                  SizedBox(height: 10.0),
                  OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context,'/Notifications' );
                      },
                      icon:Icon(Icons.notifications_active),
                      label:Text('Notification',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),),

                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize:  Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15), // <-- Radius
                          ),
                          side: BorderSide(width: 2.0, color: Colors.black)
                      )

                  ),
                  SizedBox(height: 10.0),
                  OutlinedButton.icon(
                      onPressed: () {},
                      icon:Icon(Icons.visibility),
                      label:Text('Appearence',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        )),

                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize:  Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15), // <-- Radius
                          ),
                          side: BorderSide(width: 2.0, color: Colors.black)
                      )

                  ),
                  SizedBox(height: 10.0),
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
                          minimumSize:  Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15), // <-- Radius
                          ),
                          side: BorderSide(width: 2.0, color: Colors.black)
                      )

                  ),
                  SizedBox(height: 10.0),
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
                          minimumSize:  Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15), // <-- Radius
                          ),
                          side: BorderSide(width: 2.0, color: Colors.black)
                      )

                  ),
                  SizedBox(height: 10.0),
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
                          minimumSize:  Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15), // <-- Radius
                          ),
                          side: BorderSide(width: 2.0, color: Colors.black)
                      )

                  )
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
