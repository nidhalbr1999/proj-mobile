import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: EdgeInsets.only(top:50.0,left: 20.0),

            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height:30.0 ),
                Text(
                  'Menu',
                  style:TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue[300],
                  ),
                  //textAlign: TextAlign.left,
                ),

              ],
            ),

          ),

        ),
        SizedBox(
          height: 20.0,
        ),
        ListTile(
          onTap: (){Navigator.pushNamed(context,'/Homepage' );},
          leading: Icon(
            Icons.home,
            color: Colors.black,
          ),
          title:Text(
              'Home Page'
          ),

        ),
        ListTile(
          onTap: (){Navigator.pushNamed(context,'/matchmystyle' );},
          leading: Icon(
            Icons.star_border,
            color: Colors.black,
          ),
          title:Text(
              'Match My Style'
          ),

        ),
        ListTile(
          onTap: (){Navigator.pushNamed(context,'/ClothesShop');},
          leading: Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
          title:Text(
              'Shop'
          ),

        )
      ],
    );
  }
}
