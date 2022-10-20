import 'dart:io';

import 'package:SummaryDo/components/rekap_text.dart';
import 'package:SummaryDo/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class RekapImageField extends StatefulWidget {
  XFile? image;
  final Function getImage;
  final Function deleteImage;
  RekapImageField({
    super.key,
    this.image,
    required this.getImage,
    required this.deleteImage,
  });

  @override
  State<RekapImageField> createState() => _RekapImageFieldState();
}

class _RekapImageFieldState extends State<RekapImageField> {
  bool uploaded = false;
  ImagePicker picker = ImagePicker();
  XFile? pickedImage;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
        border: inputBorder(), //normal border
        enabledBorder: inputBorder(), //enabled border
        focusedBorder: focusedBorder(), //focused border
      ),
      child: Container(
        height: 504,
        decoration: widget.image == null
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white)
            : BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: FileImage(File(widget.image!.path)),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
        child: Row(
          mainAxisAlignment: widget.image == null
              ? MainAxisAlignment.spaceEvenly
              : MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () async {
                pickedImage =
                    await picker.pickImage(source: ImageSource.camera);
                widget.getImage(pickedImage);
                setState(() {
                  uploaded = true;
                });
              },
              child: widget.image == null

                  ? SizedBox(
                      width: 350,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Center(
                              child: Icon(
                                CupertinoIcons.camera,
                                color: Colors.grey,
                                size: 50,
                              ),
                            ),
                          ),
                          RekapText(
                            'Take a pic from your device\'s camera',
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    )
                  : Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          widget.deleteImage();
                          setState(() {
                            uploaded = false;
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child:
                              Icon(CupertinoIcons.xmark, color: Colors.orange),
                        ),
                      ),
                    ),
            ),
            Visibility(
              visible: widget.image == null,

              child: VerticalDivider(
                thickness: 1,
                indent: 50,
                endIndent: 50,
                color: Colors.grey,
              ),
            ),
            InkWell(
              onTap: () async {
                pickedImage =
                    await picker.pickImage(source: ImageSource.gallery);
                widget.getImage(pickedImage);
                setState(() {
                  uploaded = true;
                });
              },
              child: widget.image == null

                  ? SizedBox(
                      width: 350,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Center(
                              child: Icon(
                                CupertinoIcons.photo,
                                color: Colors.grey,
                                size: 50,
                              ),
                            ),
                          ),
                          RekapText(
                            'Upload a pic from your device\'s gallary',
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}

OutlineInputBorder inputBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(
      color: Colors.transparent,
      width: 2,
    ),
  );
}

OutlineInputBorder focusedBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(
      color: kRekapPurpleColor,
      width: 2,
    ),
  );
}
