import 'package:minutes_tracker/views/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:minutes_tracker/views/starting.dart';

import 'package:get/get.dart';
import 'package:minutes_tracker/views/login.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  var Uid;
  late bool hasAcc;

  HandleAuthState() {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasData) {
          return FutureBuilder<bool>(
            future: checkIfProfileExist(snapshot.data!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<bool> profileSnapshot) {
              if (profileSnapshot.hasData && profileSnapshot.data!) {
                return Home();
              } else {
                return Login();
              }
            },
          );
        } else {
          return Starting();
        }
      },
    );
  }

  Future<bool> checkIfProfileExist(String Uid) async {
    final CollectionReference usersCollection =
    FirebaseFirestore.instance.collection('users');
    final QuerySnapshot snapshot =
    await usersCollection.where('Uid', isEqualTo: Uid).get();
    return snapshot.docs.isNotEmpty;
  }

}