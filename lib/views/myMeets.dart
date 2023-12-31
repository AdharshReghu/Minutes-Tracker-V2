import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minutes_tracker/constants/constants.dart';
import 'package:minutes_tracker/models/meetingCardModel.dart';
import '../models/meetingList.dart';

class Mymeets extends StatelessWidget {
  Mymeets({Key? key}) : super(key: key);
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Align(
                  child: Text(
                    "My Meets",
                    style: kBlackHeadingSize,
                  ),
                  alignment: Alignment.topLeft,
                ),
                SizedBox(height: 50),
                StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: _firestore.collection('Meet').snapshots(),
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
                    Meets = querySnapshot.docs;
                    meetingCards = [];
                    getUserUid();
                    for (var meet in Meets) {
                      final date = meet.data()['date'];
                      final uid = meet.data()['uId'];
                      final meetId = meet.data()['meetID'];
                      final subject = meet.data()['subject'];
                      if (userUid == uid ) {
                        final Numparticipants =
                        meet.data()['Number of participants'];
                        final agenda = meet.data()['agenda'];

                        final category = meet.data()['category'];
                        final location = meet.data()['location'];
                        final participants = meet.data()['participants'];
                        final time = meet.data()['time'];
                        meetingCards.add(meetings(subject: subject, agenda: agenda, participants: participants, category: category, time: time, date: date, location: location, meetId: meetId, numberParticipants: Numparticipants,));
                      }
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 600,
                          child:  SizedBox(
                            height: 500,
                            width: double.infinity,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: meetingCards.length,
                              itemBuilder: (BuildContext context, int index) {
                                final meet = meetingCards[index];
                                return SingleChildScrollView(child: meet,);
                              },
                            ),
                          ),),
                      ],
                    );
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
