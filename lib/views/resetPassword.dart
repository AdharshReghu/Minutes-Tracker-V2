import 'package:flutter/material.dart';
import 'package:minutes_tracker/constants/constants.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';


class Reset extends StatelessWidget {
  var email;
  final _restkey = GlobalKey<FormState>();

  Future PasswordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.offAll(()=>Login());
      Get.snackbar("Link Sent", "Check Your E-mail");

    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Container(width:MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height,color: Colors.white,padding: EdgeInsets.all(20),
    child: Form(
      key: _restkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Password Reset !",style: TextStyle(fontSize:30,fontWeight: FontWeight.w600,color: Color(0x906366FF)),),
          const SizedBox(height: 30,),
          Text("Enter your Registered E-mail and we will send you a reset link",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey[600]),),
          const SizedBox(height: 10,),
          const Align(alignment: Alignment.centerLeft,child: Text("Email",style: kGreyTextStyle,),),
          const SizedBox(height: 10,),
          TextFormField(
              onChanged: (value){
                email = value;

              },
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                        .hasMatch(value)) {
                  return "Enter Correct E-mail";
                } else {
                  return null;
                }
              },
              decoration: kTextFieldDecoration.copyWith(hintText: "Enter Your Email")
          ),
          const SizedBox(height: 30,),
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
              onPressed: ()  {
                if (_restkey.currentState!.validate()){
                      PasswordReset();
                }
              },
              child: const Text("Send Reset Link",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600)),
            ),
          ),

        ],
      ),
    ),
    )));}}
