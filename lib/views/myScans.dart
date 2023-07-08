import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minutes_tracker/constants/constants.dart';
import 'package:get/get.dart';
import 'package:minutes_tracker/models/scanModel.dart';

void main(){
  runApp(MyScans());
}

class MyScans extends StatelessWidget {
   MyScans({super.key});
  List<scanModel> ScanCards = [];
   final _firestore = FirebaseFirestore.instance;
   late String? userUid;
   void getUserUid() {
     final User? user = FirebaseAuth.instance.currentUser;
     if (user != null) {
       userUid = user.uid;
       print("UID : " + userUid!);
     } else {
       // Handle the case when the user is not logged in
       // You can set userUid to null or handle the situation accordingly
       userUid = null;
     }
   }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body:
      Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Align(
              child: Text(
                "My Scans",
                style: kBlackHeadingSize,
              ),
              alignment: Alignment.topLeft,
            ),
            SizedBox(height: 50),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: _firestore.collection('scans').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: kMaintheme,
                    ),
                  );
                }
                final QuerySnapshot<Map<String, dynamic>>
                querySnapshot = snapshot.data!;
                final List<
                    QueryDocumentSnapshot<Map<String, dynamic>>>
                Scans = querySnapshot.docs;
                ScanCards = [];
                getUserUid();
                for (var scan in Scans) {
                  final uid = scan.data()['uid'];
                  if (userUid == uid ) {
                    final data =
                    scan.data()['data'];
                    final id = scan.id;

                    ScanCards.add(scanModel(data: data,id: id,));
                  }
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 500,
                      child:  SizedBox(
                        height: 500,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: ScanCards.length,
                          itemBuilder: (BuildContext context, int index) {
                            final meet = ScanCards[index];
                            return SingleChildScrollView(child: meet,);
                          },
                        ),
                      ),),
                  ],
                );
              },
            ),
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     SizedBox(
      //       height: 500,
      //       child:  SizedBox(
      //         height: 500,
      //         width: double.infinity,
      //         child: PageView.builder(
      //           scrollDirection: Axis.vertical,
      //           itemCount: ScanCards.length,
      //           itemBuilder: (BuildContext context, int index) {
      //             final meet = ScanCards[index];
      //             return SizedBox(height: 500,child: meet,);
      //           },
      //         ),
      //       ),),
      //   ],
      // )
          ],
        ),
      )
      ,),);
  }
}

