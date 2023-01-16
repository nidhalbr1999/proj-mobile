//import 'dart:js';


import 'package:flutter/material.dart';
import 'package:project1/pages/Calendar.dart';
import 'package:project1/pages/ClothesShop.dart';
import 'package:project1/pages/LoginPage.dart';
import 'package:project1/services/Maindraw.dart';
import 'package:project1/pages/SignupPage.dart';
import 'package:project1/pages/matchmystyle.dart';
import 'package:project1/pages/Settings.dart';
import 'package:project1/pages/MyWardrobe.dart';
import 'package:project1/pages/Profile.dart';
import 'package:project1/pages/Mainpage.dart';
import 'package:project1/pages/Tops.dart';
import 'package:project1/pages/Bottoms.dart';
import 'package:project1/pages/Shoes.dart';
import 'package:project1/pages/Jackets.dart';
import 'package:project1/pages/outfitSuggested.dart';
import 'package:project1/pages/MywardrobeSug.dart';
import 'package:project1/pages/TopsSug.dart';
import 'package:project1/pages/BottomsSug.dart';
import 'package:project1/pages/ShoesSug.dart';
import 'package:project1/pages/JacketsSug.dart';
import 'package:project1/pages/outfit.dart';






void main() {
  runApp(MaterialApp(
    home:LoginPage(),
    routes: {
      '/Homepage': (context) => const MainpageState(),
      '/Calendar': (context) => CalendarPage(),
      '/ClothesShop': (context) => clothesshop(),
      '/matchmystyle': (context) => matchmystyle(),
      '/Settings': (context) => Settingspage(),
      '/MyWardrobe': (context) => wardrobepage(),
      '/Profile': (context) => profilepage(),
      '/Menu': (context)=> MainDrawer(),
      '/Signup': (context)=> SignupPage(),
      '/Login': (context)=> LoginPage(),
      '/Tops': (context)=>const Tops(),
      '/Bottoms': (context)=>const Bottoms(),
      '/Shoes': (context)=>const Shoes(),
      '/Jackets': (context)=>const Jackets(),
        '/FullOutfit': (context)=>const outfitSuggested(),
      '/Mywarderobesug': (context)=>const MywordrobeSug(),
      '/TopsSug': (context)=>const Topssug(),
      '/BottomsSug': (context)=>const BottomsSug(),
      '/ShoesSug': (context)=>const ShoesSug(),
      '/JacketsSug': (context)=>const JacketsSug(),
        '/Outfit': (context)=>const outfitSug(),

    }
  ));
}






