import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minutes_tracker/constants/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:minutes_tracker/views/home.dart';

void main(){
  runApp(CreateMeet());
}


class CreateMeet extends StatelessWidget {
  final _meetkey = GlobalKey<FormState>();
  late String subject;
  late String agenda;
  late String participants;
  late String category;
  late String time;
  late String Noparticipants;
  late String date;
  late String location;
  late String meetID;
  late String uId;

  String getCurrentUserId() {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      String Useruid = user.uid;
      return Useruid;
    } else {
      return '';
    }
  }


  // String? pdfPath;

  // Future<void> handlePDFSelection(BuildContext context) async {
  //   try {
  //     FilePickerResult? result = await FilePicker.platform.pickFiles(
  //       type: FileType.custom,
  //       allowedExtensions: ['pdf'],
  //     );
  //
  //     if (result != null && result.files.isNotEmpty) {
  //       PlatformFile file = result.files.first;
  //       pdfPath = file.path;
  //       Get.snackbar("Success","$pdfPath");
  //     }
  //   } catch (e) {
  //     // Error handling
  //     Get.snackbar("Error","'Error selecting PDF: $e'");
  //     print('Error selecting PDF: $e');
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(body: SingleChildScrollView(
      child: Form(
        key: _meetkey,
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
              TextFormField(
                onChanged: (value){
                  subject=value;
                },
                validator: (value) {
                  if (value!.isEmpty){
                    return "Enter Subject";
                  } else {
                    return null;
                  }
                },decoration: kTextFieldCreate.copyWith(hintText: "Enter Subject"),),
              SizedBox(height: 15,),
              Text("Meet ID: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              TextFormField(
                onChanged: (value){
                  meetID=value;
                },
                validator: (value) {
                if (value!.isEmpty){
                  return "Enter Meet ID";
                } else {
                  return null;
                }
              },decoration: kTextFieldCreate.copyWith(hintText: "Enter Meet ID "),),
              SizedBox(height: 15,),
              Text("Location: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              TextFormField(
                onChanged: (value){
                  location=value;
                },
                validator: (value) {
                if (value!.isEmpty){
                  return "Enter Location";
                } else {
                  return null;
                }
              },decoration: kTextFieldCreate.copyWith(hintText: "Enter Location"),),
              SizedBox(height: 15,),
              Text("Date: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              TextFormField(
                onChanged: (value){
                  date=value;
                },
                validator: (value) {
                if (value!.isEmpty){
                  return "Enter Date";
                } else {
                  return null;
                }
              },decoration: kTextFieldCreate.copyWith(hintText: "Enter Date (Formate : DD-MMM-YY)"),),
              SizedBox(height: 15,),
              const Text("Time: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              TextFormField(
                onChanged: (value){
                  time=value;
                },
                validator: (value) {
                if (value!.isEmpty){
                  return "Enter Time";
                } else {
                  return null;
                }
              },decoration: kTextFieldCreate.copyWith(hintText: "Enter Time"),),
              SizedBox(height: 15,),
              Text("Category: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              TextFormField(
                onChanged: (value){
                  category=value;
                },
                validator: (value) {
                if (value!.isEmpty){
                  return "Enter Category";
                } else {
                  return null;
                }
              },decoration: kTextFieldCreate.copyWith(hintText: "Enter Category"),),
              SizedBox(height: 15,),
              Text("Number Of participants: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              TextFormField(
                onChanged: (value){
                  Noparticipants=value;
                },
                validator: (value) {
                if (value!.isEmpty){
                  return "Enter the number participants";
                } else {
                  return null;
                }
              },decoration: kTextFieldCreate.copyWith(hintText: "Enter Number of participants "),),
              SizedBox(height: 15,),
              Text("Participants: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              TextFormField(
                onChanged: (value){
                  participants=value;
                },
                validator: (value) {
                if (value!.isEmpty){
                  return "Enter the participants";
                } else {
                  return null;
                }
              },maxLines: 5,decoration: kTextFieldCreate.copyWith(hintText: "Enter participants Names here", ),),
              SizedBox(height: 15,),
              Text("Agenda: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              TextFormField(
                onChanged: (value){
                  agenda=value;
                },
                validator: (value) {
                if (value!.isEmpty){
                  return "Enter agenda";
                } else {
                  return null;
                }
              },maxLines: 10,decoration: kTextFieldCreate.copyWith(hintText: "Type Agenda Here", ),),
              SizedBox(height: 15),
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
                      if (_meetkey.currentState!.validate()) {
                        // Perform registration logic here
                        uId = getCurrentUserId();

                        // Store data in Firestore
                        FirebaseFirestore firestore = FirebaseFirestore.instance;
                        CollectionReference meetsCollection = firestore.collection('Meet');

                        meetsCollection.add({
                          'subject': subject,
                          'agenda': agenda,
                          'participants': participants,
                          'category': category,
                          'time': time,
                          'Number of participants': Noparticipants,
                          'date': date,
                          'location': location,
                          'meetID': meetID,
                          'uId': uId,
                        }).then((value) {
                          // Data successfully stored in Firestore
                          Get.snackbar("Success", "Meet Created and Stored successfully");
                          Get.offAll(()=>Home());
                        }).catchError((error) {
                          // Error occurred while storing data
                          Get.snackbar("Error",'Failed to store data in Firestore: $error');
                          print('Failed to store data in Firestore: $error');
                        });
                      }
                    },

                  child: Text("Submit and Create ",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        ),
      ),
    ),),);
  }
}
