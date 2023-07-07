import 'package:minutes_tracker/views/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:minutes_tracker/views/starting.dart';

import 'package:get/get.dart';
import 'package:minutes_tracker/views/login.dart';


  class AuthService {
  final _auth = FirebaseAuth.instance;

  HandleAuthState() {
  return StreamBuilder<User?>(
  stream: FirebaseAuth.instance.authStateChanges(),
  builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
  if (snapshot.connectionState == ConnectionState.waiting) {
  return CircularProgressIndicator(); // Add a loading indicator while checking the user's authentication state
  }

  if (snapshot.hasData) {
  return Home(); // Return the home page if the user is signed in
  } else {
  return Starting(); // Return the login page if the user is not signed in
  }
  },
  );
  }
  }


