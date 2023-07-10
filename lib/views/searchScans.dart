import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minutes_tracker/constants/constants.dart';
import 'package:get/get.dart';
import 'package:minutes_tracker/models/scanModel.dart';

class SearchScans extends StatelessWidget {
  final _searchkey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  late RxList<scanModel> scanCards = <scanModel>[].obs;
  late RxString userUid = ''.obs;
  late RxString searchTerm = ''.obs;

  SearchScans() {
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
    scanCards.clear();
    _firestore
        .collection('scans')
        .where('uid', isEqualTo: userUid.value)
        .get()
        .then((QuerySnapshot<Map<String, dynamic>> snapshot) {
      snapshot.docs.forEach((QueryDocumentSnapshot<Map<String, dynamic>> scan) {
        final data = scan.data()['data'];

        if (data != null &&
            (data.toLowerCase().contains(searchTerm.value.toLowerCase()))) {
          final id = scan.id;
          final scanObj = scanModel(
            data: data,
            id: id,
          );

          scanCards.add(scanObj);

          // Check if the search result is deleted
          _firestore
              .collection('scans')
              .doc(scan.id)
              .snapshots()
              .listen((DocumentSnapshot snapshot) {
            if (!snapshot.exists) {
              scanCards.remove(scanObj);
            }
          });
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
                    "Search Scans",
                    style: kBlackHeadingSize,
                  ),
                  alignment: Alignment.topLeft,
                ),
                const SizedBox(height: 50),
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
                      height: 600,
                      child: SizedBox(
                        height: 500,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: scanCards.length,
                          itemBuilder: (BuildContext context, int index) {
                            final meet = scanCards[index];
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