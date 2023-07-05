import 'package:flutter/material.dart';
import 'package:minutes_tracker/constants/constants.dart';
import 'package:get/get.dart';
import 'package:minutes_tracker/views/home.dart';
import 'Register.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main(){
  runApp( Login());
}


class Login extends StatelessWidget {
  final _loginkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: SingleChildScrollView(
          child: Form(
            key: _loginkey,
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.all(20),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Welcome Back !",style: TextStyle(fontSize:30,fontWeight: FontWeight.w600),),
                    const SizedBox(height: 30,),
                    Image.asset("./assets/login.png"),
                    SizedBox(height: 30,),
                    Align(child: Text("Email",style: kGreyTextStyle,),alignment: Alignment.centerLeft,),
                    SizedBox(height: 10,),
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
                    SizedBox(height: 25,),
                    Align(child: Text("Password",style: kGreyTextStyle,),alignment: Alignment.centerLeft,),
                    SizedBox(height: 10,),
                    TextFormField(
                      onChanged: (value){
                        password= value;
                      },
                        textAlign: TextAlign.center,
                      validator: (value) {
                        if (value!.isEmpty){
                          return "Enter Password";
                        } else {
                          return null;
                        }
                      },
                        decoration: kTextFieldDecoration.copyWith(hintText: "Enter Your Password")
                    ),
                    SizedBox(height: 30),
                    Container(
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
                          if (_loginkey.currentState!.validate()) {
                            try {
                              final user = await _auth
                                  .signInWithEmailAndPassword(
                                  email: email, password: password);
                              if (user != null) {
                                Get.off(() => Home());
                              }
                            }catch(e){
                              Get.snackbar("Error", "Login Failed");
                            }
                          }

                        },
                        child: Text("Log In",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600)),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text("New User?",style: kGreyTextStyle,),
                    InkWell(child: Text("Register",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),onTap: (){Get.off(()=>Register());},splashColor: kMaintheme,radius: 10,)
                  ],
                ),
              ),
            ),
          ),
        ),),
    );
  }
}
