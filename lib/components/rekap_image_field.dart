import 'dart:io';

import 'package:SummaryDo/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class RekapImageField extends StatefulWidget {
  XFile? image;
  final Function getImage;
  final Function deleteImage;
  RekapImageField({
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
        child: Column(
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
                      child: Center(
                        child: Icon(
                          CupertinoIcons.camera,
                          color: Colors.grey,
                          size: 50,
                        ),
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
              child: Divider(
                thickness: 1,
                indent: 30,
                endIndent: 30,
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
                print('yes');
              },
              child: widget.image == null
                  ? SizedBox(
                      child: Center(
                        child: Icon(
                          CupertinoIcons.photo,
                          color: Colors.grey,
                          size: 50,
                        ),
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
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(
      color: Colors.transparent,
      width: 2,
    ),
  );
}

OutlineInputBorder focusedBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(
      color: kRekapPurpleColor,
      width: 2,
    ),
  );
}
