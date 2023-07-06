import 'package:flutter/material.dart';
import 'package:minutes_tracker/constants/constants.dart';
import 'package:get/get.dart';
import 'package:minutes_tracker/models/meetingCardModel.dart';
import '../models/meetingList.dart';

class SearchID extends StatelessWidget {
   SearchID({Key? key}) : super(key: key);
  final _searchkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Align(
                    child: Text(
                      "Search",
                      style: kBlackHeadingSize,
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(height: 50),
                  Align(alignment: Alignment.topLeft,child: Text("Search with MeetId or Date(DD-MMM-YY) or subject",style: kGreyTextStyle,)),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: Form(
                            key: _searchkey,
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty){
                                  return "Enter Date,Subject or MeetID to search!";
                                } else {
                                  return null;
                                }
                              },
                              decoration: kTextFieldCreate.copyWith(
                                hintText: "Enter search term here",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(child: Icon(Icons.search,size: 50,color: kMaintheme,),onTap: (){if (_searchkey.currentState!.validate()) {}})
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 500,
                    width: double.infinity,
                    child: PageView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: meetingCards.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 500,child: meetings(),);

                  },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}
