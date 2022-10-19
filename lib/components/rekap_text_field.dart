import 'package:SummaryDo/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RekapTextField extends StatefulWidget {
  final String? innerText;
  final TextEditingController controller;
  final int maxLines;

  const RekapTextField({
    super.key,
    this.innerText,
    required this.maxLines,
    required this.controller,
  });

  @override
  State<RekapTextField> createState() => _RekapTextFieldState();
}

class _RekapTextFieldState extends State<RekapTextField> {
  @override
  void initState() {
    super.initState();
    widget.controller.text = widget.innerText ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: widget.maxLines,
      keyboardType: TextInputType.multiline,
      controller: widget.controller,
      style: const TextStyle(
        color: kSarmadiBlackColor,
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
      ),
      cursorColor: kRekapPurpleColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
        border: inputBorder(), //normal border
        enabledBorder: inputBorder(), //enabled border
        focusedBorder: focusedBorder(), //focused border
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
