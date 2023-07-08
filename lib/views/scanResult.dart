import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minutes_tracker/constants/constants.dart';
import 'package:minutes_tracker/views/home.dart';

class ScanResults extends StatelessWidget {
   ScanResults({super.key});
  var data =  Get.arguments;
  var uId ;

   String getCurrentUserId() {
     FirebaseAuth auth = FirebaseAuth.instance;
     User? user = auth.currentUser;

     if (user != null) {
       String Useruid = user.uid;
       return Useruid;
     } else {
       return '';
     }
   }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Text("Scan Results",style: kBlackHeadingSize,),
            SizedBox(height: 50,),
              Container(
                padding: EdgeInsets.all(10),
                  decoration:BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                    ],
                  ),child: Text("$data",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),)),
              SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Set the border radius value
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(kMaintheme), // Set the background color
                    fixedSize: MaterialStateProperty.all<Size>(Size(double.infinity, 50)), // Set the size
                  ),
                  onPressed: () async  {
                    uId = getCurrentUserId();
                    FirebaseFirestore firestore = FirebaseFirestore.instance;
                    CollectionReference scanCollection = firestore.collection('scans');
                    scanCollection.add(
                      {'data': data,
                      'uid':uId}
                    ).then((value) {
                      Get.snackbar("Success", "Scan Stored Successfully");
                      Get.offAll(()=>Home());
                    }).catchError((onError){
                      Get.snackbar("Error",'Failed to store data in Firestore: $onError');
                      Get.offAll(()=>Home());
                    });

                  },
                  child: Text("Confirm and Submit",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600)),
                ),
              ),
            ],),),
      ),));
  }
}

