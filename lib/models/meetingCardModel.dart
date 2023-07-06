import 'package:flutter/material.dart';

class meetings extends StatelessWidget {
  String subject;
  String meetId;
  String agenda;
  String time;
  String date;
  String participants;
  String category;
  String numberParticipants;
  String location;

  meetings({required this.subject,required this.agenda,required this.participants,required this.category,required this.time,required this.date,required this.location,required this.meetId,required this.numberParticipants}){

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ],
        ),
        width: 300,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(child: Text("MEET ID: $meetId",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),alignment: Alignment.center,),
            SizedBox(height: 20,),
            Text("Subject : $subject",style: TextStyle(fontSize: 15),),
            SizedBox(height: 10,),
            Text("Location: $location",style: TextStyle(fontSize: 15),),
            SizedBox(height: 10,),
            Text("Date: $date",style: TextStyle(fontSize: 15),),
            SizedBox(height: 10,),
            Text("Time: $time",style: TextStyle(fontSize: 15),),
            SizedBox(height: 10,),
            Text("Category: $category",style: TextStyle(fontSize: 15),),
            SizedBox(height: 10,),
            Text("Number of participants: $numberParticipants",style: TextStyle(fontSize: 15),),
            SizedBox(height: 10,),
            Text("participants: $participants",style: TextStyle(fontSize: 15),),
            SizedBox(height: 10,),
            Text("Agenda: $agenda",style: TextStyle(fontSize: 15),),

          ],
        ),
      ),
    );
  }
}
