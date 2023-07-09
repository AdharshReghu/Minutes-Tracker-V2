import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minutes_tracker/constants/constants.dart';
import 'package:get/get.dart';
import 'package:minutes_tracker/models/meetingCardModel.dart';

class search extends StatelessWidget {
  final _searchkey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  late RxList<meetings> meetingCards = <meetings>[].obs;
  late RxString userUid = ''.obs;
  late RxString searchTerm = ''.obs;

  search() {
    getUserUid();
  }

  void getUserUid() {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userUid.value = user.uid;
      print("UID : ${userUid.value}");
    } else {
      // Handle the case when the user is not logged in
      // You can set userUid to null or handle the situation accordingly
      userUid.value = '';
    }
  }

  void performSearch() {
    meetingCards.clear();
    _firestore
        .collection('Meet')
        .where('uId', isEqualTo: userUid.value)
        .get()
        .then((QuerySnapshot<Map<String, dynamic>> snapshot) {
      snapshot.docs.forEach((QueryDocumentSnapshot<Map<String, dynamic>> meet) {
        final date = meet.data()['date'];
        final meetId = meet.data()['meetID'];
        final subject = meet.data()['subject'];
        final category = meet.data()['category'];
        final location = meet.data()['location'];
        final participants = meet.data()['participants'];

        if (date != null &&
            meetId != null &&
            category != null &&
            location != null &&
            participants != null &&
            subject != null &&
            (date.toLowerCase().contains(searchTerm.value.toLowerCase()) ||
                category.toLowerCase().contains(searchTerm.value.toLowerCase()) ||
                location.toLowerCase().contains(searchTerm.value.toLowerCase()) ||
                participants.toLowerCase().contains(searchTerm.value.toLowerCase()) ||
                meetId.toLowerCase().contains(searchTerm.value.toLowerCase()) ||
                subject.toLowerCase().contains(searchTerm.value.toLowerCase()))) {
          final numParticipants = meet.data()['Number of participants'];
          final agenda = meet.data()['agenda'];
          final time = meet.data()['time'];

          meetingCards.add(meetings(
            subject: subject,
            agenda: agenda,
            participants: participants,
            category: category,
            time: time,
            date: date,
            location: location,
            meetId: meetId,
            numberParticipants: numParticipants,
          ));
        }
      });
    });
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
                    "Search",
                    style: kBlackHeadingSize,
                  ),
                  alignment: Alignment.topLeft,
                ),
                const SizedBox(height: 50),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Note: While searching with date, Enter the date in correct format(DD-MM-YYYY)",
                    style: kGreyTextStyle,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: Form(
                          key: _searchkey,
                          child: TextFormField(
                            onChanged: (value) {
                              searchTerm.value = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Data to search!";
                              } else {
                                return null;
                              }
                            },
                            decoration: kTextFieldCreate.copyWith(
                              hintText: "Enter search term here",
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        child: Icon(Icons.search, size: 50, color: kMaintheme),
                        onTap: () {
                          if (_searchkey.currentState!.validate()) {
                            performSearch();
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Obx(() => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 500,
                      child: SizedBox(
                        height: 500,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: meetingCards.length,
                          itemBuilder: (BuildContext context, int index) {
                            final meet = meetingCards[index];
                            return SingleChildScrollView( child: meet);
                          },
                        ),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
