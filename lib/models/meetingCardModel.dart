import 'package:flutter/material.dart';

class meetings extends StatelessWidget {
  const meetings({
    super.key,
  });

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
            Align(child: Text("MEET ID: 123456",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),alignment: Alignment.center,),
            SizedBox(height: 20,),
            Text("Subject : ",style: TextStyle(fontSize: 15),),
            SizedBox(height: 10,),
            Text("Location: Kochi",style: TextStyle(fontSize: 15),),
            SizedBox(height: 10,),
            Text("Date :",style: TextStyle(fontSize: 15),),
            SizedBox(height: 10,),
            Text("Time: ",style: TextStyle(fontSize: 15),),
            SizedBox(height: 10,),
            Text("Category: ",style: TextStyle(fontSize: 15),),
            SizedBox(height: 10,),
            Text("Number of participants: ",style: TextStyle(fontSize: 15),),
            SizedBox(height: 10,),
            Text("participants: ",style: TextStyle(fontSize: 15),),
            SizedBox(height: 10,),
            Text("Agenda: ",style: TextStyle(fontSize: 15),),

          ],
        ),
      ),
    );
  }
}
