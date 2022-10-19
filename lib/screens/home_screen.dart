import 'package:SummaryDo/components/rekap_image_field.dart';
import 'package:SummaryDo/components/rekap_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../components/rekap_text.dart';
import '../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController extractedTextController = TextEditingController();
  TextEditingController summarizedTextController = TextEditingController();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 90,
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   boxShadow: [
                //     BoxShadow(
                //       color: Colors.grey.withOpacity(0.5),
                //       spreadRadius: 0,
                //       blurRadius: 3.5,
                //       offset: Offset(0, 3),
                //     ),
                //   ],
                // ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset('assets/images/logo.png', scale: 3),
                          SizedBox(width: 5),
                          RekapText(
                            'powered by',
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                          ),
                          RekapText(
                            ' Sarmadi',
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          RekapText(
                            'Home',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(width: 50),
                          RekapText(
                            'How it works?',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(width: 50),
                          RekapText(
                            'About us',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(width: 50),
                          Container(
                            width: 175,
                            height: 50,
                            decoration: BoxDecoration(
                              color: kSarmadiBlackColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: RekapText(
                                'Contact us',
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Summarize',
                    style: TextStyle(
                      color: kSarmadiBlackColor,
                      fontSize: 70,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Pinyon',
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(width: 20),
                  RekapText(
                    'any',
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(width: 15),
                  Text(
                    'text',
                    style: TextStyle(
                      color: kSarmadiBlackColor,
                      fontSize: 70,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Pinyon',
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(width: 35),
                  RekapText(
                    'from any given',
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(width: 20),
                  Text(
                    'picture',
                    style: TextStyle(
                      color: kSarmadiBlackColor,
                      fontSize: 70,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Pinyon',
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(
                color: Colors.grey,
                thickness: 2,
                indent: 400,
                endIndent: 400,
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RekapText(
                            'Media',
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(height: 10),
                          RekapImageField(
                            getImage: (pickedImage) {
                              setState(() {
                                image = pickedImage;
                              });
                            },
                            deleteImage: () {
                              setState(() {
                                image = null;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RekapText(
                                'Extracted Text',
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(height: 10),
                              RekapTextField(
                                controller: extractedTextController,
                                maxLines: 7,
                              ),
                            ],
                          ),
                          SizedBox(height: 29),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RekapText(
                                'Summarized Text',
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(height: 10),
                              RekapTextField(
                                controller: summarizedTextController,
                                maxLines: 7,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
