
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:project1/services/Item.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:project1/api/auth_services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:project1/pages/LoginPage.dart';

List responseList=[];

class wardrobepage extends StatefulWidget {


  @override
  State<wardrobepage> createState() => _wardrobepageState();
}

class _wardrobepageState extends State<wardrobepage> with SingleTickerProviderStateMixin {

  Animation<double>? _animation;
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
    CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  void ShowItems() async{
    Item instance = Item('jacket','Europe/Berlin') ;
    await instance.getData();
  }


  File? _image;

  final imagePicker=ImagePicker();
  Future getImage(source) async{
    final image=await ImagePicker.pickImage(source: source);
    setState(() {
      _image=File(image.path);
    });
  }


  void _onItemTapped(int index) {

    switch(index){
      case 0: {Navigator.pushNamed(context,'/ClothesShop');}break;
    case 1 :{Navigator.pushNamed(context,'/Homepage');}break;
    case 2 :{Navigator.pushNamed(context,'/Settings');}
    }

  }

Future<List> pressToGetList(String apiUrl,int categ)async{
    List list=[];
    List byCateg=[[],[],[],[]];
  http.Response res= await AuthServices.getData(apiUrl);
  list = jsonDecode(res.body);

  setState(() {
      for (int i=0;i<list.length;i++) {
        if (list[i]["category_id"]== 1){
          byCateg[0].add(list[i]);
        }else if (list[i]["category_id"]== 2){
          byCateg[1].add(list[i]);
        } else if (list[i]["category_id"]== 3){
          byCateg[2].add(list[i]);
        }else{
          byCateg[3].add(list[i]);
        }

  }});
  if (categ==1){
    return byCateg[0];
  } else if (categ==2){
    return byCateg[1];
  }else if (categ==3){
    return byCateg[2];
  }else {
    return byCateg[3];
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
              backgroundImage: NetworkImage(serverurl+responseMap["image"].substring(3)),
              backgroundColor: Colors.transparent,
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
                   Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                      children: <Widget> [
                        const Padding (padding: EdgeInsets.fromLTRB(0.0,0.0,0.0,30.0)),
                        GestureDetector(
                          onTap: () async{
                            responseList=await pressToGetList('clothes/?user_id=$id&skip=0&limit=100',1);
                            Navigator.pushNamed(context,'/Tops' );
                          },
                          child:Container(
                            decoration: BoxDecoration (
                              boxShadow: const [
                                BoxShadow (
                                  color:Colors.black12,
                                  blurRadius: 5.0,
                                  blurStyle: BlurStyle.normal,
                                ) ],
                              borderRadius: BorderRadius.circular(15),
                              image:const DecorationImage(
                                  image:AssetImage('assets/pull.jpg'),
                                  fit:BoxFit.cover
                              ),
                            ),
                            width:120,
                            height: 120,
                          ),
                        ),
                        const Text ('Tops',
                          style:TextStyle(fontSize:22,letterSpacing:2.0, fontWeight:FontWeight.w400 ,color:Colors.pink),
                          textAlign: TextAlign.center,
                        ),
                      ]
                  ),
                  Column(
                      children:<Widget> [
                        Padding ( padding: EdgeInsets.fromLTRB(0.0,0.0,0.0,30.0)),
                        GestureDetector(
                          onTap: () async{
                            responseList=await pressToGetList('clothes/?user_id=$id&skip=0&limit=100',2);
                            Navigator.pushNamed(context,'/Bottoms');
                          },
                          child:Container(
                            decoration: BoxDecoration (
                              boxShadow: const [
                                BoxShadow (
                                  color:Colors.black12,
                                  blurRadius: 5.0,
                                  blurStyle: BlurStyle.normal,
                                ) ],
                              borderRadius: BorderRadius.circular(15),
                              image: const DecorationImage (
                                image:AssetImage('assets/bottoms.jpg'),
                                fit:BoxFit.cover,
                              ),
                            ),
                            width: 120,
                            height:120,

                          ),
                        ),
                        const Text ('Bottoms',
                          style:TextStyle(fontSize:22,letterSpacing:2.0,fontWeight:FontWeight.w400 ,color:Colors.pink),
                          textAlign: TextAlign.center,
                        ),
                      ]
                  ),
                ],
              ),

              Row (
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children:<Widget>[

                    Column(
                        children: <Widget> [
                          Padding (padding: EdgeInsets.fromLTRB(0.0,0.0,0.0,30.0)),
                          GestureDetector(
                            onTap:()async{
                              responseList=await pressToGetList('clothes/?user_id=$id&skip=0&limit=100',3);
                              Navigator.pushNamed(context,'/Shoes');
                            },
                            child:Container(
                                decoration: BoxDecoration (
                                  boxShadow: const [
                                    BoxShadow (
                                      color:Colors.black12,
                                      blurRadius: 5.0,
                                      blurStyle: BlurStyle.normal,
                                    ) ],
                                  borderRadius: BorderRadius.circular(15),
                                  image:const DecorationImage(
                                    image:AssetImage('assets/whitesneakers.webp'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                width: 120,
                                height:120
                            ),
                          ),
                          const Text ('Shoes',
                            style:TextStyle(fontSize:22,letterSpacing:2.0, fontWeight:FontWeight.w400,color:Colors.pink),
                            textAlign: TextAlign.center,
                          ),
                        ]
                    ),
                    Column(
                        children: <Widget> [
                          Padding (padding: EdgeInsets.fromLTRB(0.0,0.0,0.0,30.0)),
                          GestureDetector(
                            onTap:() async{
                              responseList=await pressToGetList('clothes/?user_id=$id&skip=0&limit=100',4);
                              Navigator.pushNamed(context,'/Jackets');
                            },
                            child:Container(
                                decoration: BoxDecoration (
                                  boxShadow: const [
                                    BoxShadow (
                                      color:Colors.black12,
                                      blurRadius: 5.0,
                                      blurStyle: BlurStyle.normal,
                                    ) ],
                                  borderRadius: BorderRadius.circular(15),
                                  image:const DecorationImage(
                                      image:AssetImage('assets/vestes.jpg'),
                                      fit: BoxFit.cover),
                                ),
                                width: 120,
                                height:120
                            ),
                          ),
                          const Text ('Jackets',
                            style:TextStyle(fontSize:22,letterSpacing:2.0, fontWeight:FontWeight.w400 ,color:Colors.pink),
                            textAlign: TextAlign.center,
                          ),
                        ]
                    ),
                  ]
              )
                    ]
                    )
            ),
        floatingActionButton: FloatingActionBubble(
          items: <Bubble>[
            Bubble(
              title: "camera",
              iconColor: Colors.white,
              bubbleColor: Colors.blue,
              icon: Icons.camera_alt,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
              onPress: ()async {
                _animationController!.reverse();
                await getImage(ImageSource.camera);
                AuthServices.uploadImage('clothes/uploadimage/',_image,"POST");
              },
            ),
            Bubble(
              title: "gallery",
              iconColor: Colors.white,
              bubbleColor: Colors.blue,
              icon: Icons.folder,
              titleStyle: TextStyle(fontSize: 16, color: Colors.white),
              onPress: () async{
                _animationController!.reverse();
                await getImage(ImageSource.gallery);
                AuthServices.uploadImage('clothes/uploadimage/',_image,"POST");
              },
            ),

          ],
          animation: _animation!,
          onPress: () => _animationController!.isCompleted
              ? _animationController!.reverse()
              : _animationController!.forward(),
          backGroundColor: Colors.blue,
          iconColor: Colors.white,
          iconData: Icons.add,
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
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
              }
              }

