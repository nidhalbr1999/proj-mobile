//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarPage extends StatefulWidget {

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    }
    );
    //Navigator.pushNamed(context,'/Calendar');
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
            ),iconSize: 60,
        )],
        elevation: 0.0,

      ),
    body: Center(
      child: Padding(
      padding: EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
      Text(
      'My Outfit',
      style:TextStyle(
      color:Colors.black,
      letterSpacing: 2.0,
      fontSize: 40.0,
      fontWeight: FontWeight.bold
      )
      ),
      Text(
      'Calendar',
      style:TextStyle(
      color:Colors.black,
      letterSpacing: 2.0,
      fontSize: 60.0,
      fontWeight: FontWeight.bold
      )
      ),
      SizedBox(height: 15.0),
        SfCalendar(
          view: CalendarView.month,
          headerHeight: 70,
          viewHeaderHeight: 30,

        ),
        SizedBox(height: 15.0),

        OutlinedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/Homepage');
            },
            icon:Icon(Icons.add),
            label:Text('Add Event',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black
                )),

            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize:  Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // <-- Radius
                ),
                side: BorderSide(width: 2.0, color: Colors.black)
            )),
        SizedBox(height: 10.0),

        OutlinedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/Homepage');
            },
            icon:Icon(Icons.delete),
            label:Text('Delete Event',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black
                )),

            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize:  Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // <-- Radius
                ),
                side: BorderSide(width: 2.0, color: Colors.black)
            )),




          ]
      )),

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
