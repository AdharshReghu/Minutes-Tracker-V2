import 'package:minutes_tracker/views/searchScans.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class scanModel extends StatelessWidget {

  String data;
  String id;
  scanModel({required this.data,required this.id});

  void deleteDocument() {
    FirebaseFirestore.instance.collection('scans').doc(id).delete();
    print("Deleted");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ],
        ),
        width: double.infinity,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: deleteDocument,
                child:Icon(Icons.delete,color: Colors.grey,),),
            ),
            Text("#id: $id",style: TextStyle(fontWeight: FontWeight.bold),),SizedBox(height: 20,),
            Text("$data",style: TextStyle(fontSize: 15),),
          ],
        ),
      ),
    );
  }
}
