import 'package:flutter/material.dart';
import 'package:project1/pages/ClothesShop.dart';
import 'package:project1/pages/Settings.dart';
import 'package:project1/pages/Homepage.dart';


class MainpageState extends StatefulWidget {
  const MainpageState({Key? key}) : super(key: key);

  @override
  State<MainpageState> createState() => _MainpageStateState();
}

class _MainpageStateState extends State<MainpageState> {
  int _selectedIndex=1;
  final screens=[clothesshop(),FirstPage(),Settingspage()];
  @override
  Widget build(BuildContext context) => Scaffold(
    body: screens[_selectedIndex],
    bottomNavigationBar:BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index)=> setState(()=>_selectedIndex=index),
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


    ),
  );

}
