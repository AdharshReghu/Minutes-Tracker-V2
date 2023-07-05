import 'package:flutter/material.dart';
import 'package:minutes_tracker/constants/constants.dart';
import 'package:get/get.dart';
import 'Register.dart';


void main(){
  runApp( Login());
}


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(
              padding: EdgeInsets.all(20),
              height: double.infinity,
              child:  Form(
                child: Column(
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
                      decoration: kTextFieldDecoration.copyWith(hintText: "Enter Your Email")
                    ),
                    SizedBox(height: 25,),
                    Align(child: Text("Password",style: kGreyTextStyle,),alignment: Alignment.centerLeft,),
                    SizedBox(height: 10,),
                    TextFormField(
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
                        onPressed: () {
                          // Button press action
                        },
                        child: Text("Get Started",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600)),
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
