import 'package:flutter/material.dart';
import 'package:minutes_tracker/constants/constants.dart';
import 'package:get/get.dart';
import 'package:minutes_tracker/views/searchMeetID.dart';
import 'searchdate.dart';
import 'searchSubject.dart';

void main(){
  runApp(search());
}

class search extends StatelessWidget {
  const search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(alignment:Alignment.topLeft,child: Text("Search",style: kBlackHeadingSize,)),
          SizedBox(height: 100,),
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
              onPressed: () {
                Get.to(()=>SearchID());
              },
              child: Text("Search with Meet ID",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600)),
            ),
          ),
          SizedBox(height: 50,),
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
              onPressed: () {
                Get.to(()=>SearchSub());
              },
              child: Text("Search with Subject Name",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600)),
            ),
          ),
          SizedBox(height: 50,),
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
              onPressed: () {
                Get.to(()=>searchDate());
              },
              child: Text("Search with Date",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    ),),);
  }
}
