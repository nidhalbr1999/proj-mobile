
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:project1/services/EventClass.dart';
import 'package:project1/api/auth_services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:project1/pages/LoginPage.dart';
import 'package:project1/pages/Homepage.dart';

class CalendarPage extends StatefulWidget {

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {


  List<String> EventTypes = ['Soutenance PFE', 'Cérémonie de mariage', 'Entretien'];



  var _time;

 Future<void> openDialog() async{
   await showDialog<void>(
 context: context,
 builder: (BuildContext context) {
 return SimpleDialog( // <-- SEE HERE
 title: const Text('Event Type'),
 children: [
   ...EventTypes.map((value) {
     return SimpleDialogOption(child: Text(value),onPressed:()=> next(value),);
   }),
   TextButton(onPressed: cancel, child: Text('cancel'))
 ],
 );
 });
}



 Future openDialog1(String v) => showDialog(context: context,
     builder: (content)=>AlertDialog(
       title:Text('Event Date'),
       content: DateTimeFormField(
         decoration: const InputDecoration(
           hintStyle: TextStyle(color: Colors.black45),
           errorStyle: TextStyle(color: Colors.redAccent),
           border: OutlineInputBorder(),
           suffixIcon: Icon(Icons.event_note),
           labelText: 'choose date',
         ),
         mode: DateTimeFieldPickerMode.date,
         autovalidateMode: AutovalidateMode.always,
         validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
         onDateSelected: (DateTime value){
           setState(() => _time = value);
         },
       ),
       actions: [
         TextButton(child: Text('cancel'),onPressed: cancel, ),
         TextButton(child: Text('done'),onPressed:()=>
         {if (_time!=null){submit(new Event(v,_time,1),YourEvents)}})
       ],

     ));

  Future<void> openDialog2() async{
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Delete Event'),
            children: [
              ...YourEvents.map((value) {
                return SimpleDialogOption(child: Text(value.name),onPressed:()=>delete(value),);
              }),
              TextButton(onPressed: cancel, child: Text('cancel'))
            ],
          );
        });
  }

  void cancel(){
    Navigator.pop(context);
  }
 void next(value){
   Navigator.pop(context);
   openDialog1(value);
 }
 void submit(Event e,List<Event> l )async {
   Navigator.pop(context);
   DateTime edate=e.date;
   Map data=Map();
   data["name"]=e.name;
   data["date"]="${edate.year.toString()}-${edate.month.toString().padLeft(2,'0')}-${edate.day.toString().padLeft(2,'0')}";
   http.Response res = await AuthServices.postData(data, 'events/add_event/?user_id=$id');
   print(res.body);
   setState(() {
     l.add(e);
   });
  }

 void delete(Event e) async{
   DateTime edate=e.date;
   String sdate="${edate.year.toString()}-${edate.month.toString().padLeft(2,'0')}-${edate.day.toString().padLeft(2,'0')}";
   http.Response res= await AuthServices.getData('events/event_id?event_date=$sdate');
   int ide=int.parse(res.body);
   res = await AuthServices.deleteData('events/{$ide}?event_date=$sdate');
    setState(() {
      YourEvents.remove(e);
    });
    Navigator.pop(context);
 }


  void _onItemTapped(int index) {
    YourEvents=[];
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
          YourEvents=[];
          Navigator.pop(context);
        }, icon:Icon(Icons.arrow_back_ios)),
        actions: [IconButton(onPressed: (){
          YourEvents=[];
          Navigator.pushNamed(context,'/Profile' );
        },
            icon:
            CircleAvatar(
              backgroundImage: NetworkImage(serverurl+responseMap["image"].substring(3)),
              backgroundColor: Colors.transparent,
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
          dataSource: MeetingDataSource(getAppointments(YourEvents)),

        ),
        SizedBox(height: 15.0),

        OutlinedButton.icon(
            onPressed: () {
              openDialog();
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
              openDialog2();
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
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          backgroundColor: Colors.blueAccent,
          onTap: _onItemTapped,
        ),
    );
  }
}

List<Appointment> getAppointments(List<Event> l) {
  List<Appointment> meetings = <Appointment>[];
  l.forEach((element) {
   DateTime date = element.date;
    meetings.add(Appointment(
        startTime: date,
        endTime: date,
        color: Colors.red,
        recurrenceRule: 'FREQ=DAILY;COUNT=1',
        isAllDay: false));
  });
  return meetings;

}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}

