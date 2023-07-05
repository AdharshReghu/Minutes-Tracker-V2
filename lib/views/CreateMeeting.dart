import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minutes_tracker/constants/constants.dart';
import 'package:file_picker/file_picker.dart';

void main(){
  runApp(CreateMeet());
}


class CreateMeet extends StatelessWidget {
  String? pdfPath;

  Future<void> handlePDFSelection(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null && result.files.isNotEmpty) {
        PlatformFile file = result.files.first;
        pdfPath = file.path;
        Get.snackbar("Success","$pdfPath");
      }
    } catch (e) {
      // Error handling
      Get.snackbar("Error","'Error selecting PDF: $e'");
      print('Error selecting PDF: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: SafeArea(child: Scaffold(body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text('Create Meet',style: kBlackHeadingSize,),
            SizedBox(height: 30,),
            Text("Subject: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            TextFormField(decoration: kTextFieldCreate.copyWith(hintText: "Enter Subject"),),
            SizedBox(height: 15,),
            Text("Meet ID: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            TextFormField(decoration: kTextFieldCreate.copyWith(hintText: "Enter Meet ID "),),
            SizedBox(height: 15,),
            Text("Location: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            TextFormField(decoration: kTextFieldCreate.copyWith(hintText: "Enter Location"),),
            SizedBox(height: 15,),
            Text("Date: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            TextFormField(decoration: kTextFieldCreate.copyWith(hintText: "Enter Date (Formate : DD-MMM-YY)"),),
            SizedBox(height: 15,),
            const Text("Time: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            TextFormField(decoration: kTextFieldCreate.copyWith(hintText: "Enter Time"),),
            SizedBox(height: 15,),
            Text("Category: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            TextFormField(decoration: kTextFieldCreate.copyWith(hintText: "Enter Category"),),
            SizedBox(height: 15,),
            Text("Number Of participants: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            TextFormField(decoration: kTextFieldCreate.copyWith(hintText: "Enter Number of participants "),),
            SizedBox(height: 15,),
            Text("Participants: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            TextFormField(maxLines: 5,decoration: kTextFieldCreate.copyWith(hintText: "Enter participants Names here", ),),
            SizedBox(height: 15,),
            Text("Agenda: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            TextFormField(maxLines: 10,decoration: kTextFieldCreate.copyWith(hintText: "Type Agenda Here", ),),
            SizedBox(height: 15),
            Text("Upload PDF: ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ElevatedButton(onPressed: (){handlePDFSelection(context);}, child: Text("Select PDF"),style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Set the border radius value
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Set the background color
              fixedSize: MaterialStateProperty.all<Size>(Size(150, 25)), // Set the size
            ),),
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
                  backgroundColor: MaterialStateProperty.all<Color>(kMaintheme), // Set the background color
                  fixedSize: MaterialStateProperty.all<Size>(Size(double.infinity, 50)), // Set the size
                ),
                onPressed: () {
                },
                child: Text("Submit and Create ",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    ),),),);
  }
}
