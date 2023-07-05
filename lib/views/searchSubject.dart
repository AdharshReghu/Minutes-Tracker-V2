import 'package:flutter/material.dart';
import 'package:minutes_tracker/constants/constants.dart';
import 'package:get/get.dart';
import 'package:minutes_tracker/models/meetingCardModel.dart';

import '../models/meetingList.dart';

void main() {
  runApp(SearchSub());
}

class SearchSub extends StatelessWidget {
  const SearchSub({Key? key}) : super(key: key);

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
                      "Search With Subject Name",
                      style: kBlackHeadingSize,
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Icon(Icons.search, size: 50, color: kMaintheme),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            decoration: kTextFieldCreate.copyWith(
                              hintText: "Enter Subject name here",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
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
