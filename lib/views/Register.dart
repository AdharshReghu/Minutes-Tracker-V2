import 'package:flutter/material.dart';
import 'package:minutes_tracker/constants/constants.dart';
import 'package:minutes_tracker/views/home.dart';
import 'login.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main(){
  runApp( Register());
}


class Register extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String name;
  late String confirmPassword;
  final _Registerkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _Registerkey,
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome Onboard !",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 50),
                    Align(
                      child: Text("Name", style: kGreyTextStyle),
                      alignment: Alignment.centerLeft,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        name = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Correct Name";
                        } else {
                          return null;
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(hintText: "Enter Your Full Name"),
                    ),
                    SizedBox(height: 25),
                    Align(
                      child: Text("Email", style: kGreyTextStyle),
                      alignment: Alignment.centerLeft,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        email = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                                .hasMatch(value)) {
                          return "Enter Correct E-mail";
                        } else {
                          return null;
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(hintText: "Enter Your Email"),
                    ),
                    SizedBox(height: 25),
                    Align(
                      child: Text("Password", style: kGreyTextStyle),
                      alignment: Alignment.centerLeft,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        password = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Password";
                        } else {
                          return null;
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(hintText: "Create Your Password"),
                    ),
                    SizedBox(height: 25),
                    Align(
                      child: Text("Confirm Password", style: kGreyTextStyle),
                      alignment: Alignment.centerLeft,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        confirmPassword = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Confirm Your Password";
                        } else if (value != password) {
                          return "Passwords do not match";
                        } else {
                          return null;
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(hintText: "Confirm Your Password"),
                    ),
                    SizedBox(height: 50),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(kMaintheme),
                          fixedSize: MaterialStateProperty.all<Size>(Size(double.infinity, 50)),
                        ),
                        onPressed: () async {
                          if (_Registerkey.currentState!.validate()) {
                            // Perform registration logic here
                            try {
                              final newUser = await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                              if (newUser != null) {
                                Get.snackbar("Success", "Account Registered Successfully");
                                Get.off(() => Login(),
                                    transition: Transition.rightToLeft,
                                    duration: Duration(milliseconds: 500));
                              }
                            } catch (e) {
                              Get.snackbar("Error", "$e");
                            }
                          }
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Existing User?", style: kGreyTextStyle),
                    InkWell(
                      child: Text("Log In", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      onTap: () {
                        Get.off(() => Login());
                      },
                      splashColor: kMaintheme,
                      radius: 10,
                    ),
                  ],
                ),

              ),
            ),
          ),
        ),
      ),
    );
  }
}
