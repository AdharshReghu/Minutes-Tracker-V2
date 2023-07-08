
import 'package:flutter/material.dart';

class scanModel extends StatelessWidget {

  String data;
  String id;
  scanModel({required this.data,required this.id});

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
        width: double.infinity,
        child: Column(
          children: [Text("#id: $id",style: TextStyle(fontWeight: FontWeight.bold),),SizedBox(height: 20,),
            Text("$data",style: TextStyle(fontSize: 15),),
          ],
        ),
      ),
    );
  }
}
