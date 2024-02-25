import 'package:flutter/material.dart';



// dark theme palette
const Color Dbrown2 = Color(0xFF393E46);
const Color Dcream = Color(0xFFFFD369);
const Color Dbrown3 = Color(0xFF423D37);
const Color Dbrown1 = Color(0xFF222831);
const Color Ddisable = Color(0xB3EEEEEE);
const Color dashboard = Color(0xFF35383D);
// light theme palette
const Color Lpurple1 = Color(0xFF7F669D);
const Color Lpurple3 = Color(0xFFDEBACE);
const Color Lpurple2 = Color(0xFFBA94D1);
const Color Lcream = Color(0xFFFBFACD);
const Color Ldisable = Color(0xFF917C92);
const Color Ldisablef = Color(0xFFC5A9C5);
const Color Lgrey = Color(0x63848282);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide( width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide( width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

dialogueBox(BuildContext context, String text) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(text),
    ),
  );
}
