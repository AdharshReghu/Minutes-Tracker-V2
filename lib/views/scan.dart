import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minutes_tracker/constants/constants.dart';
import'package:minutes_tracker/controller/pdf controller.dart';


void main(){
  runApp(Scan());
}

class Scan extends StatelessWidget {
   Scan({super.key});
  final  _controller = Get.put(pdf_controller());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: SafeArea(child: Scaffold(body: SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        //height: MediaQuery.of(context).size.height,
        child:Column(
          children: [
            Text("Scan PDFs",style: kBlackHeadingSize,),
            SizedBox(height: 30,),
          Container(child: Obx(() => Text(_controller.pdfText.value))),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Set the border radius value
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(kMaintheme), // Set the background color
                fixedSize: MaterialStateProperty.all<Size>(Size(500, 50)), // Set the size
              ),
              onPressed: ()   {
                print("Select pdf");
                _controller.selectPdf();
              },
              child: Text("Scan",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600)),
            ),
          ],
        )
      ),
    ),),),);
  }
}
