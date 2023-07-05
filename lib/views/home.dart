import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minutes_tracker/constants/constants.dart';
import 'CreateMeeting.dart';
import 'search.dart';


void main(){
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: SingleChildScrollView(
      child: Container(
        color: kMaintheme,
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        //height: MediaQuery.of(context).size.height,
        child:  Column(
         crossAxisAlignment: CrossAxisAlignment.center,
          children: [Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Home",style: kBlackHeadingSize,),
              ElevatedButton(onPressed: (){}, child: Text("Log Out"),style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Set the border radius value
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(kMaintheme), // Set the background color
                fixedSize: MaterialStateProperty.all<Size>(Size(100, 25)), // Set the size
              ),)
            ],
          ),
            SizedBox(height: 30,),
            InkWell(child: Container(child: Image.asset('./assets/search.png'),),onTap: (){Get.to(()=>search());},),
            SizedBox(height: 5,),
            Text("Search",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
            SizedBox(height: 30,),
            InkWell(child: Container(child: Image.asset('./assets/createM.png'),),onTap: (){Get.to(()=>CreateMeet());},),
            SizedBox(height: 5,),
            Text("Create Meeting",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
            SizedBox(height: 30,),
            InkWell(child: Container(child: Image.asset('./assets/scan.png'),),onTap: (){},),
            SizedBox(height: 5,),
            Text("Scan",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
          ],
        ),
      ),
    ),),);
  }
}
