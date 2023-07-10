import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minutes_tracker/constants/constants.dart';

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

  void deleteDocument() {
    FirebaseFirestore.instance
        .collection('Meet')
        .where('meetID', isEqualTo: meetId)
        .get()
        .then((snapshot) {
      for (var doc in snapshot.docs) {
        doc.reference.delete();
        print("deleted");
      }
    });
  }


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
          TextButton(
          onPressed: deleteDocument,
          child: Align(alignment: Alignment.topRight,child: Icon(Icons.delete,color: Colors.grey,)),),
            Align(child: Text("MEET ID: $meetId",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),alignment: Alignment.center,),
            SizedBox(height: 20,),
            Row(
              children: [
                Text("Subject : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                Text("$subject",style: TextStyle(fontSize: 15),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Text("Location : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                Text("$location",style: TextStyle(fontSize: 15),),
              ],
            ),

            SizedBox(height: 10,),
            Row(
              children: [
                Text("Date : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                Text("$date",style: TextStyle(fontSize: 15),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Text("Time : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                Text("$time",style: TextStyle(fontSize: 15),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Text("Category : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                Text("$category",style: TextStyle(fontSize: 15),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Text("Number of Participants : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                Text("$numberParticipants",style: TextStyle(fontSize: 15),),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Text("Location : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                Text("$location",style: TextStyle(fontSize: 15),),
              ],
            ),
            SizedBox(height: 10,),
            Text("participants: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            Text("$participants",style: TextStyle(fontSize: 15),),
            SizedBox(height: 10,),
            Text("Agenda: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            Text("$agenda",style: TextStyle(fontSize: 15),),
          ],
        ),
      ),
    );
  }
}
