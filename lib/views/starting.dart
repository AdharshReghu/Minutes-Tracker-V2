import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login.dart';

void main(){
  runApp( Starting());
}

class Starting  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      color: Color(0x906366FF),
      width: MediaQuery.of(context).size.height,
      height:  MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(30),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.asset('./assets/StartingScreen.png'),
            ),
            SizedBox(height: 30,),
            Container(
              width: double.infinity,
                child: Text('Welcome to MeetMaster, your ultimate companion for mastering meetings like a pro',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),

             // child: Text("Welcome to MeetMaster, your ultimate companion for mastering meetings like a pro"),
            ),
            SizedBox(height: 30,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Set the border radius value
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set the background color
                  fixedSize: MaterialStateProperty.all<Size>(Size(double.infinity, 50)), // Set the size
                ),
                onPressed: () {
                  Get.off(()=>Login());
                },
                child: Text("Get Started",style: TextStyle(fontSize: 20,color: Color(0xFF6366FF),fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}
