//import 'dart:js';


import 'package:flutter/material.dart';
import 'package:project1/pages/Homepage.dart';
import 'package:project1/pages/Calendar.dart';
import 'package:project1/pages/ClothesShop.dart';
import 'package:project1/pages/FavoriteClothes.dart';
import 'package:project1/pages/LoginPage.dart';
import 'package:project1/services/Maindraw.dart';
import 'package:project1/pages/SignupPage.dart';
import 'package:project1/pages/matchmystyle.dart';
import 'package:project1/pages/Settings.dart';
import 'package:project1/pages/MyWardrobe.dart';
import 'package:project1/pages/Profile.dart';
import 'package:project1/pages/Notifications.dart';
import 'package:project1/pages/Forgot.dart';



void main() {
  runApp(MaterialApp(
    home:SignupPage(),
    routes: {
      '/Homepage': (context) => FirstPage(),
      '/Calendar': (context) => CalendarPage(),
      '/ClothesShop': (context) => clothesshop(),
      '/FavoriteClothes': (context) => myfavoriteclothes(),
      '/matchmystyle': (context) => matchmystyle(),
      '/Settings': (context) => Settingspage(),
      '/MyWardrobe': (context) => wardrobepage(),
      '/Profile': (context) => profilepage(),
      '/Notifications': (context) => notification(),
      '/Menu': (context)=> MainDrawer(),
      '/Signup': (context)=> SignupPage(),
      '/Login': (context)=> LoginPage(),
      '/Forgot': (context)=>Forgotpage(),

    }
  ));
}






